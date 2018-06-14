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

test_head() {
    printf '%s\n%s\n\n\n' "hello" "world" > test_file
    result="$(head 2 test_file)"
    assert_equals "$result" $'hello\nworld'
    rm test_file
}

test_tail() {
    printf '\n\n\n%s\n%s\n' "hello" "world" > test_file
    result="$(tail 2 test_file)"
    assert_equals "$result" $'hello\nworld'
    rm test_file
}

test_count() {
    result="$(count ./{README.m,LICENSE.m,.travis.ym}*)"
    assert_equals "$result" "3"
}

test_dirname() {
    result="$(dirname "/home/black/Pictures/Wallpapers/1.jpg")"
    assert_equals "$result" "/home/black/Pictures/Wallpapers/"
}

test_basename() {
    result="$(basename "/home/black/Pictures/Wallpapers/1.jpg")"
    assert_equals "$result" "1.jpg"
}

test_hex_to_rgb() {
    result="$(hex_to_rgb "#FFFFFF")"
    assert_equals "$result" "255 255 255"
}

test_rgb_to_hex() {
    result="$(rgb_to_hex 0 0 0)"
    assert_equals "$result" "#000000"
}

test_date() {
    result="$(date "%C")"
    assert_equals "$result" "20"
}

assert_equals() {
    local status

    ((tests+=1))

    [[ "$1" == "$2" ]] && status="✔"
    printf '%s\n' " ${status:-✖} | ${FUNCNAME[1]/test_}"

    if [[ "$1" == "$2" ]]; then
        ((pass+=1))
        return 0
    else
        :>/tmp/err
        ((err+=1))
        return 1
    fi
}

main() {
    source <(awk '/```sh/{f=1;next}/```/{f=0}f' README.md) 2>/dev/null

    head="-> Running tests on the Pure Bash Bible.."
    printf '\n%s\n%s\n' "$head" "${head//?/-}"

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
    test_head
    test_tail
    test_count
    test_dirname
    test_basename
    test_hex_to_rgb
    test_rgb_to_hex
    test_date

    comp="Completed $tests tests. ${pass:-0} passed, ${err:-0} errored."
    printf '%s\n%s\n\n' "${comp//?/-}" "$comp"

    [[ -f /tmp/err ]] || exit 0 && { rm /tmp/err; exit 1; }
}

main "$@"
