#!/bin/bash

dares=("Eat a spoonful of hot sauce" "Sing in public" "Do 10 push-ups" "Call a friend and speak in a silly accent" "Wear a ridiculous outfit for the rest of the day")

# Get a random index between 0 and the number of dares - 1
index=$((RANDOM % ${#dares[@]}))

# Store the random number between 1-50 inside a variable called as num
num=$(( $RANDOM % 50 + 1 ))

echo "Enter the guessed number"

for (( turns=5; turns>=1; turns-- ));
do
    # take input as a guess
    read guess

    if [[ $guess -gt 50 || $guess -lt 0 ]];then
        echo "Enter a number between 0-50. $[ turns ] turns left"
        turns=$((turns+1))

    elif [[ $guess == $num ]];then
        echo "Your guess is correct. You win!"
        exit 1

    # guess is greater than random number    
    elif [[ $guess -ge $num ]];then
        # echo "Debugger $[ turns ]"
        if [[ $(($turns-1)) == 1 ]]; then
            echo "Try a smaller number:  $[ turns-1 ] turn left"
        else 
            echo "Try a smaller number:  $[ turns-1 ] turns left"
        fi

    # guess is smaller than random number
    else
        if [[ $(($turns-1)) == 1 ]]; then
            echo "Try a larger number: $[ turns-1 ] turn left"

        else 
            echo "Try a larger number: $[ turns-1 ] turns left"
        fi
    fi

done

# exiting out of for loop

echo

echo "You lose! The correct number is $num "
sleep 1

echo

# Generating dares

echo "Now it's time for dare. Haha."
sleep 1

echo

echo "your dare is ......."
sleep 1

echo

echo "${dares[$index]}"
exit 1
