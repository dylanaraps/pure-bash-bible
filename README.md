<h1 align="center">pure bash</h1> <p align="center">A [WIP] collection of
pure bash alternatives to external processes.</p>

The goal of this repository is to document known and unknown methods of
doing various tasks using only built-in bash features. Using the snippets
from this guide can help to remove unneeded dependencies from your scripts
and in most cases make them that little bit faster. I came across these
tips and discovered a few while developing
[neofetch](https://github.com/dylanaraps/neofetch),
[pxltrm](https://github.com/dylanaraps/pxltrm) and some other smaller
projects.

This repository is open to contribution. If you see something that is
incorrectly described, buggy or outright wrong, open an issue or send a
pull request. If you know a handy snippet that is not included in this
list, send a pull request!

**NOTE**: Error handling (*checking if a file exists, etc*) is not
included. These are meant to be snippets you can incorporate into your
scripts and not full blown utilities.


## Table of Contents

<!-- vim-markdown-toc GFM -->

* [File handling](#file-handling)
    * [Read a file to a string.](#read-a-file-to-a-string)
    * [Read a file to an array (*by line*).](#read-a-file-to-an-array-by-line)
    * [Get the first N lines of a file.](#get-the-first-n-lines-of-a-file)
    * [Get the last N lines of a file.](#get-the-last-n-lines-of-a-file)
    * [Get the number of lines in a file.](#get-the-number-of-lines-in-a-file)
* [Strings](#strings)
    * [Split a string on a delimiter.](#split-a-string-on-a-delimiter)
    * [Get the directory name of a file path.](#get-the-directory-name-of-a-file-path)
    * [Change a string to lowercase.](#change-a-string-to-lowercase)
    * [Change a string to uppercase.](#change-a-string-to-uppercase)
    * [Trim quotes from a string.](#trim-quotes-from-a-string)
* [Arrays](#arrays)
    * [Reverse an array.](#reverse-an-array)
* [Colors](#colors)
    * [Convert a hex color to RGB.](#convert-a-hex-color-to-rgb)
    * [Convert an RGB color to hex.](#convert-an-rgb-color-to-hex)
* [Information about the terminal.](#information-about-the-terminal)
    * [Get the terminal size in lines and columns (*from a script*).](#get-the-terminal-size-in-lines-and-columns-from-a-script)
    * [Get the terminal size in pixels.](#get-the-terminal-size-in-pixels)
    * [Get the current cursor position.](#get-the-current-cursor-position)
* [Miscellaneous](#miscellaneous)
    * [Get the current date using `strftime`.](#get-the-current-date-using-strftime)

<!-- vim-markdown-toc -->


## File handling

### Read a file to a string.

Alternative to the `cat` command.

```sh
file_data="$(<"file")"
```

### Read a file to an array (*by line*).

Alternative to the `cat` command.

```sh
IFS=$'\n' read -d "" -ra file_data < "file"
```

### Get the first N lines of a file.

Alternative to the `head` command.

**NOTE:** Requires `bash` 4+

```sh
head() {
    # Usage: head "n" "file"
    mapfile -tn "$1" line < "$2"
    printf '%s\n' "${line[@]}"
}
```

### Get the last N lines of a file.

Alternative to the `tail` command.

**NOTE:** Requires `bash` 4+

```sh
tail() {
    # Usage: tail "n" "file"
    mapfile -tn 0 line < "$2"
    printf '%s\n' "${line[@]: -$1}"
}
```

### Get the number of lines in a file.

Alternative to `wc -l`.

**NOTE:** Requires `bash` 4+

```sh
lines() {
    # Usage lines "file"
    mapfile -tn 0 lines < "$1"
    printf '%s\n' "${#lines[@]}"
}
```


## Strings


### Split a string on a delimiter.

```sh
# To multiple variables.
string="1,2,3"
IFS=, read -r var1 var2 var3 <<< "$string"

# To an array.
IFS=, read -ra vars <<< "$string"
```

### Get the directory name of a file path.

Alternative to the `dirname` command.

```sh
dirname() {
    # Usage: dirname "path"
    printf '%s\n' "${1%/*}/"
}
```

### Change a string to lowercase.

**NOTE:** Requires `bash` 4+

```sh
lower() {
    # Usage: lower "string"
    printf '%s\n' "${1,,}"
}
```

### Change a string to uppercase.

**NOTE:** Requires `bash` 4+

```sh
upper() {
    # Usage: upper "string"
    printf '%s\n' "${1^^}"
}
```

### Trim quotes from a string.

```sh
trim_quotes() {
    # Usage: trim_quotes "string"
    : "${1//\'}"
    printf "%s\\n" "${_//\"}"
}
```

## Arrays

### Reverse an array.

Enabling `extdebug` allows access to the `BASH_ARGV` array which stores
the current function’s arguments in reverse.

```sh
reverse_array() {
    # Usage: reverse_array "array"
    #        reverse_array 1 2 3 4 5 6
    shopt -s extdebug
    f()(printf '%s ' "${BASH_ARGV[@]}"); f "$@"
    shopt -u extdebug

    printf '\n'
}
```

## Colors

### Convert a hex color to RGB.

```sh
hex_to_rgb() {
    # Usage: hex_to_rgb "#FFFFFF"
    ((r=16#${1:1:2}))
    ((g=16#${1:3:2}))
    ((b=16#${1:5:6}))

    printf '%s\n' "$r $g $b"
}
```

### Convert an RGB color to hex.

```sh
rgb_to_hex() {
    # Usage: rgb_to_hex "r" "g" "b"
    printf '#%02x%02x%02x\n' "$1" "$2" "$3"
}
```

## Information about the terminal.

### Get the terminal size in lines and columns (*from a script*).

This is handy when writing scripts in pure bash and `stty`/`tput` can’t be
called.

```sh
get_term_size() {
    # Usage: get_term_size

    # (:;:) is a micro sleep to ensure the variables are
    # exported immediately.
    shopt -s checkwinsize; (:;:)
    printf '%s\n' "$LINES $COLUMNS"
}
```

### Get the terminal size in pixels.

**NOTE**: This does not work in some terminal emulators.

```sh
get_window_size() {
    # Usage: get_window_size
    printf '%b' "${TMUX:+\\ePtmux;\\e}\\e[14t${TMUX:+\\e\\\\}"
    IFS=';t' read -d t -t 0.05 -sra term_size
    printf '%s\n' "${term_size[1]}x${term_size[2]}"
}
```

### Get the current cursor position.

This is useful when creating a TUI in pure bash.

```sh
get_cursor_pos() {
    # Usage: get_cursor_pos
    IFS='[;' read -p $'\e[6n' -d R -rs _ y x _
    printf '%s\n' "$x $y"
}
```

## Miscellaneous

### Get the current date using `strftime`.

Bash’s `printf` has a built-in method of getting the date which we can use
in place of the `date` command in a lot of cases.

**NOTE:** Requires `bash` 4+

```sh
date() {
    # Usage: date "format"
    # See: 'man strftime' for format.
    printf "%($1)T\\n"
}
```


