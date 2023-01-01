#!/bin/bash

# Dependencies:
# - GNU Wget
# - ImageMagick/GraphicsMagick ('identify' command)


delete_invalid() {
    info=$(identify "$1")

    # delete corrupt
    if [ $? -ne 0 ]; then
        rm "$1"
        return 0
    fi

    # delete invalid
    if [[ $info =~ "2c" ]]; then
        rm "$1"
        return 0
    fi
}


ratelimit() {
    sleep 0.2s
}


download() {
    link="https://www.rodoviariadelisboa.pt/phpThumb/phpThumb.php?src=/sync/opt/"
    
    wget -nc --quiet "$link$1" && echo Downloaded \'"$1"\'
}


rename_files() {
    find . -type f -name "*src*" -exec bash -c 'f="$1"; g="${f/*2F/}"; mv -- "$f" "$g"' _ '{}' \;
}


c=$(cat lista_carreiras_numeros.txt)

[ $? -ne 0 ] && exit 1


mkdir horarios 2> /dev/null
cd horarios || exit


for i in $c
do
    f="${i}_Ida_Escolar_lineSched_site.svg.png"
    download "$f"
    ratelimit

    f="${i}_Ida_Nao%20Escolar_lineSched_site.svg.png"
    download "$f"
    ratelimit

    f="${i}_Ida_Verao_lineSched_site.svg.png"
    download "$f"
    ratelimit

    f="${i}_Ida_Todo%20o%20Ano_lineSched_site.svg.png"
    download "$f"
    ratelimit
done

echo
echo Renaming files...
rename_files

echo Deleting invalid files...
for i in *.png
do
    delete_invalid "$i"
done

echo Done!
