#!/usr/bin/env bash
function filesCount() {
    count=$(ls -l | grep ^- | wc -l)
    echo $count
}

count=$(filesCount)
echo "Can you guess how many files are in the current directory?"
ret=0
while [[ $ret -eq 0 ]]
do
    read user_answer
    if [[ $user_answer -gt $count ]]
    then
        echo "Your guess was too high, please try to guess again."
    elif [[ $user_answer -lt $count ]]
    then
        echo "Your guess was too low, please try to guess again."
    else
        let ret=1
        echo "Congratulation! Your guess was correct."
    fi
done
