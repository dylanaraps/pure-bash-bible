#!/usr/bin/env bash
#
# Turn the single document bible into a book separated by chapters.

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
}

main
