#!/usr/bin/env bash

# Functions from:
# https://github.com/dylanaraps/pure-bash-bible

## Trim leading and trailing white-space from string
trim_string() {
    # Usage: trim_string "   example   string    "
    : "${1#"${1%%[![:space:]]*}"}"
    : "${_%"${_##*[![:space:]]}"}"
    printf '%s\n' "$_"
}

## Trim all white-space from string and truncate spaces

# This is an alternative to `sed`, `awk`, `perl` and other tools. The
# function below works by abusing word splitting to create a new string
# without leading/trailing white-space and with truncated spaces.

# shellcheck disable=SC2086,SC2048
trim_all() {
    # Usage: trim_all "   example   string    "
    set -f
    set -- $*
    printf '%s\n' "$*"
    set +f
}

## Use regex on a string

# The result of `bash`'s regex matching can be used to replace `sed` for a
# large number of use-cases.

# **CAVEAT**: This is one of the few platform dependant `bash` features.
# `bash` will use whatever regex engine is installed on the user's system.
# Stick to POSIX regex features if aiming for compatibility.

# **CAVEAT**: This example only prints the first matching group. When using
# multiple capture groups some modification is needed.
regex() {
    # Usage: regex "string" "regex"
    [[ $1 =~ $2 ]] && printf '%s\n' "${BASH_REMATCH[1]}"
}

is_hex_color() {
    # Usage:
    # read -r color
    # is_hex_color "$color" || color="#FFFFFF"
    if [[ "$1" =~ ^(#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))$ ]]; then
        printf '%s\n' "${BASH_REMATCH[1]}"
    else
        printf '%s\n' "error: $1 is an invalid color."
        return 1
    fi
}


## Split a string on a delimiter
# This is an alternative to `cut`, `awk` and other tools.
split() {
   # Usage: split "string" "delimiter"
   # Multi char delimiters work too!
   IFS=$'\n' read -d "" -ra arr <<< "${1//$2/$'\n'}"
   printf '%s\n' "${arr[@]}"
}


## Change a string to lowercase
# **CAVEAT:** Requires `bash` 4+
lower() {
    # Usage: lower "string"
    printf '%s\n' "${1,,}"
}

## Change a string to uppercase
# **CAVEAT:** Requires `bash` 4+
upper() {
    # Usage: upper "string"
    printf '%s\n' "${1^^}"
}

## Trim quotes from a string
trim_quotes() {
    # Usage: trim_quotes "string"
    : "${1//\'}"
    printf '%s\n' "${_//\"}"
}

## Strip all instances of pattern from string
```sh
strip_all() {
    # Usage: strip_all "string" "pattern"
    printf '%s\n' "${1//$2}"
}
```

# **Example Usage:**

# ```shell
# $ strip_all "The Quick Brown Fox" "[aeiou]"
# Th Qck Brwn Fx

# $ strip_all "The Quick Brown Fox" "[[:space:]]"
# TheQuickBrownFox

# $ strip_all "The Quick Brown Fox" "Quick "
# The Brown Fox
# ```

## Strip first occurrence of pattern from string
strip() {
    # Usage: strip "string" "pattern"
    printf '%s\n' "${1/$2}"
}

## Strip pattern from start of string
lstrip() {
    # Usage: lstrip "string" "pattern"
    printf '%s\n' "${1##$2}"
}

## Strip pattern from end of string
rstrip() {
    # Usage: rstrip "string" "pattern"
    printf '%s\n' "${1%%$2}"
}

reverse_array() {
    # Usage: reverse_array "array"
    shopt -s extdebug
    f()(printf '%s\n' "${BASH_ARGV[@]}"); f "$@"
    shopt -u extdebug
}

remove_array_dups() {
    # Usage: remove_array_dups "array"
    declare -A tmp_array

    for i in "$@"; do
        [[ "$i" ]] && IFS=" " tmp_array["${i:- }"]=1
    done

    printf '%s\n' "${!tmp_array[@]}"
}

random_array_element() {
    # Usage: random_array_element "array or multiple arguments"
    local arr=("$@")
    printf '%s\n' "${arr[RANDOM % $#]}"
}

cycle() {
    # Usage: cycle "array"
    local arr=("$@")
    printf '%s ' "${arr[${i:=0}]}"
    ((i=i>=${#arr[@]}-1?0:++i))
}

head() {
    # Usage: head "n" "file"
    mapfile -tn "$1" line < "$2"
    printf '%s\n' "${line[@]}"
}

tail() {
    # Usage: tail "n" "file"
    mapfile -tn 0 line < "$2"
    printf '%s\n' "${line[@]: -$1}"
}

lines() {
    # Usage: lines "file"
    # Alternative to `wc -l`
    mapfile -tn 0 lines < "$1"
    printf '%s\n' "${#lines[@]}"
}

lines_loop() {
    # Usage: lines_loop "file"
    count=0
    while IFS= read -r _; do
        ((count++))
    done < "$1"
    printf '%s\n' "$count"
}

# Extract code blocks from MarkDown file.
### $ extract ~/projects/pure-bash/README.md '```sh' '```'
extract() {
    # Usage: extract file "opening marker" "closing marker"
    ## Extract lines between two markers
    while IFS=$'\n' read -r line; do
        [[ "$extract" && "$line" != "$3" ]] && \
            printf '%s\n' "$line"

        [[ "$line" == "$2" ]] && extract=1
        [[ "$line" == "$3" ]] && extract=
    done < "$1"
}

## Get the directory name of a file path
### Alternative to the `dirname` command.
dirname() {
    # Usage: dirname "path"
    printf '%s\n' "${1%/*}/"
}

## Get the base-name of a file path
### Alternative to the `basename` command.
basename() {
    # Usage: basename "path"
    : "${1%/}"
    printf '%s\n' "${_##*/}"
}
