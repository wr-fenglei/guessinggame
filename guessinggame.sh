#!/usr/bin/env bash

function is_natural_number() {
    [[ $1 =~ ^[1-9][0-9]*$|^0$ ]]
}

function is_overflow() {
    # the upper limit for Bash integer is 9223372036854775807 (19 digits)
    # 0 ... 9223372036854775807 is valid,
    # 9223372036854775808 ... 9999999999999999999 will became a signed negative number,
    # 10000000000000000000 .... may be signed negative or positive, but must be more than 19 digits.
    # Thanks Mateusz Kita
    [[ ${#1} -gt 19 ]] || [[ $1 -lt 0 ]]
}

echo "Can you guess how many files are in the current directory?"
count=$(ls -A1 | wc -l)
correct=false
while [[ "$correct" = false ]]; do
    read answer
    if ! $(is_natural_number $answer); then
        echo "Your guess was not natural number, please try to guess again."
    elif $(is_overflow $answer); then
        echo "Your guess was overflow, please try to guess again."
    elif [[ $answer -gt $count ]]; then
        echo "Your guess was too high, please try to guess again."
    elif [[ $answer -lt $count ]]; then
        echo "Your guess was too low, please try to guess again."
    else
        echo "Congratulation! Your guess was correct."
        let correct=true
    fi
done
