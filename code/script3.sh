#!/bin/bash

dares=("Eat a spoonful of hot sauce" "Sing in public" "Do 10 push-ups" "Call a friend and speak in a silly accent" "Wear a ridiculous outfit for the rest of the day")

# Leaderboard
declare -A leaderboard

#Menu function
display_menu() {
    echo "Welcome to the Dare Game!"
    echo "1. Start a new game"
    echo "2. View leaderboard"
    echo "3. View dares"
    echo "4. Exit"
    read -p "Please select an option: " choice
}

# Game function
play_game() {

    read -p "Enter your name: " playername
    # Get a random number between 1-50 and store it in a variable called num
    num=$(( $RANDOM % 50 + 1 ))
    echo -e "\033[1;36mEnter the guessed number\033[0m"
    for (( turns=5; turns>=1; turns-- ));
    do
        # take input as a guess
        read guess

        if [[ $guess -gt 50 || $guess -lt 0 ]];then
            echo -e "\033[1;31mEnter a number between 0-50. $[ turns ] turns left\033[0m"
            turns=$((turns+1))

        elif [[ $guess == $num ]];then
            echo -e "\033[1;32mYour guess is correct. You win!\033[0m"
            # Adding the user to leaderboard if not present
            if [ -z "${leaderboard[$USER]}" ]
            then
                leaderboard[$USER]=0
            fi
            leaderboard[$USER]=$((${leaderboard[$USER]}+1))
            exit 1

        # guess is greater than random number    
        elif [[ $guess -ge $num ]];then
            if [[ $(($turns-1)) == 1 ]]; then
                echo -e "\033[1;33mTry a smaller number:  $[ turns-1 ] turn left\033[0m"
            else 
                echo -e "\033[1;33mTry a smaller number:  $[ turns-1 ] turns left\033[0m"
            fi

        # guess is smaller than random number
        else
            if [[ $(($turns-1)) == 1 ]]; then
                echo -e "\033[1;33mTry a larger number: $[ turns-1 ] turn left\033[0m"

            else 
                echo -e "\033[1;33mTry a larger number: $[ turns-1 ] turns left\033[0m"
            fi
        fi

    done

    # exiting out of for loop
    echo -e "\033[1;31mYou lose! The correct number is $num\033[0m"
    sleep 1
    echo

    # Generating dares
    echo -e "\033[1;35mNow it's time for dare. Haha.\033[0m"
    sleep 1
    echo

    echo -e "\033[1;35mYour dare is .......\033[0m"
    sleep 1
    echo
    echo "${dares[$index]}"
    exit 1
}

# Leaderboard function
view_leaderboard() {
    if [ ${#leaderboard[@]} -eq 0 ]
    then
        echo -e "\033[1;31mNo one has played the game yet\033[0m"
    else
        echo "Player Name - Wins"
        for key in "${!leaderboard[@]}"
        do
            echo -e "$key - ${leaderboard[$key]}"
        done
    fi
}

# Dares function
view_dares() {
    for dare in "${dares[@]}"
    do
        echo -e "\033[1;33m$dare\033[0m"
    done
}

# Main loop
while true; do
    display_menu
    case $choice in
        1) play_game;;
        2) view_leaderboard;;
        3) view_dares;;
        4) exit;;
        *) echo -e "\033[1;31mInvalid option, please try again\033[0m";;
    esac
done

