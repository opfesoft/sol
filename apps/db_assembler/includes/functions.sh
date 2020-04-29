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

    # Enable directory recursion using wildcard pattern "**"
    shopt -s globstar

    if [ $with_base = true ]; then
        echo "" > $OUTPUT_FOLDER$database$suffix_base".sql"


        if [ ! ${#base[@]} -eq 0 ]; then
            echo "Generating $OUTPUT_FOLDER$database$suffix_base ..."

            for d in "${base[@]}"
            do
                echo "Searching on $d ..."
                if [ ! -z $d ]; then
                    for entry in "$d"/**/*.sql
                    do
                        if [[ -e $entry ]]; then
                            cat "$entry" >> $OUTPUT_FOLDER$database$suffix_base".sql"
                        fi
                    done
                fi
            done
        fi
    fi

    if [ $with_updates = true ]; then
        updFile=$OUTPUT_FOLDER$database$suffix_upd".sql"

        echo "" > $updFile

        if [ ! ${#updates[@]} -eq 0 ]; then
            echo "Generating $OUTPUT_FOLDER$database$suffix_upd ..."

            for d in "${updates[@]}"
            do
                echo "Searching on $d ..."
                if [ ! -z $d ]; then
                    for entry in "$d"/**/*.sql
                    do
                        if [[ ! -e $entry ]]; then
                            continue
                        fi

                        echo "-- $file" >> $updFile
                        cat "$entry" >> $updFile
                    done
                fi
            done
        fi
    fi

    if [ $with_custom = true ]; then
        custFile=$OUTPUT_FOLDER$database$suffix_custom".sql"

        echo "" > $custFile

        if [ ! ${#custom[@]} -eq 0 ]; then
            echo "Generating $OUTPUT_FOLDER$database$suffix_custom ..."

            for d in "${custom[@]}"
            do
                echo "Searching on $d ..."
                if [ ! -z $d ]; then
                    for entry in "$d"/**/*.sql
                    do
                        if [[ ! -e $entry ]]; then
                            continue
                        fi

                        echo "-- $file" >> $custFile
                        cat "$entry" >> $custFile
                    done
                fi
            done
        fi
    fi
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
