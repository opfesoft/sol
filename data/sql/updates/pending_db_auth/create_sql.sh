#!/bin/bash

CUR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )/" && pwd )";
rev=$( date +%s%N );
filename=rev_"$rev".sql

touch "$CUR_PATH/$filename" && echo "File created: $filename";
