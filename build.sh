#!/usr/bin/env bash
#
# Turn the single document bible into a book separated by chapters.
extract() {
    # Usage: extract file "opening marker" "closing marker"
    while IFS=$'\n' read -r line; do
        [[ $extract && $line != "$3" ]] &&
            printf '%s\n' "$line"

        [[ $line == "$2" ]] && extract=1
        [[ $line == "$3" ]] && extract=
    done < "$1"
}

main() {
    rm -rf manuscript
    mkdir -p manuscript

    # Split the README.md into chapters based on markers.
    while IFS=$'\n' read -r line; do
        [[ "$chap" ]] && chapter[$i]+="$line"$'\n'
        [[ "$line" == "<!-- CHAPTER START -->" ]] && chap=1
        [[ "$line" == "<!-- CHAPTER END -->" ]]   && { chap=; ((i++)); }
    done < README.md

    # Write the chapters to separate files.
    for i in "${!chapter[@]}"; do
        : "${chapter[$i]/$'\n'*}"; : "${_/\# }"; : "${_,,}"
        printf '%s\n' "${chapter[$i]}" > "manuscript/chapter${i}.txt"
        printf '%s\n' "chapter${i}.txt" >> "manuscript/Book.txt"
    done

    # extract shell code to pure_bash_bible.sh based on markers
    extract ./README.md '```sh' '```' > pure_bash.sh
}

main
