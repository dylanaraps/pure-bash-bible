#!/usr/bin/env bash
# shellcheck source=/dev/null disable=2178,2128
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

test_regex() {
    result="$(regex "#FFFFFF" '^(#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))$')"
    assert_equals "$result" "#FFFFFF"
}

test_lower() {
    result="$(lower "HeLlO")"
    assert_equals "$result" "hello"
}

test_upper() {
    result="$(upper "HeLlO")"
    assert_equals "$result" "HELLO"
}

test_reverse_case() {
    result="$(reverse_case "HeLlO")"
    assert_equals "$result" "hElLo"
}

test_trim_quotes() {
    result="$(trim_quotes "\"te'st' 'str'ing\"")"
    assert_equals "$result" "test string"
}

test_strip_all() {
    result="$(strip_all "The Quick Brown Fox" "[aeiou]")"
    assert_equals "$result" "Th Qck Brwn Fx"
}

test_strip() {
    result="$(strip "The Quick Brown Fox" "[aeiou]")"
    assert_equals "$result" "Th Quick Brown Fox"
}

test_lstrip() {
    result="$(lstrip "!:IHello" "!:I")"
    assert_equals "$result" "Hello"
}

test_rstrip() {
    result="$(rstrip "Hello!:I" "!:I")"
    assert_equals "$result" "Hello"
}

test_urlencode() {
    result="$(urlencode "https://github.com/dylanaraps/pure-bash-bible")"
    assert_equals "$result" "https%3A%2F%2Fgithub.com%2Fdylanaraps%2Fpure-bash-bible"
}

test_urldecode() {
    result="$(urldecode "https%3A%2F%2Fgithub.com%2Fdylanaraps%2Fpure-bash-bible")"
    assert_equals "$result" "https://github.com/dylanaraps/pure-bash-bible"
}

test_reverse_array() {
    shopt -s compat44
    IFS=$'\n' read -d "" -ra result < <(reverse_array 1 2 3 4 5)
    assert_equals "${result[*]}" "5 4 3 2 1"
    shopt -u compat44
}

test_cycle() {
    # shellcheck disable=2034
    arr=(a b c d)
    result="$(cycle; cycle; cycle)"
    assert_equals "$result" "a b c "
}

test_head() {
    printf '%s\n%s\n\n\n' "hello" "world" > test_file
    result="$(head 2 test_file)"
    assert_equals "$result" $'hello\nworld'
}

test_tail() {
    printf '\n\n\n%s\n%s\n' "hello" "world" > test_file
    result="$(tail 2 test_file)"
    assert_equals "$result" $'hello\nworld'
}

test_lines() {
    printf '\n\n\n\n\n\n\n\n' > test_file
    result="$(lines test_file)"
    assert_equals "$result" "8"
}

test_lines_loop() {
    printf '\n\n\n\n\n\n\n\n' > test_file
    result="$(lines_loop test_file)"
    assert_equals "$result" "8"
}

test_count() {
    result="$(count ./{README.m,LICENSE.m,.travis.ym}*)"
    assert_equals "$result" "3"
}

test_dirname() {
    result="$(dirname "/home/black/Pictures/Wallpapers/1.jpg")"
    assert_equals "$result" "/home/black/Pictures/Wallpapers"

    result="$(dirname "/")"
    assert_equals "$result" "/"

    result="$(dirname "/foo")"
    assert_equals "$result" "/"

    result="$(dirname ".")"
    assert_equals "$result" "."

    result="$(dirname "/foo/foo")"
    assert_equals "$result" "/foo"

    result="$(dirname "something/")"
    assert_equals "$result" "."

    result="$(dirname "//")"
    assert_equals "$result" "/"

    result="$(dirname "//foo")"
    assert_equals "$result" "/"

    result="$(dirname "")"
    assert_equals "$result" "."

    result="$(dirname "something//")"
    assert_equals "$result" "."

    result="$(dirname "something/////////////////////")"
    assert_equals "$result" "."

    result="$(dirname "something/////////////////////a")"
    assert_equals "$result" "something"

    result="$(dirname "something//////////.///////////")"
    assert_equals "$result" "something"

    result="$(dirname "//////")"
    assert_equals "$result" "/"
}

test_basename() {
    result="$(basename "/home/black/Pictures/Wallpapers/1.jpg")"
    assert_equals "$result" "1.jpg"
}

test_hex_to_rgb() {
    result="$(hex_to_rgb "#FFFFFF")"
    assert_equals "$result" "255 255 255"

    result="$(hex_to_rgb "000000")"
    assert_equals "$result" "0 0 0"
}

test_rgb_to_hex() {
    result="$(rgb_to_hex 0 0 0)"
    assert_equals "$result" "#000000"
}

test_date() {
    result="$(date "%C")"
    assert_equals "$result" "20"
}

test_read_sleep() {
    result="$((SECONDS+1))"
    read_sleep 1
    assert_equals "$result" "$SECONDS"
}

test_bar() {
    result="$(bar 50 10)"
    assert_equals "${result//$'\r'}" "[-----     ]"
}

test_get_functions() {
    IFS=$'\n' read -d "" -ra functions < <(get_functions)
    assert_equals "${functions[0]}" "assert_equals"
}

test_extract() {
    printf '{\nhello, world\n}\n' > test_file
    result="$(extract test_file "{" "}")"
    assert_equals "$result" "hello, world"
}

test_split() {
    IFS=$'\n' read -d "" -ra result < <(split "hello,world,my,name,is,john" ",")
    assert_equals "${result[*]}" "hello world my name is john"
}

assert_equals() {
    if [[ "$1" == "$2" ]]; then
        ((pass+=1))
        status=$'\e[32m✔'
    else
        ((fail+=1))
        status=$'\e[31m✖'
        local err="(\"$1\" != \"$2\")"
    fi

    printf ' %s\e[m | %s\n' "$status" "${FUNCNAME[1]/test_} $err"
}

main() {
    trap 'rm readme_code test_file' EXIT

    # Extract code blocks from the README.
    while IFS=$'\n' read -r line; do
        [[ "$code" && "$line" != \`\`\` ]] && printf '%s\n' "$line"
        [[ "$line" =~ ^\`\`\`sh$ ]] && code=1
        [[ "$line" =~ ^\`\`\`$ ]]   && code=
    done < README.md > readme_code

    # Run shellcheck and source the code.
    shellcheck -s bash readme_code test.sh build.sh || exit 1
    . readme_code

    head="-> Running tests on the Pure Bash Bible.."
    printf '\n%s\n%s\n' "$head" "${head//?/-}"

    # Generate the list of tests to run.
    IFS=$'\n' read -d "" -ra funcs < <(declare -F)
    for func in "${funcs[@]//declare -f }"; do
        [[ "$func" == test_* ]] && "$func";
    done

    comp="Completed $((fail+pass)) tests. ${pass:-0} passed, ${fail:-0} failed."
    printf '%s\n%s\n\n' "${comp//?/-}" "$comp"

    # If a test failed, exit with '1'.
    ((fail>0)) || exit 0 && exit 1
}

main "$@"
