#!/usr/bin/env bash

set -e

CURRENT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_PATH/includes/includes.sh"

cmdopt=$1

PS3='[Please enter your choice]: '
options=(
    "all: Assemble all"              # 1
    "bases: Assemble only bases"     # 2
    "updates: Assemble only updates" # 3
    "customs: Assemble only customs" # 4
    "quit: Exit from this menu"      # 5
    )

function _switch() {
    _reply="$1"
    _opt="$2"

    case $_reply in
        ""|"all"|"1")
            dbasm_run true true true
            ;;
        ""|"bases"|"2")
            dbasm_run true false false
            ;;
        ""|"updates"|"3")
            dbasm_run false true false
            ;;
        ""|"customs"|"4")
            dbasm_run false false true
            ;;
        ""|"quit"|"5")
            echo "Goodbye!"
            exit
            ;;
        ""|"--help")
            echo "Available commands:"
            printf '%s\n' "${options[@]}"
            ;;
        *) echo "invalid option, use --help option for the commands list";;
    esac
}

while true
do
    # run option directly if specified in argument
    [ ! -z $1 ] && _switch $@
    [ ! -z $1 ] && exit 0

    select opt in "${options[@]}"
    do
        echo "=====     DB ASSEMBLER MENU     ====="
        _switch $REPLY
        break
    done
done
