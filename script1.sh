#!/bin/bash

echo "Hey what's your name?"
read name

echo 

echo "Okay $name,Are you ready to play guess-the-number game?"
echo "Press Y for Yes, N for no"
read answer

if [[ $answer == "N" ]]
then
    echo "Huh! Byeee"
    exit 1
fi

if [[ $answer == "Y" ]]
then
    echo "Here are the rules for the game:"
    sleep 2 

    echo "I'll choose a random number between 1-50 and you'll have to guess that number in 5 tries. If your guess is higher than the number I chose, I'll give you a hint to choose a smaller number and vice versa. Finally, if your guess is correct, you win. If you didn't, I'll give you a random dare to do"

    sleep 1

    echo

    echo "Let's start"
fi

echo

source script2.sh