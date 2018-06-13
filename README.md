## PURE BASH


### Getting the terminal size (*in a script*).

This is handy when writing scripts in pure bash and `stty`/`tput` can’t be
called.

```shell
get_term_size() {
    # Usage: get_term_size

    # (:;:) is a micro sleep to ensure the variables are
    # exported immediately.
    shopt -s checkwinsize; (:;:)
    printf '%s\n' "$LINES $COLUMNS"
}
```


### Convert a hex color to RGB

```shell
hex_to_rgb() {
    # Usage: hex_to_rgb "#FFFFFF"
    ((r=16#${1:1:2}))
    ((g=16#${1:3:2}))
    ((b=16#${1:5:6}))

    printf '%s\n' "$r $g $b"
}
```


### Convert an RGB color to hex.

```shell
rgb_to_hex() {
    # Usage: rgb_to_hex "r" "g" "b"
    printf '#%02x%02x%02x\n' "$1" "$2" "$3"
}
```


### `printf` as a `date` replacement.

Bash’s `printf` has a built-in method of getting the date which we can use
in place of the `date` command in a lot of cases.

**NOTE:** Requires bash4+

```shell
date() {
    # Usage: date "format"
    # See: 'man strftime' for format.
    printf "%($1)T\\n"
}
```


### `dirname`

Extract the directory from a file path.

```shell
dirname() {
    # Usage: dirname "path"
    printf ‘%s\n’ "${1%/*}/"
}
```


