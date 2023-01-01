#!/bin/bash

# Dependencies: wget or aria2

link="https://www.rodoviariadelisboa.pt/phpThumb/phpThumb.php?src=/sync/opt/"

mkdir h 2> /dev/null
cd h || exit


run_aria2_version() {
    while read i; do
        aria2c --quiet --continue --allow-overwrite=false --auto-file-renaming=false "$link$i" -o "$i" && echo Downloaded \'"$i"\'
        sleep 0.2s
    done < ../lista_horarios_pngs.txt
}

run_wget_version() {
    while read i; do
        wget -nc --quiet "$link$i" && echo Downloaded \'"$i"\'
        find . -type f -name "*src*" -exec bash -c 'f="$1"; g="${f/*2F/}"; mv -- "$f" "$g"' _ '{}' \;
        sleep 0.2s
    done < ../lista_horarios_pngs.txt
}

if command -v aria2c &> /dev/null
then  
    echo aria2 detected. Using aria2.
    run_aria2_version
else
    echo aria2 not detected. Using Wget.
    run_wget_version
fi
