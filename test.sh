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

test_lstrip() {
    result="$(lstrip "!:IHello" "!:I")"
    assert_equals "$result" "Hello"
}

test_rstrip() {
    result="$(rstrip "Hello!:I" "!:I")"
    assert_equals "$result" "Hello"
}

test_reverse_array() {
    IFS=$'\n' read -d "" -ra result < <(reverse_array 1 2 3 4 5)
    assert_equals "${result[*]}" "5 4 3 2 1"
}

test_remove_array_dups() {
    IFS=$'\n' read -d "" -ra result < <(remove_array_dups 1 1 2 2 3 3 4 5)
    assert_equals "${result[*]}" "1 2 3 4 5"
}

test_cycle() {
    arr=(a b c d)
    result="$(cycle; cycle; cycle)"
    assert_equals "$result" "a b c "
}

assert_equals() {
    local status
    [[ "$1" == "$2" ]] && status="✔"
    printf '%s\n' "  ${status:-✖} : ${FUNCNAME[1]/test_}"
    [[ "$1" == "$2" ]] || { :>/tmp/err; return 1; } && return 0
}

main() {
    source <(awk '/```sh/{f=1;next}/```/{f=0}f' README.md) 2>/dev/null

    test_trim_string
    test_trim_all
    test_lower
    test_upper
    test_trim_quotes
    test_lstrip
    test_rstrip
    test_reverse_array
    test_remove_array_dups
    test_cycle

    [[ -f /tmp/err ]] || exit 0 && { rm /tmp/err; exit 1; }
}

main "$@"
