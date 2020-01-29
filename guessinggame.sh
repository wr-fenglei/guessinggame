#!/usr/bin/env bash
function count() {
    count=$(ls -l | grep ^- | wc -l)
    echo $count
}

function compare() {
    if [[ $1 -gt $2 ]]
    then
        echo "Your guess was too high, please try to guess again."
    elif [[ $1 -lt $2 ]]
    then
        echo "Your guess was too low, please try to guess again."
    else
        echo "Congratulation! Your guess was correct."
    fi
}

count=$(count)
echo "Can you guess how many files are in the current directory?"
while [[ $user_answer -ne $count ]]
do
    read user_answer
    echo $(compare $user_answer $count)
done
