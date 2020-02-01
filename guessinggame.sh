function count() {
    echo $(ls -al | grep ^- | wc -l)
}

function is_integer() {
    [[ $1 =~ ^0$|^[+-]?[1-9][0-9]*$ ]] && true || false
}

function compare() {
    if [[ $1 -gt $2 ]]; then
        echo "Your guess was too high, please try to guess again."
    elif [[ $1 -lt $2 ]]; then
        echo "Your guess was too low, please try to guess again."
    else
        echo "Congratulation! Your guess was correct."
    fi
}

echo "Can you guess how many files are in the current directory?"
count=$(count)
while ! ($(is_integer $answer) && [[ $answer -eq $count ]]); do
    read answer
    if ! $(is_integer $answer); then
        echo "Your guess was not integer, please try to guess again."
    else
        echo $(compare $answer $count)
    fi
done
