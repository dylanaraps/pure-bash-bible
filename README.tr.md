<p align="center"><b>YENİ: <a href="https://github.com/dylanaraps/pure-sh-bible">saf sh incili (📖 Harici süreçlere alternatif olabilecek saf SH alternatifleri).</a></b></p>

<br>

<p align="center"><img src="https://raw.githubusercontent.com/odb/official-bash-logo/master/assets/Logos/Icons/PNG/512x512.png" width="200px"></p>
<h1 align="center">saf bash incili</h1> <p align="center">Harici süreçlere alternatif olabilecek saf Bash alternatifleri.</p>

<p align="center"> <a href="https://travis-ci.com/dylanaraps/pure-bash-bible"><img src="https://travis-ci.com/dylanaraps/pure-bash-bible.svg?branch=master"></a>
<a href="./LICENSE.md"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
</p>

<br>

<a href="https://leanpub.com/bash/">
<img src="https://s3.amazonaws.com/titlepages.leanpub.com/bash/hero" width="40%" align="right">
</a>

Bu kitabın amacı, yalnızca yerleşik `bash` özelliklerini kullanarak çeşitli görevler yapmanın yaygın olarak bilinen ve daha az bilinen yöntemlerini belgelendirmektir. Bu İncil'den pasajları kullanmak, gereksiz bağımlılıkları komut dosyalarından kaldırmanıza yardımcı olabilir ve çoğu durumda onları daha hızlı hale getirebilir. [neofetch](https://github.com/dylanaraps/neofetch) , [pxltrm](https://github.com/dylanaraps/pxltrm) ve daha küçük projeler geliştirirken bu ipuçlarıyla karşılaştım ve birkaç tane keşfettim.

Aşağıdaki snippet'ler `shellcheck` kullanılarak ve uygun olan yerlerde yasılan testler kontrol edilmiştir. Katkıda bulunmak ister misiniz? [CONTRIBUTING.md](https://github.com/dylanaraps/pure-bash-bible/blob/master/CONTRIBUTING.md) dosyasını okuyun. Unit testlerinin nasıl çalıştığı ve İncil'e snippet eklerken neyin gerekli olduğu ana hatlarıyla o dosyada belirtilir.

Yanlış tanımlanmış, hatalı ya da düpedüz yanlış bir şey mi gördünüz? Bir sorun açın veya PR gönderin. İncil bir şey eksik ise, bir sorun açın ve bir çözüm bulunacaktır.

<br>
<p align="center"><b>This book is also available to purchase on leanpub. https://leanpub.com/bash</b></p>
<p align="center"><b>Or you can buy me a coffee.</b>
<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=V7QNJNKS3WYVS"><img src="https://img.shields.io/badge/don-paypal-yellow.svg"></a> <a href="https://www.patreon.com/dyla"><img src="https://img.shields.io/badge/don-patreon-yellow.svg"> </a><a href="https://liberapay.com/2211/"><img src="https://img.shields.io/badge/don-liberapay-yellow.svg"></a>
</p>

<br>

# Table of Contents

<!-- vim-markdown-toc GFM -->

