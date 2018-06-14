#!/usr/bin/env bash
#
# Tests for the Pure Bash Bible.

test_trim_string() {
    result="$(trim_string "    Hello,    World    ")"
    assert_equals "$result" "Hello,    World"
}

test_trim_all() {
    result="$(trim_all "    Hello,    World    ")"
    assert_equals "$result" "Hello, World"
}

test_lower() {
    result="$(lower "HeLlO")"
    assert_equals "$result" "hello"
}

test_upper() {
    result="$(upper "HeLlO")"
    assert_equals "$result" "HELLO"
}

test_trim_quotes() {
    result="$(trim_quotes "\"te'st' 'str'ing\"")"
    assert_equals "$result" "test string"
}

assert_equals() {
    # Test equality.
    local status
    [[ "$1" == "$2" ]] && status="✔"
    printf '%s\n' "  ${status:-✖} : ${FUNCNAME[1]}"
    [[ "$1" == "$2" ]] || { :>/tmp/err; return 1; } && return 0
}

main() {
    source <(awk '/```sh/{f=1;next}/```/{f=0}f' README.md) 2>/dev/null

    test_trim_string
    test_trim_all
    test_lower
    test_upper
    test_trim_quotes

    [[ -f /tmp/err ]] || exit 0 && { rm /tmp/err; exit 1; }
}

main "$@"

