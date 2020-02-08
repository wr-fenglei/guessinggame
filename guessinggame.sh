#!/usr/bin/env bash

function is_natural_number() {
    [[ $1 =~ ^[1-9][0-9]*$|^0$ ]] && true || false
}

function is_overflow() {
    # 9223372036854775807
    local digits=$(echo $1 | egrep -o "[1-9][0-9]*$")
    # not more than 19 digits
    if [[ ${#digits} -gt 19 ]]; then
        return 0
    fi
    # require the same sign
    local str_num=$1
    typeset -i int_num=$1
    if [[ ${str_num:0:1} = "-" ]]; then
        [[ ${int_num:0:1} != "-" ]] && return 0 || return 1
    else
        [[ ${int_num:0:1} = "-" ]] && return 0 || return 1
    fi
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
