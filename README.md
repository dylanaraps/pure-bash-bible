<h1 align="center">pure bash bible</h1> <p
align="center">A [WIP] collection of pure bash alternatives to external
processes.</p>

<br>

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

<br>

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [Strings](#strings)
    * [Trim white-space from string.](#trim-white-space-from-string)
    * [Split a string on a delimiter.](#split-a-string-on-a-delimiter)
    * [Change a string to lowercase.](#change-a-string-to-lowercase)
    * [Change a string to uppercase.](#change-a-string-to-uppercase)
    * [Trim quotes from a string.](#trim-quotes-from-a-string)
    * [Strip characters from start of string.](#strip-characters-from-start-of-string)
    * [Strip characters from end of string.](#strip-characters-from-end-of-string)
* [Arrays](#arrays)
    * [Reverse an array.](#reverse-an-array)
    * [Remove duplicate array elements.](#remove-duplicate-array-elements)
    * [Cycle through an array.](#cycle-through-an-array)
    * [Toggle between two values.](#toggle-between-two-values)
* [File handling](#file-handling)
    * [Read a file to a string.](#read-a-file-to-a-string)
    * [Read a file to an array (*by line*).](#read-a-file-to-an-array-by-line)
    * [Get the first N lines of a file.](#get-the-first-n-lines-of-a-file)
    * [Get the last N lines of a file.](#get-the-last-n-lines-of-a-file)
    * [Get the number of lines in a file.](#get-the-number-of-lines-in-a-file)
    * [Iterate over files.](#iterate-over-files)
    * [Count files or directories in directory.](#count-files-or-directories-in-directory)
    * [Create an empty file.](#create-an-empty-file)
* [File Paths](#file-paths)
    * [Get the directory name of a file path.](#get-the-directory-name-of-a-file-path)
    * [Get the base-name of a file path.](#get-the-base-name-of-a-file-path)
* [Arithmetic](#arithmetic)
    * [Simpler syntax to set variables.](#simpler-syntax-to-set-variables)
    * [Ternary tests.](#ternary-tests)
* [Colors](#colors)
    * [Convert a hex color to RGB.](#convert-a-hex-color-to-rgb)
    * [Convert an RGB color to hex.](#convert-an-rgb-color-to-hex)
* [Information about the terminal](#information-about-the-terminal)
    * [Get the terminal size in lines and columns (*from a script*).](#get-the-terminal-size-in-lines-and-columns-from-a-script)
    * [Get the terminal size in pixels.](#get-the-terminal-size-in-pixels)
    * [Get the current cursor position.](#get-the-current-cursor-position)
* [Code Golf](#code-golf)
    * [Shorter `for` loop syntax.](#shorter-for-loop-syntax)
    * [Shorter infinite loops.](#shorter-infinite-loops)
    * [Shorter function declaration.](#shorter-function-declaration)
    * [Shorter `if` syntax.](#shorter-if-syntax)
    * [Simpler `case` statement to set variable.](#simpler-case-statement-to-set-variable)
* [Miscellaneous](#miscellaneous)
    * [Get the current date using `strftime`.](#get-the-current-date-using-strftime)
    * [Bypass shell aliases and functions.](#bypass-shell-aliases-and-functions)
* [Internal Variables](#internal-variables)

<!-- vim-markdown-toc -->

## Strings


### Trim white-space from string.

**NOTE**: This also truncates multiple spaces inside the string.

```sh
# shellcheck disable=SC2086,SC2048
trim() {
    # Usage: trim "   example   string    "
    set -f
    set -- $*
    printf '%s\n' "$*"
    set +f
}
```

### Split a string on a delimiter.

```sh
# To multiple variables.
string="1,2,3"
IFS=, read -r var1 var2 var3 <<< "$string"

# To an array.
IFS=, read -ra vars <<< "$string"
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

### Strip characters from start of string.

```sh
lstrip() {
    # Usage: lstrip "string" "chars to remove"
    printf '%s\n' "${1##$2}"
}
```

### Strip characters from end of string.

```sh
rstrip() {
    # Usage: rstrip "string" "chars to remove"
    printf '%s\n' "${1%%$2}"
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

### Remove duplicate array elements.

Create a temporary associative array. When setting associative array
values and a duplicate assignment occurs, bash overwrites the key. This
allows us to effectively remove array duplicates.

**NOTE:** Requires `bash` 4+

```sh
remove_array_dups() {
    # Usage: remove_array_dups "array"
    declare -A tmp_array

    for i in "$@"; do
        [[ "$i" ]] && IFS=" " tmp_array["${i:- }"]=1
    done

    printf '%s\n' "${!tmp_array[@]}"
}
```

### Cycle through an array.

Each time the `printf` is called, the next array element is printed. When
the print hits the last array element it starts from the first element
again.

```sh
arr=(a b c d)
printf '%s\n' "${arr[$((i==${#arr[@]}-1?i=0:++i))]}"
```


### Toggle between two values.

This works the same as above, this is just a different use case.

```sh
arr=(true false)
printf '%s\n' "${arr[$((i==${#arr[@]}-1?i=0:++i))]}"
```



## File handling

### Read a file to a string.

Alternative to the `cat` command.

```sh
file_data="$(<"file")"
```

### Read a file to an array (*by line*).

Alternative to the `cat` command.

```sh
# Bash <4
IFS=$'\n' read -d "" -ra file_data < "file"

# Bash 4+
mapfile -t file_data < "file"
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

### Iterate over files.

Don’t use `ls`.

```sh
# Greedy example.
for file in *; do
    printf '%s\n' "$file"
done

# PNG files in dir.
for file in ~/Pictures/*.png; do
    printf '%s\n' "$file"
done

# Iterate over directories.
for dir in ~/Downloads/; do
    printf '%s\n' "$dir"
done

# Iterate recursively.
shopt -s globstar
for file in ~/Pictures/**/*; do
    printf '%s\n' "$file"
done
shopt -u globstar
```

### Count files or directories in directory.

This works by passing the output of the glob as function arguments. We
then count the arguments and print the number.

```sh
count() {
    # Usage: count /path/to/dir/*
    #        count /path/to/dir/*/
    printf '%s\n' "$#"
}
```

### Create an empty file.

Alternative to `touch`.

```sh
:> file

# Longer alternatives:
echo -n > file
printf '' > file
```

## File Paths

### Get the directory name of a file path.

Alternative to the `dirname` command.

```sh
dirname() {
    # Usage: dirname "path"
    printf '%s\n' "${1%/*}/"
}
```

### Get the base-name of a file path.

Alternative to the `basename` command.

```sh
basename() {
    # Usage: basename "path"
    : "${1%/}"
    printf '%s\n' "${_##*/}"
}
```

## Arithmetic

### Simpler syntax to set variables.

```sh
# Simple math
((var=1+2))

# Decrement/Increment variable
((var++)
((var--))
((var+=1))
((var-=1))

# Using variables
((var=var2*arr[2]))
```

### Ternary tests.

```sh
# Set the value of var to var2 if var2 is greater than var.
# var: variable to set.
# var2>var: Condition to test.
# ?var2: If the test succeeds.
# :var: If the test fails.
((var=var2>var?var2:var))
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

## Information about the terminal

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

## Code Golf

### Shorter `for` loop syntax.

```sh
# Tiny C Style.
for((;i++<10;)){ echo "$i";}

# Undocumented method.
for i in {1..10};{ echo "$i";}

# Expansion.
for i in {1..10}; do echo "$i"; done

# C Style.
for((i=0;i<=10;i++)); do echo "$i"; done
```

### Shorter infinite loops.

```sh
# Normal method
while :; do code; done

# Shorter
for((;;)){ code;}
```

### Shorter function declaration.

```sh
# Normal method
f(){ echo hi;}

# Using a subshell
f()(echo hi)

# Using arithmetic
# You can use this to assign integer values.
# Example: f a=1
#          f a++
f()(($1))

# Using tests, loops etc.
# Note: You can also use ‘while’, ‘until’, ‘case’, ‘(())’, ‘[[]]’.
f()if true; then echo "$1"; fi
f()for i in "$@"; do echo "$i"; done
```

### Shorter `if` syntax.

```sh
# One line
[[ "$var" == hello ]] && echo hi || echo bye
[[ "$var" == hello ]] && { echo hi; echo there; } || echo bye

# Multi line (no else, single statement)
[[ "$var" == hello ]] && \
    echo hi

# Multi line (no else)
[[ "$var" == hello ]] && {
    echo hi
    # ...
}
```

### Simpler `case` statement to set variable.

We can use the `:` builtin to avoid repeating `variable=` in a case
statement. The `$_` variable stores the last argument of the last
successful command. `:` always succeeds so we can abuse it to store the
variable value.

```sh
# Example snippet from Neofetch.
case "$(uname)" in
    "SunOS"):    "Solaris" ;;
    "Haiku"):    "Haiku" ;;
    "MINIX"):    "MINIX" ;;
    "AIX"):      "AIX" ;;
    "IRIX"*):    "IRIX" ;;
    "FreeMiNT"): "FreeMiNT" ;;

    "Linux" | "GNU"*)
        : "Linux"
    ;;

    *"BSD" | "DragonFly" | "Bitrig")
        : "BSD"
    ;;

    "CYGWIN"* | "MSYS"* | "MINGW"*)
        : "Windows"
    ;;

    *)
        printf '%s\n' "Unknown OS detected: '$kernel_name', aborting..." >&2
        printf '%s\n' "Open an issue on GitHub to add support for your OS." >&2
        exit 1
    ;;
esac

# Finally, set the variable.
os="$_"
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

# Examples:

# Using date.
date "+%a %d %b  - %l:%M %p"

# Using printf.
printf '%(%a %d %b  - %l:%M %p)T\n'

# Assigning a variable.
printf -v date '%(%a %d %b  - %l:%M %p)T\n'
```

### Bypass shell aliases and functions.

```sh
# alias
ls

# command
\ls
```

## Internal Variables

This will most likely be expanded here. In the meantime, see:
http://tldp.org/LDP/abs/html/internalvariables.html


