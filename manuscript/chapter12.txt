# TRAPS

Traps allow a script to execute code on various signals. In [pxltrm](https://github.com/dylanaraps/pxltrm) (*a pixel art editor written in bash*)  traps are used to redraw the user interface on window resize. Another use case is cleaning up temporary files on script exit.

Traps should be added near the start of scripts so any early errors are also caught.

**NOTE:** For a full list of signals, see `trap -l`.


## Do something on script exit

```shell
# Clear screen on script exit.
trap 'printf \\e[2J\\e[H\\e[m' EXIT
```

## Ignore terminal interrupt (CTRL+C, SIGINT)

```shell
trap '' INT
```

## React to window resize

```shell
# Call a function on window resize.
trap 'code_here' SIGWINCH
```

## Do something before every command

```shell
trap 'code_here' DEBUG
```

## Do something when a shell function or a sourced file finishes executing

```shell
trap 'code_here' RETURN
```

<!-- CHAPTER END -->

