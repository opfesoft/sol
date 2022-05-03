#!/bin/bash

CURRENT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_PATH/includes.sh"

UPDATES_PATH="$AC_PATH_ROOT/data/sql/updates/"

function import() {
    db=$1
    folder="db_"$db
    pendingPath="$AC_PATH_ROOT/data/sql/updates/pending_$folder"
    updPath="$UPDATES_PATH/$folder"

    latestUpd=`ls -1 $updPath/ | tail -n 1`
    dateToday=`date +%Y_%m_%d`
    counter=0

    tmp=${latestUpd#*_*_*_}
    oldCnt=${tmp%.sql}
    oldDate=${latestUpd%_$tmp}

    if [ "$oldDate" = "$dateToday" ]; then
        counter=$(printf "$oldCnt" | awk '{print $0 + 1}')
    fi;

    for entry in "$pendingPath"/*.sql
    do
        if [[ -e $entry ]]; then
            cnt=$(printf -v counter "%02d" $counter ; echo $counter)

            newFile="$updPath/"$dateToday"_"$cnt".sql"
            cat $entry >> "$newFile";

            if [ "$(tail -c 1 "$newFile"; echo x)" != $'\nx' ]
            then
                echo "" >> "$newFile";
            fi

            rm $entry;

            ((counter+=1))
        fi
    done

}

import "world"
import "characters"
import "auth"

echo "Done."
