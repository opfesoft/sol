#!/bin/bash

set -e

CURRENT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_PATH/includes.sh"

function dbasm_assemble() {
    # to lowercase
    database=${1,,}
    start_sql=$2
    with_base=$3
    with_updates=$4
    with_custom=$5

    uc=${database^^}

    name="DB_"$uc"_PATHS"
    v="$name[@]"
    base=("${!v}")

    name="DB_"$uc"_UPDATES_PATHS"
    v="$name[@]"
    updates=("${!v}")

    name='DB_'$uc'_CUSTOM_PATHS'
    v="$name[@]"
    custom=("${!v}")


    suffix_base="_base"
    suffix_upd="_updates"
    suffix_custom="_custom"

    curTime=`date +%Y_%m_%d_%H_%M_%S`
    echo "--- $db ---"

    if [ $with_base = true ]; then
        baseFile=$OUTPUT_FOLDER$database$suffix_base".sql"
        printf "" > $baseFile

        if [ ! ${#base[@]} -eq 0 ]; then
            echo "Generate $baseFile"
            echo "Search directories:"
            for i in ${base[@]}; do
                echo "  $i"
            done
            baseFileCount=0

            while read entry; do
                echo "-- $entry" >> $baseFile
                cat "$entry" >> $baseFile
                printf "\n\n" >> $baseFile
                baseFileCount=$((baseFileCount+1))
            done < <(find ${base[@]} -type f -name '*.sql' | sort)

            printf "Total base files found: %s\n\n" $baseFileCount
        fi
    fi

    if [ $with_updates = true ]; then
        updFile=$OUTPUT_FOLDER$database$suffix_upd".sql"
        printf "" > $updFile

        if [ ! ${#updates[@]} -eq 0 ]; then
            echo "Generate $updFile"
            echo "Search directories:"
            echo "(file names instead of file paths will be used to determine the order of the SQL update files!)"
            for i in ${updates[@]}; do
                echo "  $i"
            done
            updateFileCount=0

            # sort by file name instead of file path because the SQL update files use the date as file name
            # and should be concatenated in the right order even if using multiple update directories
            while read entry; do
                echo "-- $entry" >> $updFile
                cat "$entry" >> $updFile
                printf "\n\n" >> $updFile
                updateFileCount=$((updateFileCount+1))
            done < <(find ${updates[@]} -type f -name '*.sql' | awk -F'/' '{printf("%s %s\n", $0, $(NF))}' | sort -k2 | awk '{print $1}')

            printf "Total update files found: %s\n\n" $updateFileCount
        fi
    fi

    if [ $with_custom = true ]; then
        custFile=$OUTPUT_FOLDER$database$suffix_custom".sql"
        printf "" > $custFile

        if [ ! ${#custom[@]} -eq 0 ]; then
            echo "Generate $custFile"
            echo "Search directories:"
            for i in ${custom[@]}; do
                echo "  $i"
            done
            customFileCount=0

            while read entry; do
                echo "-- $entry" >> $custFile
                cat "$entry" >> $custFile
                printf "\n\n" >> $custFile
                customFileCount=$((customFileCount+1))
            done < <(find ${custom[@]} -type f -name '*.sql' | sort)

            printf "Total custom files found: %s\n\n" $customFileCount
        fi
    fi

    echo
}

function dbasm_run() {
    echo "===== STARTING ASSEMBLY PROCESS ====="

        mkdir -p "$OUTPUT_FOLDER"

        for db in ${DATABASES[@]}
        do
            dbasm_assemble "$db" $version".sql" $1 $2 $3
        done

    echo "=====           DONE            ====="
}

case "$1" in
    1) dbasm_run true true true ;;
    2) dbasm_run true false false ;;
    3) dbasm_run false true false ;;
    4) dbasm_run false false true ;;
    *) printf "1 Assemble all\n2 Assemble only bases\n3 Assemble only updates\n4 Assemble only customs\n" ;;
esac
