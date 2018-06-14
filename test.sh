#!/usr/bin/env bash
#
# Tests for the Pure Bash Bible.

assert_equals() {
    # Test equality.
    local status
    [[ "$1" == "$2" ]] && status="✔"
    printf '%s\n' "  ${status:-✖} : ${FUNCNAME[1]}"
    [[ "$1" == "$2" ]] || { :>/tmp/err; return 1; } && return 0
}

test_trim() {
    result="$(trim "    Hello,    World    ")"
    assert_equals "$result" "Hello,    World"
}

main() {
    source <(awk '/```sh/{f=1;next}/```/{f=0}f' README.md) 2>/dev/null

    test_trim

    [[ -f /tmp/err ]] || exit 0 && { rm /tmp/err; exit 1; }
}

main "$@"