- [FOREWORD](#foreword)
- [DÜZ METİNLER](#teller)
    - [Metnin başında ve sonundaki boşlukları temizleme](#dize-gelen-beyaz-bo%C5%9Fluk-%C3%B6nde-gelen-ve-sondaki-trim)
    - [Tüm fazla boşlukları kırpma](#t%C3%BCm-beyaz-bo%C5%9Fluklar%C4%B1-dize-ve-kesilmi%C5%9F-bo%C5%9Fluklardan-k%C4%B1rp)
    - [Bir metinde regex kullanma](#bir-dizgede-regex-kullan%C4%B1n)
    - [Bir sınırlayıcı ile metni bölme](#s%C4%B1n%C4%B1rlay%C4%B1c%C4%B1da-bir-dize-b%C3%B6lme)
    - [Bir metni küçük harfe dönüşürme](#dizeyi-k%C3%BC%C3%A7%C3%BCk-harfe-d%C3%B6n%C3%BC%C5%9Ft%C3%BCr)
    - [Bir metni büyük harfe dönüşürme](#bir-dizeyi-b%C3%BCy%C3%BCk-harfe-d%C3%B6n%C3%BC%C5%9Ft%C3%BCr)
    - [Metin harf büyüklüğünü ters çevirme](#bir-dize-harfini-ters-%C3%A7evir)
    - [Metinden tırnakları kırpma](#bir-dizeden-t%C4%B1rnak)
    - [Metindeki tüm desen örneklerini kırpma](#dizideki-t%C3%BCm-desen-%C3%B6rneklerini-%C3%A7%C4%B1kar)
    - [Metinde bir desenin ilk örneğini kırpma](#dize-desen-ilk-olu%C5%9Fumunu-%C5%9Ferit)
    - [Metnin başındaki bir deseni kırpma](#dizenin-ba%C5%9F%C4%B1ndan-itibaren-%C5%9Ferit-deseni)
    - [Metnin sonundaki bir deseni kırpma](#dize-sonundan-%C5%9Ferit-deseni)
    - [Bir metnin percent-encode çevirimini yapma](#y%C3%BCzde-bir-dize-kodlamak)
    - [Bir metnin percent-encode geri çevirimini yapma](#y%C3%BCzde-kodlanm%C4%B1%C5%9F-bir-dizgenin-kodunu-%C3%A7%C3%B6z)
    - [Metnin bir alt metni içerip içermediğini kontrol etme](#dize-alt-dize-i%C3%A7erip-i%C3%A7ermedi%C4%9Fini-kontrol-edin)
    - [Metnin bir alt metinle başlayıp başlamadığını kontrol etme](#dizenin-alt-dizeyle-ba%C5%9Flay%C4%B1p-ba%C5%9Flamad%C4%B1%C4%9F%C4%B1n%C4%B1-kontrol-edin)
    - [Metnin bir alt metinle bitip bitmediğini kontrol etme](#dizenin-alt-dizeyle-bitip-bitmedi%C4%9Fini-kontrol-edin)
- [ARRAYS](#arrays)
    - [Diziyi ters çevirme](#dizi-ters)
    - [Yinelenen dizi öğelerini kaldırma](#yinelenen-dizi-%C3%B6%C4%9Felerini-kald%C4%B1r%C4%B1n)
    - [Random array element](#random-array-element)
    - [Bir dizi içerisinde dolaşma](#dizi-i%C3%A7inde-dola%C5%9Fmak)
    - [İki değer arasında geçiş yapma](#iki-de%C4%9Fer-aras%C4%B1nda-ge%C3%A7i%C5%9F-yapmak)
- [DÖNGÜLER](#d%C3%B6ng%C3%BCler)
    - [Bir sayı aralığında döngü](#bir-say%C4%B1-aral%C4%B1%C4%9F%C4%B1-%C3%BCzerinde-d%C3%B6ng%C3%BC)
    - [Loop over a variable range of numbers](#loop-over-a-variable-range-of-numbers)
    - [Bir dizi içinde döngü](#bir-dizi-%C3%BCzerinde-d%C3%B6ng%C3%BC)
    - [Dizinli bir dizi içinde döngü](#bir-dizini-olan-bir-dizi-%C3%BCzerinde-d%C3%B6ng%C3%BC)
    - [Bir dosyanın içeriği içinde döngü](#bir-dosyan%C4%B1n-i%C3%A7eri%C4%9Fi-%C3%BCzerinde-d%C3%B6ng%C3%BC)
    - [Dosyalar ve dizinler içinde döngü](#dosyalar-ve-dizinler-%C3%BCzerinde-d%C3%B6ng%C3%BC)
- [FILE HANDLING](#file-handling)
    - [Bir dosya içeriğini metin değişkenine dönüştürme](#bir-dosyay%C4%B1-dizeye-okumak)
    - [Dosya içeriğini diziye dönüştürme (*satır satır*)](#bir-dosyay%C4%B1-bir-diziye-sat%C4%B1r-sat%C4%B1r-oku)
    - [Bir dosyanın ilk N satırını alma](#bir-dosyan%C4%B1n-ilk-n-sat%C4%B1r%C4%B1n%C4%B1-almak)
    - [Bir dosyanın son N satırını alma](#bir-dosyan%C4%B1n-son-n-sat%C4%B1r%C4%B1n%C4%B1-almak)
    - [Bir dosyadaki satır sayısını alma](#bir-dosyadaki-sat%C4%B1r-say%C4%B1s%C4%B1n%C4%B1-almak)
    - [Dizindeki dosyaları veya dizinleri sayma](#dizindeki-dosyalar%C4%B1-veya-dizinleri-saymak)
    - [Boş bir dosya oluşturma](#bo%C5%9F-bir-dosya-olu%C5%9Ftur)
    - [İki işaret arasındaki satırlar ayıklama](#iki-i%C5%9Faretleyici-aras%C4%B1ndaki-%C3%A7izgileri-ay%C4%B1klamak)
- [FILE PATHS](#file-paths)
    - [Bir dosya yolunun dizin adını alma](#bir-dosya-yolunun-dizin-ad%C4%B1n%C4%B1-al)
    - [Bir dosya yolunun taban adını alma](#bir-dosya-yolunun-taban-ad%C4%B1n%C4%B1-al)
- [VARIABLES](#variables)
    - [Assign and access a variable using a variable](#assign-and-access-a-variable-using-a-variable)
    - [Name a variable based on another variable](#name-a-variable-based-on-another-variable)
- [KIRPMA SERİLERİ](#ka%C3%A7%C4%B1%C5%9F-dizileri)
    - [Text Colors](#text-colors)
    - [Text Attributes](#text-attributes)
    - [Cursor Movement](#cursor-movement)
    - [Erasing Text](#erasing-text)
- [PARAMETRE GENİŞLETME](#parametre-geni%C5%9Fletme)
    - [Dolaylama](#dolayl%C4%B1-s%C3%B6z)
    - [Yer değiştirme](#de%C4%9Fi%C5%9Ftirme)
    - [Uzunluk](#uzunluk)
    - [Expansion](#expansion)
    - [Büyük/Küçük Harf Değişikliği](#vaka-de%C4%9Fi%C5%9Fikli%C4%9Fi)
    - [Ön tanımlı değer](#varsay%C4%B1lan-de%C4%9Fer)
- [BRACE EXPANSION](#brace-expansion)
    - [Ranges](#ranges)
    - [String Lists](#string-lists)
- [CONDITIONAL EXPRESSIONS](#conditional-expressions)
    - [File Conditionals](#file-conditionals)
    - [File Comparisons](#file-comparisons)
    - [Variable Conditionals](#variable-conditionals)
    - [Variable Comparisons](#variable-comparisons)
- [ARITHMETIC OPERATORS](#arithmetic-operators)
    - [Assignment](#assignment)
    - [Arithmetic](#arithmetic)
    - [Bitwise](#bitwise)
    - [Mantık](#mant%C4%B1kl%C4%B1)
    - [Miscellaneous](#miscellaneous)
- [ARITHMETIC](#arithmetic-1)
    - [Simpler syntax to set variables](#simpler-syntax-to-set-variables)
    - [Üçlü testler](#%C3%BC%C3%A7l%C3%BC-testler)
- [TRAP'ler](#tuzaklar%C4%B1)
    - [Do something on script exit](#do-something-on-script-exit)
    - [Terminal kesmesini yoksay (CTRL+C, SIGINT)](#terminal-kesme-ctrlc-i%C5%9Faretini-yoksay)
    - [Pencereyi boyutlandırılmasına tepki verme](#yeniden-boyutland%C4%B1rmak)
    - [Her komuttan önce bir şeyler yapma](#her-komuttan-%C3%B6nce-bir-%C5%9Feyler-yap)
    - [Bir kabuk işlevi veya kaynak bir dosya yürütmeyi bitirdiğinde bir şey yapma](#bir-kabuk-i%C5%9Flevi-veya-kaynak-bir-dosya-y%C3%BCr%C3%BCtmeyi-bitirdi%C4%9Finde-bir-%C5%9Fey-yap%C4%B1n)
- [PERFORMANCE](#performance)
    - [Disable Unicode](#disable-unicode)
- [ESKİMİŞ SÖZDİZİMİ](#eski-s%C3%B6zdizimi)
    - [Shebang](#mesele)
    - [Command Substitution](#command-substitution)
    - [Fonksiyon Tanımlama](#i%C5%9Flev-bildirimi)
- [INTERNAL VARIABLES](#internal-variables)
    - [`bash` komutunun yerini bulma](#bash-ikilisinin-yerini-al)
    - [Geçerli çalışan `bash` işleminin sürümünü bulma](#ge%C3%A7erli-%C3%A7al%C4%B1%C5%9Fan-bash-i%C5%9Fleminin-s%C3%BCr%C3%BCm%C3%BCn%C3%BC-al)
    - [Kullanıcının tercih ettiği metin düzenleyicisini açma](#kullan%C4%B1c%C4%B1lar%C4%B1-tercih-metin-edit%C3%B6r%C3%BCn%C3%BC-a%C3%A7)
    - [Mevcut işlevin adını alma](#ge%C3%A7erli-i%C5%9Flevin-ad%C4%B1n%C4%B1-al)
    - [Sistemin ana bilgisayar adını alma](#sistemin-ana-bilgisayar-ad%C4%B1n%C4%B1-al)
    - [Get the architecture of the Operating System](#get-the-architecture-of-the-operating-system)
    - [Get the name of the Operating System / Kernel](#get-the-name-of-the-operating-system--kernel)
    - [Get the current working directory](#get-the-current-working-directory)
    - [Get the number of seconds the script has been running](#get-the-number-of-seconds-the-script-has-been-running)
    - [Get a pseudorandom integer](#get-a-pseudorandom-integer)
- [INFORMATION ABOUT THE TERMINAL](#information-about-the-terminal)
    - [Terminal boyutunu satırlar ve sütunlar halinde alın (*bir betikten*)](#bir-b%C3%BCltenden-sat%C4%B1r-ve-s%C3%BCtun-cinsinden-terminal-boyutunu-almak)
    - [Get the terminal size in pixels](#get-the-terminal-size-in-pixels)
    - [Get the current cursor position](#get-the-current-cursor-position)
- [CONVERSION](#conversion)
    - [Convert a hex color to RGB](#convert-a-hex-color-to-rgb)
    - [Convert an RGB color to hex](#convert-an-rgb-color-to-hex)
- [CODE GOLF](#code-golf)
    - [Kısa `for` döngüsü sözdizimi](#d%C3%B6ng%C3%BC-s%C3%B6zdizimi-i%C3%A7in-daha-k%C4%B1sa)
    - [Shorter infinite loops](#shorter-infinite-loops)
    - [Shorter function declaration](#shorter-function-declaration)
    - [Shorter `if` syntax](#shorter-if-syntax)
    - [Simpler `case` statement to set variable](#simpler-case-statement-to-set-variable)
- [OTHER](#other)
    - [Use `read` as an alternative to the `sleep` command](#use-read-as-an-alternative-to-the-sleep-command)
    - [Check if a program is in the user's PATH](#check-if-a-program-is-in-the-users-path)
    - [Get the current date using `strftime`](#get-the-current-date-using-strftime)
    - [Get the username of the current user](#get-the-username-of-the-current-user)
    - [Generate a UUID V4](#generate-a-uuid-v4)
    - [Progress bars](#progress-bars)
    - [Get the list of functions in a script](#get-the-list-of-functions-in-a-script)
    - [Bypass shell aliases](#bypass-shell-aliases)
    - [Bypass shell functions](#bypass-shell-functions)
    - [Run a command in the background](#run-a-command-in-the-background)
- [AFTERWORD](#afterword)

<!-- vim-markdown-toc -->

<br>

<!-- CHAPTER START -->

# FOREWORD

A collection of pure `bash` alternatives to external processes and programs. The `bash` scripting language is more powerful than people realise and most tasks can be accomplished without depending on external programs.

Calling an external process in `bash` is expensive and excessive use will cause a noticeable slowdown. Scripts and programs written using built-in methods (*where applicable*) will be faster, require fewer dependencies and afford a better understanding of the language itself.

The contents of this book provide a reference for solving problems encountered when writing programs and scripts in `bash`. Examples are in function formats showcasing how to incorporate these solutions into code.

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# STRINGS

## Trim leading and trailing white-space from string

This is an alternative to `sed`, `awk`, `perl` and other tools. The
function below works by finding all leading and trailing white-space and
removing it from the start and end of the string. The `:` built-in is used in place of a temporary variable.

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

## Trim all white-space from string and truncate spaces

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

## Use regex on a string

The result of `bash`'s regex matching can be used to replace `sed` for a
large number of use-cases.

**CAVEAT**: This is one of the few platform dependent `bash` features.
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
    if [[ $1 =~ ^(#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))$ ]]; then
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

## Split a string on a delimiter

**CAVEAT:** Requires `bash` 4+

This is an alternative to `cut`, `awk` and other tools.

**Example Function:**

```sh
split() {
   # Usage: split "string" "delimiter"
   IFS=$'\n' read -d "" -ra arr <<< "${1//$2/$'\n'}"
   printf '%s\n' "${arr[@]}"
}
```

**Example Usage:**

```shell
$ split "apples,oranges,pears,grapes" ","
apples
oranges
pears
grapes

$ split "1, 2, 3, 4, 5" ", "
1
2
3
4
5

# Multi char delimiters work too!
$ split "hello---world---my---name---is---john" "---"
hello
world
my
name
is
john
```

## Change a string to lowercase

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

## Change a string to uppercase

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

## Reverse a string case

**CAVEAT:** Requires `bash` 4+

**Example Function:**

```sh
reverse_case() {
    # Usage: reverse_case "string"
    printf '%s\n' "${1~~}"
}
```

**Example Usage:**

```shell
$ reverse_case "hello"
HELLO

$ reverse_case "HeLlO"
hElLo

$ reverse_case "HELLO"
hello
```

## Trim quotes from a string

**Example Function:**

```sh
trim_quotes() {
    # Usage: trim_quotes "string"
    : "${1//\'}"
    printf '%s\n' "${_//\"}"
}
```

**Example Usage:**

```shell
$ var="'Hello', \"World\""
$ trim_quotes "$var"
Hello, World
```

## Strip all instances of pattern from string

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

## Strip first occurrence of pattern from string

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

## Strip pattern from start of string

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

## Strip pattern from end of string

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

## Percent-encode a string

**Example Function:**

```sh
urlencode() {
    # Usage: urlencode "string"
    local LC_ALL=C
    for (( i = 0; i < ${#1}; i++ )); do
        : "${1:i:1}"
        case "$_" in
            [a-zA-Z0-9.~_-])
                printf '%s' "$_"
            ;;

            *)
                printf '%%%02X' "'$_"
            ;;
        esac
    done
    printf '\n'
}
```

**Example Usage:**

```shell
$ urlencode "https://github.com/dylanaraps/pure-bash-bible"
https%3A%2F%2Fgithub.com%2Fdylanaraps%2Fpure-bash-bible
```

## Decode a percent-encoded string

**Example Function:**

```sh
urldecode() {
    # Usage: urldecode "string"
    : "${1//+/ }"
    printf '%b\n' "${_//%/\\x}"
}
```

**Example Usage:**

```shell
$ urldecode "https%3A%2F%2Fgithub.com%2Fdylanaraps%2Fpure-bash-bible"
https://github.com/dylanaraps/pure-bash-bible
```

## Check if string contains a sub-string

**Using a test:**

```shell
if [[ $var == *sub_string* ]]; then
    printf '%s\n' "sub_string is in var."
fi

# Inverse (substring not in string).
if [[ $var != *sub_string* ]]; then
    printf '%s\n' "sub_string is not in var."
fi

# This works for arrays too!
if [[ ${arr[*]} == *sub_string* ]]; then
    printf '%s\n' "sub_string is in array."
fi
```

**Bir case ifadesi kullanarak:**

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

## Check if string starts with sub-string

```shell
if [[ $var == sub_string* ]]; then
    printf '%s\n' "var starts with sub_string."
fi

# Inverse (var does not start with sub_string).
if [[ $var != sub_string* ]]; then
    printf '%s\n' "var does not start with sub_string."
fi
```

## Check if string ends with sub-string

```shell
if [[ $var == *sub_string ]]; then
    printf '%s\n' "var ends with sub_string."
fi

# Inverse (var does not end with sub_string).
if [[ $var != *sub_string ]]; then
    printf '%s\n' "var does not end with sub_string."
fi
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# ARRAYS

## Reverse an array

Enabling `extdebug` allows access to the `BASH_ARGV` array which stores
the current function’s arguments in reverse.

**CAVEAT**: Requires `shopt -s compat44` in `bash` 5.0+.

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

## Remove duplicate array elements

Create a temporary associative array. When setting associative array
values and a duplicate assignment occurs, bash overwrites the key. This
allows us to effectively remove array duplicates.

**CAVEAT:** Requires `bash` 4+

**CAVEAT:** List order may not stay the same.

**Example Function:**

```sh
remove_array_dups() {
    # Usage: remove_array_dups "array"
    declare -A tmp_array

    for i in "$@"; do
        [[ $i ]] && IFS=" " tmp_array["${i:- }"]=1
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

## Random array element

**Example Function:**

```sh
random_array_element() {
    # Usage: random_array_element "array"
    local arr=("$@")
    printf '%s\n' "${arr[RANDOM % $#]}"
}
```

**Example Usage:**

```shell
$ array=(red green blue yellow brown)
$ random_array_element "${array[@]}"
yellow

# Multiple arguments can also be passed.
$ random_array_element 1 2 3 4 5 6 7
3
```

## Cycle through an array

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

## Toggle between two values

This works the same as above, this is just a different use case.

```sh
arr=(true false)

cycle() {
    printf '%s ' "${arr[${i:=0}]}"
    ((i=i>=${#arr[@]}-1?0:++i))
}
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# DÖNGÜLER

## Loop over a range of numbers

Alternative to `seq`.

```shell
# Loop from 0-100 (no variable support).
for i in {0..100}; do
    printf '%s\n' "$i"
done
```

## Loop over a variable range of numbers

Alternative to `seq`.

```shell
# Loop from 0-VAR.
VAR=50
for ((i=0;i<=VAR;i++)); do
    printf '%s\n' "$i"
done
```

## Loop over an array

```shell
arr=(apples oranges tomatoes)

# Just elements.
for element in "${arr[@]}"; do
    printf '%s\n' "$element"
done
```

## Loop over an array with an index

```shell
arr=(apples oranges tomatoes)

# Elements and index.
for i in "${!arr[@]}"; do
    printf '%s\n' "${arr[i]}"
done

# Alternative method.
for ((i=0;i<${#arr[@]};i++)); do
    printf '%s\n' "${arr[i]}"
done
```

## Loop over the contents of a file

```shell
while read -r line; do
    printf '%s\n' "$line"
done < "file"
```

## Loop over files and directories

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

# Brace Expansion.
for file in /path/to/parentdir/{file1,file2,subdir/file3}; do
    printf '%s\n' "$file"
done

# Iterate recursively.
shopt -s globstar
for file in ~/Pictures/**/*; do
    printf '%s\n' "$file"
done
shopt -u globstar
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# FILE HANDLING

**CAVEAT:** `bash` does not handle binary data properly in versions `< 4.4`.

## Read a file to a string

Alternative to the `cat` command.

```shell
file_data="$(<"file")"
```

## Read a file to an array (*by line*)

Alternative to the `cat` command.

```shell
# Bash <4 (discarding empty lines).
IFS=$'\n' read -d "" -ra file_data < "file"

# Bash <4 (preserving empty lines).
while read -r line; do
    file_data+=("$line")
done < "file"

# Bash 4+
mapfile -t file_data < "file"
```

## Get the first N lines of a file

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

## Get the last N lines of a file

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

## Get the number of lines in a file

Alternative to `wc -l`.

**Example Function (bash 4):**

```sh
lines() {
    # Usage: lines "file"
    mapfile -tn 0 lines < "$1"
    printf '%s\n' "${#lines[@]}"
}
```

**Example Function (bash 3):**

This method uses less memory than the `mapfile` method and works in `bash` 3 but it is slower for bigger files.

```sh
lines_loop() {
    # Usage: lines_loop "file"
    count=0
    while IFS= read -r _; do
        ((count++))
    done < "$1"
    printf '%s\n' "$count"
}
```

**Example Usage:**

```shell
$ lines ~/.bashrc
48

$ lines_loop ~/.bashrc
48
```

## Count files or directories in directory

This works by passing the output of the glob to the function and then counting the number of arguments.

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

## Create an empty file

Alternative to `touch`.

```shell
# Shortest.
>file

# Longer alternatives:
:>file
echo -n >file
printf '' >file
```

## Extract lines between two markers

**Example Function:**

```sh
extract() {
    # Usage: extract file "opening marker" "closing marker"
    while IFS=$'\n' read -r line; do
        [[ $extract && $line != "$3" ]] &&
            printf '%s\n' "$line"

        [[ $line == "$2" ]] && extract=1
        [[ $line == "$3" ]] && extract=
    done < "$1"
}
```

**Example Usage:**

```shell
# Extract code blocks from MarkDown file.
$ extract ~/projects/pure-bash/README.md '```sh' '```'
# Output here...
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# FILE PATHS

## Get the directory name of a file path

Alternative to the `dirname` command.

**Example Function:**

```sh
dirname() {
    # Usage: dirname "path"
    local tmp=${1:-.}

    [[ $tmp != *[!/]* ]] && {
        printf '/\n'
        return
    }

    tmp=${tmp%%"${tmp##*[!/]}"}

    [[ $tmp != */* ]] && {
        printf '.\n'
        return
    }

    tmp=${tmp%/*}
    tmp=${tmp%%"${tmp##*[!/]}"}

    printf '%s\n' "${tmp:-/}"
}
```

**Example Usage:**

```shell
$ dirname ~/Pictures/Wallpapers/1.jpg
/home/black/Pictures/Wallpapers

$ dirname ~/Pictures/Downloads/
/home/black/Pictures
```

## Get the base-name of a file path

Alternative to the `basename` command.

**Example Function:**

```sh
basename() {
    # Usage: basename "path" ["suffix"]
    local tmp

    tmp=${1%"${1##*[!/]}"}
    tmp=${tmp##*/}
    tmp=${tmp%"${2/"$tmp"}"}

    printf '%s\n' "${tmp:-/}"
}
```

**Example Usage:**

```shell
$ basename ~/Pictures/Wallpapers/1.jpg
1.jpg

$ basename ~/Pictures/Wallpapers/1.jpg .jpg
1

$ basename ~/Pictures/Downloads/
Downloads
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

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

<!-- CHAPTER START -->

# ESCAPE SEQUENCES

Contrary to popular belief, there is no issue in utilizing raw escape sequences. Using `tput` abstracts the same ANSI sequences as if printed manually. Worse still, `tput` is not actually portable. There are a number of `tput` variants each with different commands and syntaxes (*try `tput setaf 3` on a FreeBSD system*). Raw sequences are fine.

## Text Colors

**NOTE:** Sequences requiring RGB values only work in True-Color Terminal Emulators.

Sequence | What does it do? | Value
--- | --- | ---
`\e[38;5;<NUM>m` | Set text foreground color. | `0-255`
`\e[48;5;<NUM>m` | Set text background color. | `0-255`
`\e[38;2;<R>;<G>;<B>m` | Set text foreground color to RGB color. | `R`, `G`, `B`
`\e[48;2;<R>;<G>;<B>m` | Set text background color to RGB color. | `R`, `G`, `B`

## Text Attributes

**NOTE:** Prepend 2 to any code below to turn it's effect off
(examples: 21=bold text off, 22=faint text off, 23=italic text off).

Sequence | What does it do?
--- | ---
`\e[m` | Reset text formatting and colors.
`\e[1m` | Bold text.
`\e[2m` | Faint text.
`\e[3m` | Italic text.
`\e[4m` | Underline text.
`\e[5m` | Blinking text.
`\e[7m` | Highlighted text.
`\e[8m` | Hidden text.
`\e[9m` | Strike-through text.

## Cursor Movement

Sequence | What does it do? | Value
--- | --- | ---
`\e[<LINE>;<COLUMN>H` | Move cursor to absolute position. | `line`, `column`
`\e[H` | Move cursor to home position (`0,0`). | 
`\e[<NUM>A` | Move cursor up N lines. | `num`
`\e[<NUM>B` | Move cursor down N lines. | `num`
`\e[<NUM>C` | Move cursor right N columns. | `num`
`\e[<NUM>D` | Move cursor left N columns. | `num`
`\e[s` | Save cursor position. | 
`\e[u` | Restore cursor position. | 

## Erasing Text

Sequence | What does it do?
--- | ---
`\e[K` | Erase from cursor position to end of line.
`\e[1K` | Erase from cursor position to start of line.
`\e[2K` | Erase the entire current line.
`\e[J` | Erase from the current line to the bottom of the screen.
`\e[1J` | Erase from the current line to the top of the screen.
`\e[2J` | Clear the screen.
`\e[2J\e[H` | Clear the screen and move cursor to `0,0`.

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# PARAMETER EXPANSION

## Dolaylama

Parameter | What does it do?
--- | ---
`${!VAR}` | Access a variable based on the value of `VAR`.
`${!VAR*}` | Expand to `IFS` separated list of variable names starting with `VAR`.
`${!VAR@}` | Expand to `IFS` separated list of variable names starting with `VAR`. If double-quoted, each variable name expands to a separate word.

## Replacement

Parameter | What does it do?
--- | ---
`${VAR#PATTERN}` | Remove shortest match of pattern from start of string.
`${VAR##PATTERN}` | Remove longest match of pattern from start of string.
`${VAR%PATTERN}` | Remove shortest match of pattern from end of string.
`${VAR%%PATTERN}` | Remove longest match of pattern from end of string.
`${VAR/PATTERN/REPLACE}` | Replace first match with string.
`${VAR//PATTERN/REPLACE}` | Replace all matches with string.
`${VAR/PATTERN}` | Remove first match.
`${VAR//PATTERN}` | Remove all matches.

## Uzunluk

Parameter | What does it do?
--- | ---
`${#VAR}` | Length of var in characters.
`${#ARR[@]}` | Length of array in elements.

## Expansion

Parameter | What does it do?
--- | ---
`${VAR:OFFSET}` | Remove first `N` chars from variable.
`${VAR:OFFSET:LENGTH}` | Get substring from `N` character to `N` character. <br> (`${VAR:10:10}`: Get sub-string from char `10` to char `20`)
`${VAR:: OFFSET}` | Get first `N` chars from variable.
`${VAR:: -OFFSET}` | Remove last `N` chars from variable.
`${VAR: -OFFSET}` | Get last `N` chars from variable.
`${VAR:OFFSET:-OFFSET}` | Cut first `N` chars and last `N` chars.

## Büyük/Küçük Harf Değişimi

Parameter | What does it do? | CAVEAT
--- | --- | ---
`${VAR^}` | Uppercase first character. | `bash 4+`
`${VAR^^}` | Uppercase all characters. | `bash 4+`
`${VAR,}` | Lowercase first character. | `bash 4+`
`${VAR,,}` | Lowercase all characters. | `bash 4+`
`${VAR~}` | Reverse case of first character. | `bash 4+`
`${VAR~~}` | Reverse case of all characters. | `bash 4+`

## Default Value

Parameter | What does it do?
--- | ---
`${VAR:-STRING}` | If `VAR` is empty or unset, use `STRING` as its value.
`${VAR-STRING}` | If `VAR` is unset, use `STRING` as its value.
`${VAR:=STRING}` | If `VAR` is empty or unset, set the value of `VAR` to `STRING`.
`${VAR=STRING}` | If `VAR` is unset, set the value of `VAR` to `STRING`.
`${VAR:+STRING}` | If `VAR` is not empty, use `STRING` as its value.
`${VAR+STRING}` | If `VAR` is set, use `STRING` as its value.
`${VAR:?STRING}` | Display an error if empty or unset.
`${VAR?STRING}` | Display an error if unset.

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# ÇİFT GENİŞLETME

## Aralıklar

```shell
# Syntax: {<START>..<END>}

# Print numbers 1-100.
echo {1..100}

# Print range of floats.
echo 1.{1..9}

# Print chars a-z.
echo {a..z}
echo {A..Z}

# Nesting.
echo {A..Z}{0..9}

# Print zero-padded numbers.
# CAVEAT: bash 4+
echo {01..100}

# Change increment amount.
# Syntax: {<START>..<END>..<INCREMENT>}
# CAVEAT: bash 4+
echo {1..10..2} # Increment by 2.
```

## Metin Listeleri

```shell
echo {apples,oranges,pears,grapes}

# Example Usage:
# Remove dirs Movies, Music and ISOS from ~/Downloads/.
rm -rf ~/Downloads/{Movies,Music,ISOS}
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# CONDITIONAL EXPRESSIONS

## File Conditionals

Expression | Value | What does it do?
--- | --- | ---
`-a` | `file` | If file exists.
`-b` | `file` | If file exists and is a block special file.
`-c` | `file` | If file exists and is a character special file.
`-d` | `file` | If file exists and is a directory.
`-e` | `file` | If file exists.
`-f` | `file` | If file exists and is a regular file.
`-g` | `file` | If file exists and its set-group-id bit is set.
`-h` | `file` | If file exists and is a symbolic link.
`-k` | `file` | If file exists and its sticky-bit is set
`-p` | `file` | If file exists and is a named pipe (*FIFO*).
`-r` | `file` | If file exists and is readable.
`-s` | `file` | If file exists and its size is greater than zero.
`-t` | `fd` | If file descriptor is open and refers to a terminal.
`-u` | `file` | If file exists and its set-user-id bit is set.
`-w` | `file` | If file exists and is writable.
`-x` | `file` | If file exists and is executable.
`-G` | `file` | If file exists and is owned by the effective group ID.
`-L` | `file` | If file exists and is a symbolic link.
`-N` | `file` | If file exists and has been modified since last read.
`-O` | `file` | If file exists and is owned by the effective user ID.
`-S` | `file` | If file exists and is a socket.

## File Comparisons

Expression | What does it do?
--- | ---
`file -ef file2` | If both files refer to the same inode and device numbers.
`file -nt file2` | If `file` is newer than `file2` (*uses modification time*) or `file` exists and `file2` does not.
`file -ot file2` | If `file` is older than `file2` (*uses modification time*) or `file2` exists and `file` does not.

## Variable Conditionals

Expression | Value | What does it do?
--- | --- | ---
`-o` | `opt` | If shell option is enabled.
`-v` | `var` | If variable has a value assigned.
`-R` | `var` | If variable is a name reference.
`-z` | `var` | If the length of string is zero.
`-n` | `var` | If the length of string is non-zero.

## Variable Comparisons

Expression | What does it do?
--- | ---
`var = var2` | Equal to.
`var == var2` | Eşittir (* `=` ile eş anlamlı *).
`var != var2` | Not equal to.
`var < var2` | Less than (*in ASCII alphabetical order.*)
`var > var2` | Greater than (*in ASCII alphabetical order.*)

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# ARITHMETIC OPERATORS

## Assignment

Operators | What does it do?
--- | ---
`=` | Initialize or change the value of a variable.

## Arithmetic

Operators | What does it do?
--- | ---
`+` | Addition
`-` | Subtraction
`*` | Multiplication
`/` | Division
`**` | Exponentiation
`%` | Modulo
`+=` | Plus-Equal (*Increment a variable.*)
`-=` | Minus-Equal (*Decrement a variable.*)
`*=` | Times-Equal (*Multiply a variable.*)
`/=` | Slash-Equal (*Divide a variable.*)
`%=` | Mod-Equal (*Remainder of dividing a variable.*)

## Bit Tabanlı

Operators | What does it do?
--- | ---
`<<` | Bit Tabanlı Sola Kaydırma
`<<=` | Left-Shift-Equal
`>>` | Bit Tabanlı Sağa Kaydırma
`>>=` | Right-Shift-Equal
`&` | Bit tabanlı AND
`&=` | Bit tabanlı AND-Equal
`|` | Bit tabanlı OR
`|=` | Bit tabanlı OR-Equal
`~` | Bit tabanlı NOT
`^` | Bit tabanlı XOR
`^=` | Bit tabanlı XOR-Equal

## Mantık

Operators | What does it do?
--- | ---
`!` | NOT
`&&` | AND
`||` | OR

## Miscellaneous

Operators | What does it do? | Example
--- | --- | ---
`,` | Comma Separator | `((a=1,b=2,c=3))`

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# ARITHMETIC

## Simpler syntax to set variables

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

## Ternary Tests

```shell
# Set the value of var to var2 if var2 is greater than var.
# var: variable to set.
# var2>var: Condition to test.
# ?var2: If the test succeeds.
# :var: If the test fails.
((var=var2>var?var2:var))
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

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

<!-- CHAPTER START -->

# PERFORMANCE

## Disable Unicode

If unicode is not required, it can be disabled for a performance increase. Results may vary however there have been noticeable improvements in [neofetch](https://github.com/dylanaraps/neofetch) and other programs.

```shell
# Disable unicode.
LC_ALL=C
LANG=C
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# OBSOLETE SYNTAX

## Shebang

Use `#!/usr/bin/env bash` instead of `#!/bin/bash`.

- The former searches the user's `PATH` to find the `bash` binary.
- The latter assumes it is always installed to `/bin/` which can cause issues.

**NOTE**: There are times when one may have a good reason for using `#!/bin/bash` or another direct path to the binary.

```shell
# Right:

    #!/usr/bin/env bash

# Less right:

    #!/bin/bash
```

## Command Substitution

Use `$()` instead of `` ``.

```shell
# Right.
var="$(command)"

# Wrong.
var=`command`

# $() can easily be nested whereas `` cannot.
var="$(command "$(command)")"
```

## Function Declaration

Do not use the `function` keyword, it reduces compatibility with older versions of `bash`.

```shell
# Right.
do_something() {
    # ...
}

# Wrong.
function do_something() {
    # ...
}
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# INTERNAL VARIABLES

## Get the location to the `bash` binary

```shell
"$BASH"
```

## Get the version of the current running `bash` process

```shell
# As a string.
"$BASH_VERSION"

# As an array.
"${BASH_VERSINFO[@]}"
```

## Open the user's preferred text editor

```shell
"$EDITOR" "$file"

# NOTE: This variable may be empty, set a fallback value.
"${EDITOR:-vi}" "$file"
```

## Get the name of the current function

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

## Get the host-name of the system

```shell
"$HOSTNAME"

# NOTE: This variable may be empty.
# Optionally set a fallback to the hostname command.
"${HOSTNAME:-$(hostname)}"
```

## Get the architecture of the Operating System

```shell
"$HOSTTYPE"
```

## Get the name of the Operating System / Kernel

This can be used to add conditional support for different Operating
Systems without needing to call `uname`.

```shell
"$OSTYPE"
```

## Get the current working directory

This is an alternative to the `pwd` built-in.

```shell
"$PWD"
```

## Get the number of seconds the script has been running

```shell
"$SECONDS"
```

## Get a pseudorandom integer

Each time `$RANDOM` is used, a different integer between `0` and `32767` is returned. This variable should not be used for anything related to security (*this includes encryption keys etc*).

```shell
"$RANDOM"
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# INFORMATION ABOUT THE TERMINAL

## Get the terminal size in lines and columns (*from a script*)

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

## Get the terminal size in pixels

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

## Get the current cursor position

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

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# CONVERSION

## Convert a hex color to RGB

**Example Function:**

```sh
hex_to_rgb() {
    # Usage: hex_to_rgb "#FFFFFF"
    #        hex_to_rgb "000000"
    : "${1/\#}"
    ((r=16#${_:0:2},g=16#${_:2:2},b=16#${_:4:2}))
    printf '%s\n' "$r $g $b"
}
```

**Example Usage:**

```shell
$ hex_to_rgb "#FFFFFF"
255 255 255
```

## Convert an RGB color to hex

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

# CODE GOLF

## Shorter `for` loop syntax

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

## Shorter infinite loops

```shell
# Normal method
while :; do echo hi; done

# Shorter
for((;;)){ echo hi;}
```

## Shorter function declaration

```shell
# Normal method
f(){ echo hi;}

# Using a subshell
f()(echo hi)

# Using arithmetic
# This can be used to assign integer values.
# Example: f a=1
#          f a++
f()(($1))

# Using tests, loops etc.
# NOTE: ‘while’, ‘until’, ‘case’, ‘(())’, ‘[[]]’ can also be used.
f()if true; then echo "$1"; fi
f()for i in "$@"; do echo "$i"; done
```

## Shorter `if` syntax

```shell
# One line
# Note: The 3rd statement may run when the 1st is true
[[ $var == hello ]] && echo hi || echo bye
[[ $var == hello ]] && { echo hi; echo there; } || echo bye

# Multi line (no else, single statement)
# Note: The exit status may not be the same as with an if statement
[[ $var == hello ]] &&
    echo hi

# Multi line (no else)
[[ $var == hello ]] && {
    echo hi
    # ...
}
```

## Simpler `case` statement to set variable

The `:` built-in can be used to avoid repeating `variable=` in a case statement. The `$_` variable stores the last argument of the last command. `:` always succeeds so it can be used to store the variable value.

```shell
# Modified snippet from Neofetch.
case "$OSTYPE" in
    "darwin"*)
        : "MacOS"
    ;;

    "linux"*)
        : "Linux"
    ;;

    *"bsd"* | "dragonfly" | "bitrig")
        : "BSD"
    ;;

    "cygwin" | "msys" | "win32")
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

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# OTHER

## Use `read` as an alternative to the `sleep` command

Surprisingly, `sleep` is an external command and not a `bash` built-in.

**CAVEAT:** Requires `bash` 4+

**Example Function:**

```sh
read_sleep() {
    # Usage: read_sleep 1
    #        read_sleep 0.2
    read -rt "$1" <> <(:) || :
}
```

**Example Usage:**

```shell
read_sleep 1
read_sleep 0.1
read_sleep 30
```

For performance-critical situations, where it is not economic to open and close an excessive number of file descriptors, the allocation of a file descriptor may be done only once for all invocations of `read`:

(https://blog.dhampir.no/content/sleeping-without-a-subprocess-in-bash-and-how-to-sleep-forever adresindeki genel orijinal uygulamaya bakın)

```shell
exec {sleep_fd}<> <(:)
while some_quick_test; do
    # equivalent of sleep 0.001
    read -t 0.001 -u $sleep_fd
done
```

## Check if a program is in the user's PATH

```shell
# There are 3 ways to do this and either one can be used.
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

# Example (Exit early if program is not installed).
if ! type -p convert &>/dev/null; then
    printf '%s\n' "error: convert is not installed, exiting..."
    exit 1
fi
```

## Get the current date using `strftime`

Bash’s `printf` has a built-in method of getting the date which can be used in place of the `date` command.

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

## Get the username of the current user

**CAVEAT:** Requires `bash` 4.4+

```shell
$ : \\u
# Expand the parameter as if it were a prompt string.
$ printf '%s\n' "${_@P}"
black
```

## Generate a UUID V4

**CAVEAT**: The generated value is not cryptographically secure.

**Example Function:**

```sh
uuid() {
    # Usage: uuid
    C="89ab"

    for ((N=0;N<16;++N)); do
        B="$((RANDOM%256))"

        case "$N" in
            6)  printf '4%x' "$((B%16))" ;;
            8)  printf '%c%x' "${C:$RANDOM%${#C}:1}" "$((B%16))" ;;

            3|5|7|9)
                printf '%02x-' "$B"
            ;;

            *)
                printf '%02x' "$B"
            ;;
        esac
    done

    printf '\n'
}
```

**Example Usage:**

```shell
$ uuid
d5b6c731-1310-4c24-9fe3-55d556d44374
```

## Progress bars

This is a simple way of drawing progress bars without needing a for loop
in the function itself.

**Example Function:**

```sh
bar() {
    # Usage: bar 1 10
    #            ^----- Elapsed Percentage (0-100).
    #               ^-- Total length in chars.
    ((elapsed=$1*$2/100))

    # Create the bar with spaces.
    printf -v prog  "%${elapsed}s"
    printf -v total "%$(($2-elapsed))s"

    printf '%s\r' "[${prog// /-}${total}]"
}
```

**Example Usage:**

```shell
for ((i=0;i<=100;i++)); do
    # Pure bash micro sleeps (for the example).
    (:;:) && (:;:) && (:;:) && (:;:) && (:;:)

    # Print the bar.
    bar "$i" "10"
done

printf '\n'
```

## Get the list of functions in a script

```sh
get_functions() {
    # Usage: get_functions
    IFS=$'\n' read -d "" -ra functions < <(declare -F)
    printf '%s\n' "${functions[@]//declare -f }"
}
```

## Bypass shell aliases

```shell
# alias
ls

# command
# shellcheck disable=SC1001
\ls
```

## Bypass shell functions

```shell
# function
ls

# command
command ls
```

## Run a command in the background

This will run the given command and keep it running, even after the terminal or SSH connection is terminated. All output is ignored.

```sh
bkr() {
    (nohup "$@" &>/dev/null &)
}

bkr ./some_script.sh # some_script.sh is now running in the background
```

<!-- CHAPTER END -->

# AFTERWORD

Thanks for reading! If this bible helped you in any way and you'd like to give back, consider donating. Donations give me the time to make this the best resource possible. Can't donate? That's OK, star the repo and share it with your friends!

<a href="https://www.patreon.com/dyla"><img src="https://img.shields.io/badge/donate-patreon-yellow.svg"></a>

Rock on. 🤘
