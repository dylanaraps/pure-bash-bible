<h1 align="center">pure bash bible</h1> <p
align="center">A [WIP] collection of pure bash alternatives to external
processes.</p>

<p align="center"> <a
href="https://travis-ci.com/dylanaraps/pure-bash-bible"><img
src="https://travis-ci.com/dylanaraps/pure-bash-bible.svg?branch=master"></a>
<a href="./LICENSE.md"><img
src="https://img.shields.io/badge/license-MIT-blue.svg"></a> </p>

<br>

The goal of this repository is to document known and unknown methods of
doing various tasks using only built-in bash features. Using the snippets
from this guide can help to remove unneeded dependencies from your scripts
and in most cases make them that little bit faster. I came across these
tips and discovered a few while developing
[neofetch](https://github.com/dylanaraps/neofetch),
[pxltrm](https://github.com/dylanaraps/pxltrm) and some other smaller
projects.

The snippets below are linted using `shellcheck` and tests have been
written where applicable. If you're looking to contribute, have a read of
the
[CONTRIBUTING.md](https://github.com/dylanaraps/pure-bash-bible/blob/master/CONTRIBUTING.md).
It outlines how the unit tests work and what's required when adding
snippets.

If you see something that is incorrectly described, buggy or outright
wrong, open an issue or send a pull request. If you know a handy snippet
that is not included in this list, contribute!

**NOTE**: Error handling (*checking if a file exists, etc*) is not
included. These are meant to be snippets you can incorporate into your
scripts and not full blown utilities.

<br>

# Table of Contents

<!-- vim-markdown-toc GFM -->

* [Strings](#strings)
    * [Trim leading and trailing white-space from string.](#trim-leading-and-trailing-white-space-from-string)
    * [Trim all white-space from string and truncate spaces.](#trim-all-white-space-from-string-and-truncate-spaces)
    * [Use REGEX on a string.](#use-regex-on-a-string)
    * [Split a string on a delimiter.](#split-a-string-on-a-delimiter)
    * [Change a string to lowercase.](#change-a-string-to-lowercase)
    * [Change a string to uppercase.](#change-a-string-to-uppercase)
    * [Trim quotes from a string.](#trim-quotes-from-a-string)
    * [Strip all instances of pattern from string.](#strip-all-instances-of-pattern-from-string)
    * [Strip first occurrence of pattern from string.](#strip-first-occurrence-of-pattern-from-string)
    * [Strip pattern from start of string.](#strip-pattern-from-start-of-string)
    * [Strip pattern from end of string.](#strip-pattern-from-end-of-string)
    * [Check if string contains a substring.](#check-if-string-contains-a-substring)
* [Variables](#variables)
    * [Assign and access a variable using a variable.](#assign-and-access-a-variable-using-a-variable)
* [Arrays](#arrays)
    * [Reverse an array.](#reverse-an-array)
    * [Remove duplicate array elements.](#remove-duplicate-array-elements)
    * [Cycle through an array.](#cycle-through-an-array)
    * [Toggle between two values.](#toggle-between-two-values)
* [Loops](#loops)
    * [Loop over a range of numbers.](#loop-over-a-range-of-numbers)
    * [Loop over a variable range of numbers.](#loop-over-a-variable-range-of-numbers)
    * [Loop over an array.](#loop-over-an-array)
    * [Loop over an array with an index.](#loop-over-an-array-with-an-index)
    * [Loop over the contents of a file.](#loop-over-the-contents-of-a-file)
    * [Loop over files and directories.](#loop-over-files-and-directories)
* [File handling](#file-handling)
    * [Read a file to a string.](#read-a-file-to-a-string)
    * [Read a file to an array (*by line*).](#read-a-file-to-an-array-by-line)
    * [Get the first N lines of a file.](#get-the-first-n-lines-of-a-file)
    * [Get the last N lines of a file.](#get-the-last-n-lines-of-a-file)
    * [Get the number of lines in a file.](#get-the-number-of-lines-in-a-file)
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
* [Internal Variables](#internal-variables)
    * [Get the location to the `bash` binary.](#get-the-location-to-the-bash-binary)
    * [Get the version of the current running `bash` process.](#get-the-version-of-the-current-running-bash-process)
    * [Open the user's preferred text editor.](#open-the-users-preferred-text-editor)
    * [Get the name of the current function.](#get-the-name-of-the-current-function)
    * [Get the host-name of the system.](#get-the-host-name-of-the-system)
    * [Get the architecture of the Operating System.](#get-the-architecture-of-the-operating-system)
    * [Get the name of the Operating System / Kernel.](#get-the-name-of-the-operating-system--kernel)
    * [Get the current working directory.](#get-the-current-working-directory)
    * [Get the number of seconds the script has been running.](#get-the-number-of-seconds-the-script-has-been-running)
* [Other](#other)
    * [Check if a program is in the user's PATH.](#check-if-a-program-is-in-the-users-path)
    * [Get the current date using `strftime`.](#get-the-current-date-using-strftime)
    * [Bypass shell aliases.](#bypass-shell-aliases)
    * [Bypass shell functions.](#bypass-shell-functions)

<!-- vim-markdown-toc -->


# Strings

## Trim leading and trailing white-space from string.

This is an alternative to `sed`, `awk`, `perl` and other tools. The
function below works by finding all leading and trailing white-space and
removing it from the start and end of the string. The `:` built-in is used
in place of a temporary variable.

**Example Function:**

```sh
trim_string() {
    # Usage: trim_string "   example   string    "
    : "${1#"${1%%[![:space:]]*}"}"
    : "${_%"${_##*[![:space:]]}"}"
    printf '%s\n' "$_"
}
```

**Example Usage:**

```shell
$ trim_string "    Hello,  World    "
Hello,  World

$ name="   John Black  "
$ trim_string "$name"
John Black
```


## Trim all white-space from string and truncate spaces.

This is an alternative to `sed`, `awk`, `perl` and other tools. The
function below works by abusing word splitting to create a new string
without leading/trailing white-space and with truncated spaces.

**Example Function:**

```sh
# shellcheck disable=SC2086,SC2048
trim_all() {
    # Usage: trim_all "   example   string    "
    set -f
    set -- $*
    printf '%s\n' "$*"
    set +f
}
```

**Example Usage:**

```shell
$ trim_all "    Hello,    World    "
Hello, World

$ name="   John   Black  is     my    name.    "
$ trim_all "$name"
John Black is my name.
```

## Use REGEX on a string.

We can use the result of `bash`'s regex matching to replace `sed` for a
large number of use-cases.

**CAVEAT**: This is one of the few platform dependant `bash` features.
`bash` will use whatever regex engine is installed on the user's system.
Stick to POSIX regex features if aiming for compatibility.

**CAVEAT**: This example only prints the first matching group. When using
multiple capture groups some modification is needed.

**Example Function:**

```sh
regex() {
    # Usage: regex "string" "regex"
    [[ $1 =~ $2 ]] && printf '%s\n' "${BASH_REMATCH[1]}"
}
```

**Example Usage:**

```shell
$ # Trim leading white-space.
$ regex '    hello' '^\s*(.*)'
hello

$ # Validate a hex color.
$ regex "#FFFFFF" '^(#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))$'
#FFFFFF

$ # Validate a hex color (invalid).
$ regex "red" '^(#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))$'
# no output (invalid)
```

**Example Usage in script:**

```shell
is_hex_color() {
    if [[ "$1" =~ ^(#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))$ ]]; then
        printf '%s\n' "${BASH_REMATCH[1]}"
    else
        printf '%s\n' "error: $1 is an invalid color."
        return 1
    fi
}

read -r color
is_hex_color "$color" || color="#FFFFFF"

# Do stuff.
```


## Split a string on a delimiter.

This is an alternative to `cut`, `awk` and other tools.

```shell
string="1,2,3"

# To multiple variables.
IFS=, read -r var1 var2 var3 <<< "$string"

# To an array.
IFS=, read -ra vars <<< "$string"
```

## Change a string to lowercase.

**CAVEAT:** Requires `bash` 4+

**Example Function:**

```sh
lower() {
    # Usage: lower "string"
    printf '%s\n' "${1,,}"
}
```

**Example Usage:**

```shell
$ lower "HELLO"
hello

$ lower "HeLlO"
hello

$ lower "hello"
hello
```

## Change a string to uppercase.

**CAVEAT:** Requires `bash` 4+

**Example Function:**

```sh
upper() {
    # Usage: upper "string"
    printf '%s\n' "${1^^}"
}
```

**Example Usage:**

```shell
$ upper "hello"
HELLO

$ upper "HeLlO"
HELLO

$ upper "HELLO"
HELLO
```

## Trim quotes from a string.

**Example Function:**

```sh
trim_quotes() {
    # Usage: trim_quotes "string"
    : "${1//\'}"
    printf "%s\\n" "${_//\"}"
}
```

**Example Usage:**

```shell
$ var="'Hello', \"World\""
$ trim_quotes "$var"
Hello, World
```

## Strip all instances of pattern from string.

**Example Function:**

```sh
strip_all() {
    # Usage: strip_all "string" "pattern"
    printf '%s\n' "${1//$2}"
}
```

**Example Usage:**

```shell
$ strip_all "The Quick Brown Fox" "[aeiou]"
Th Qck Brwn Fx

$ strip_all "The Quick Brown Fox" "[[:space:]]"
TheQuickBrownFox

$ strip_all "The Quick Brown Fox" "Quick "
The Brown Fox
```

## Strip first occurrence of pattern from string.

**Example Function:**

```sh
strip() {
    # Usage: strip "string" "pattern"
    printf '%s\n' "${1/$2}"
}
```

**Example Usage:**

```shell
$ strip "The Quick Brown Fox" "[aeiou]"
Th Quick Brown Fox

$ strip "The Quick Brown Fox" "[[:space:]]"
TheQuick Brown Fox
```

## Strip pattern from start of string.

**Example Function:**

```sh
lstrip() {
    # Usage: lstrip "string" "pattern"
    printf '%s\n' "${1##$2}"
}
```

**Example Usage:**

```shell
$ lstrip "The Quick Brown Fox" "The "
Quick Brown Fox
```

## Strip pattern from end of string.

**Example Function:**

```sh
rstrip() {
    # Usage: rstrip "string" "pattern"
    printf '%s\n' "${1%%$2}"
}
```

**Example Usage:**

```shell
$ rstrip "The Quick Brown Fox" " Fox"
The Quick Brown
```

## Check if string contains a substring.

**Using a test:**

```shell
# Normal
if [[ "$var" == *sub_string* ]]; then
    printf '%s\n' "sub_string is in var"
fi

# Inverse (substring not in string).
if [[ "$var" != *sub_string* ]]; then
    printf '%s\n' "sub_string is not in var"
fi

# This works for arrays too!
if [[ "${arr[*]}" == *sub_string* ]]; then
    printf '%s\n' "sub_string is in array."
fi
```

**Using a case statement:**

```shell
case "$var" in
    *sub_string*)
        # Do stuff
    ;;

    *sub_string2*)
        # Do more stuff
    ;;

    *)
        # Else
    ;;
esac
```

# Variables

## Assign and access a variable using a variable.

```shell
hello_world="test"

# Create the variable name.
var1="world"
var2="hello_${var1}"

# Print the value of the variable name stored in 'hello_$var1'.
printf '%s\n' "${!var2}"
```


# Arrays

## Reverse an array.

Enabling `extdebug` allows access to the `BASH_ARGV` array which stores
the current function’s arguments in reverse.

**Example Function:**

```sh
reverse_array() {
    # Usage: reverse_array "array"
    shopt -s extdebug
    f()(printf '%s\n' "${BASH_ARGV[@]}"); f "$@"
    shopt -u extdebug
}
```

**Example Usage:**

```shell
$ reverse_array 1 2 3 4 5
5
4
3
2
1

$ arr=(red blue green)
$ reverse_array "${arr[@]}"
green
blue
red
```

## Remove duplicate array elements.

Create a temporary associative array. When setting associative array
values and a duplicate assignment occurs, bash overwrites the key. This
allows us to effectively remove array duplicates.

**CAVEAT:** Requires `bash` 4+

**Example Function:**

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

**Example Usage:**

```shell
$ remove_array_dups 1 1 2 2 3 3 3 3 3 4 4 4 4 4 5 5 5 5 5 5
1
2
3
4
5

$ arr=(red red green blue blue)
$ remove_array_dups "${arr[@]}"
red
green
blue
```

## Cycle through an array.

Each time the `printf` is called, the next array element is printed. When
the print hits the last array element it starts from the first element
again.

```sh
arr=(a b c d)

cycle() {
    printf '%s ' "${arr[${i:=0}]}"
    ((i=i>=${#arr[@]}-1?0:++i))
}
```


## Toggle between two values.

This works the same as above, this is just a different use case.

```sh
arr=(true false)

cycle() {
    printf '%s ' "${arr[${i:=0}]}"
    ((i=i>=${#arr[@]}-1?0:++i))
}
```

# Loops

## Loop over a range of numbers.

Don't use `seq`.

```shell
# Loop from 0-100 (no variable support).
for i in {0..100}; do
    printf '%s\n' "$i"
done
```

## Loop over a variable range of numbers.

Don't use `seq`.

```shell
# Loop from 0-VAR.
VAR=50
for ((i=0;i<=VAR;i++)); do
    printf '%s\n' "$i"
done
```

## Loop over an array.

```shell
arr=(apples oranges tomatoes)

# Just elements.
for element in "${arr[@]}"; do
    printf '%s\n' "$element"
done
```

## Loop over an array with an index.

```shell
# Elements and index.
for i in "${!arr[@]}"; do
    printf '%s\n' "${arr[$i]}"
done
```

## Loop over the contents of a file.

```shell
while read -r line; do
    printf '%s\n' "$line"
done < "file"
```

## Loop over files and directories.

Don’t use `ls`.

```shell
# Greedy example.
for file in *; do
    printf '%s\n' "$file"
done

# PNG files in dir.
for file in ~/Pictures/*.png; do
    printf '%s\n' "$file"
done

# Iterate over directories.
for dir in ~/Downloads/*/; do
    printf '%s\n' "$dir"
done

# Iterate recursively.
shopt -s globstar
for file in ~/Pictures/**/*; do
    printf '%s\n' "$file"
done
shopt -u globstar
```


# File handling

## Read a file to a string.

Alternative to the `cat` command.

```shell
file_data="$(<"file")"
```

## Read a file to an array (*by line*).

Alternative to the `cat` command.

```shell
# Bash <4
IFS=$'\n' read -d "" -ra file_data < "file"

# Bash 4+
mapfile -t file_data < "file"
```

## Get the first N lines of a file.

Alternative to the `head` command.

**CAVEAT:** Requires `bash` 4+

**Example Function:**

```sh
head() {
    # Usage: head "n" "file"
    mapfile -tn "$1" line < "$2"
    printf '%s\n' "${line[@]}"
}
```

**Example Usage:**

```shell
$ head 2 ~/.bashrc
# Prompt
PS1='➜ '

$ head 1 ~/.bashrc
# Prompt
```

## Get the last N lines of a file.

Alternative to the `tail` command.

**CAVEAT:** Requires `bash` 4+

**Example Function:**

```sh
tail() {
    # Usage: tail "n" "file"
    mapfile -tn 0 line < "$2"
    printf '%s\n' "${line[@]: -$1}"
}
```

**Example Usage:**

```shell
$ tail 2 ~/.bashrc
# Enable tmux.
# [[ -z "$TMUX"  ]] && exec tmux

$ tail 1 ~/.bashrc
# [[ -z "$TMUX"  ]] && exec tmux
```

## Get the number of lines in a file.

Alternative to `wc -l`.

**CAVEAT:** Requires `bash` 4+

**Example Function:**

```sh
lines() {
    # Usage lines "file"
    mapfile -tn 0 lines < "$1"
    printf '%s\n' "${#lines[@]}"
}
```

**Example Usage:**

```shell
$ lines ~/.bashrc
48
```

## Count files or directories in directory.

This works by passing the output of the glob as function arguments. We
then count the arguments and print the number.

**Example Function:**

```sh
count() {
    # Usage: count /path/to/dir/*
    #        count /path/to/dir/*/
    printf '%s\n' "$#"
}
```

**Example Usage:**

```shell
# Count all files in dir.
$ count ~/Downloads/*
232

# Count all dirs in dir.
$ count ~/Downloads/*/
45

# Count all jpg files in dir.
$ count ~/Pictures/*.jpg
64
```

## Create an empty file.

Alternative to `touch`.

```shell
# Shortest.
:> file

# Longer alternatives:
echo -n > file
printf '' > file
```

# File Paths

## Get the directory name of a file path.

Alternative to the `dirname` command.

**Example Function:**

```sh
dirname() {
    # Usage: dirname "path"
    printf '%s\n' "${1%/*}/"
}
```

**Example Usage:**

```shell
$ dirname ~/Pictures/Wallpapers/1.jpg
/home/black/Pictures/Wallpapers/

$ dirname ~/Pictures/Downloads/
/home/black/Pictures/
```

## Get the base-name of a file path.

Alternative to the `basename` command.

**Example Function:**

```sh
basename() {
    # Usage: basename "path"
    : "${1%/}"
    printf '%s\n' "${_##*/}"
}
```

**Example Usage:**

```shell
$ basename ~/Pictures/Wallpapers/1.jpg
1.jpg

$ basename ~/Pictures/Downloads/
Downloads
```


# Arithmetic

## Simpler syntax to set variables.

```shell
# Simple math
((var=1+2))

# Decrement/Increment variable
((var++))
((var--))
((var+=1))
((var-=1))

# Using variables
((var=var2*arr[2]))
```

## Ternary tests.

```shell
# Set the value of var to var2 if var2 is greater than var.
# var: variable to set.
# var2>var: Condition to test.
# ?var2: If the test succeeds.
# :var: If the test fails.
((var=var2>var?var2:var))
```

# Colors

## Convert a hex color to RGB.

**Example Function:**

```sh
hex_to_rgb() {
    # Usage: hex_to_rgb "#FFFFFF"
    ((r=16#${1:1:2}))
    ((g=16#${1:3:2}))
    ((b=16#${1:5:6}))

    printf '%s\n' "$r $g $b"
}
```

**Example Usage:**

```shell
$ hex_to_rgb "#FFFFFF"
255 255 255
```


## Convert an RGB color to hex.

**Example Function:**

```sh
rgb_to_hex() {
    # Usage: rgb_to_hex "r" "g" "b"
    printf '#%02x%02x%02x\n' "$1" "$2" "$3"
}
```

**Example Usage:**

```shell
$ rgb_to_hex "255" "255" "255"
#FFFFFF
```

# Information about the terminal

## Get the terminal size in lines and columns (*from a script*).

This is handy when writing scripts in pure bash and `stty`/`tput` can’t be
called.

**Example Function:**

```sh
get_term_size() {
    # Usage: get_term_size

    # (:;:) is a micro sleep to ensure the variables are
    # exported immediately.
    shopt -s checkwinsize; (:;:)
    printf '%s\n' "$LINES $COLUMNS"
}
```

**Example Usage:**

```shell
# Output: LINES COLUMNS
$ get_term_size
15 55
```

## Get the terminal size in pixels.

**CAVEAT**: This does not work in some terminal emulators.

**Example Function:**

```sh
get_window_size() {
    # Usage: get_window_size
    printf '%b' "${TMUX:+\\ePtmux;\\e}\\e[14t${TMUX:+\\e\\\\}"
    IFS=';t' read -d t -t 0.05 -sra term_size
    printf '%s\n' "${term_size[1]}x${term_size[2]}"
}
```

**Example Usage:**

```shell
# Output: WIDTHxHEIGHT
$ get_window_size
1200x800

# Output (fail):
$ get_window_size
x
```


## Get the current cursor position.

This is useful when creating a TUI in pure bash.

**Example Function:**

```sh
get_cursor_pos() {
    # Usage: get_cursor_pos
    IFS='[;' read -p $'\e[6n' -d R -rs _ y x _
    printf '%s\n' "$x $y"
}
```

**Example Usage:**

```shell
# Output: X Y
$ get_cursor_pos
1 8
```

# Code Golf

## Shorter `for` loop syntax.

```shell
# Tiny C Style.
for((;i++<10;)){ echo "$i";}

# Undocumented method.
for i in {1..10};{ echo "$i";}

# Expansion.
for i in {1..10}; do echo "$i"; done

# C Style.
for((i=0;i<=10;i++)); do echo "$i"; done
```

## Shorter infinite loops.

```shell
# Normal method
while :; do echo hi; done

# Shorter
for((;;)){ echo hi;}
```

## Shorter function declaration.

```shell
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
# NOTE: You can also use ‘while’, ‘until’, ‘case’, ‘(())’, ‘[[]]’.
f()if true; then echo "$1"; fi
f()for i in "$@"; do echo "$i"; done
```

## Shorter `if` syntax.

```shell
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

## Simpler `case` statement to set variable.

We can use the `:` builtin to avoid repeating `variable=` in a case
statement. The `$_` variable stores the last argument of the last
successful command. `:` always succeeds so we can abuse it to store the
variable value.

```shell
# Example snippet from Neofetch.
case "$(uname)" in
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
        printf '%s\n' "Unknown OS detected, aborting..." >&2
        exit 1
    ;;
esac

# Finally, set the variable.
os="$_"
```

# Internal Variables

**NOTE**: This list does not include every internal variable (*You can
help by adding a missing entry!*).

For a complete list, see:
http://tldp.org/LDP/abs/html/internalvariables.html

## Get the location to the `bash` binary.

```shell
"$BASH"
```

## Get the version of the current running `bash` process.

```shell
# As a string.
"$BASH_VERSION"

# As an array.
"${BASH_VERSINFO[@]}"
```

## Open the user's preferred text editor.

```shell
"$EDITOR" "$file"

# NOTE: This variable may be empty, set a fallback value.
"${EDITOR:-vi}" "$file"
```

## Get the name of the current function.

```shell
# Current function.
"${FUNCNAME[0]}"

# Parent function.
"${FUNCNAME[1]}"

# So on and so forth.
"${FUNCNAME[2]}"
"${FUNCNAME[3]}"

# All functions including parents.
"${FUNCNAME[@]}"
```

## Get the host-name of the system.

```shell
"$HOSTNAME"

# NOTE: This variable may be empty.
# Optionally set a fallback to the hostname command.
"${HOSTNAME:-$(hostname)}"
```

## Get the architecture of the Operating System.

```shell
"$HOSTTYPE"
```

## Get the name of the Operating System / Kernel.

This can be used to add conditional support for different Operating
Systems without needing to call `uname`.

```shell
"$OSTYPE"
```

## Get the current working directory.

This is an alternative to the `pwd` built-in.

```shell
"$PWD"
```

## Get the number of seconds the script has been running.

```shell
"$SECONDS"
```

# Other

## Check if a program is in the user's PATH.

```shell
# There are 3 ways to do this and you can use either of
# these in the same way.
type -p executable_name &>/dev/null
hash executable_name &>/dev/null
command -v executable_name &>/dev/null

# As a test.
if type -p executable_name &>/dev/null; then
    # Program is in PATH.
fi

# Inverse.
if ! type -p executable_name &>/dev/null; then
    # Program is not in PATH.
fi

# Example (Exit early if program isn't installed).
if ! type -p convert &>/dev/null; then
    printf '%s\n' "error: convert isn't installed, exiting..."
    exit 1
fi
```

## Get the current date using `strftime`.

Bash’s `printf` has a built-in method of getting the date which we can use
in place of the `date` command in a lot of cases.

**CAVEAT:** Requires `bash` 4+

**Example Function:**

```sh
date() {
    # Usage: date "format"
    # See: 'man strftime' for format.
    printf "%($1)T\\n" "-1"
}
```

**Example Usage:**

```shell
# Using above function.
$ date "%a %d %b  - %l:%M %p"
Fri 15 Jun  - 10:00 AM

# Using printf directly.
$ printf '%(%a %d %b  - %l:%M %p)T\n' "-1"
Fri 15 Jun  - 10:00 AM

# Assigning a variable using printf.
$ printf -v date '%(%a %d %b  - %l:%M %p)T\n' '-1'
$ printf '%s\n' "$date"
Fri 15 Jun  - 10:00 AM
```

## Bypass shell aliases.

```shell
# alias
ls

# command
# shellcheck disable=SC1001
\ls
```

## Bypass shell functions.

```shell
# function
ls

# command
command ls
```

