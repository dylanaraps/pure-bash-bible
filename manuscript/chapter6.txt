# VARIABLES

## Assign and access a variable using a variable

```shell
$ hello_world="value"

# Create the variable name.
$ var="world"
$ ref="hello_$var"

# Print the value of the variable name stored in 'hello_$var'.
$ printf '%s\n' "${!ref}"
value
```

Alternatively, on `bash` 4.3+:

```shell
$ hello_world="value"
$ var="world"

# Declare a nameref.
$ declare -n ref=hello_$var

$ printf '%s\n' "$ref"
value
```

## Name a variable based on another variable

```shell
$ var="world"
$ declare "hello_$var=value"
$ printf '%s\n' "$hello_world"
value
```

<!-- CHAPTER END -->

