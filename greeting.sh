#!/bin/bash

NAME=""
WISHES=""

USAGE(){
    echo "USAGE:: $(basename $0) -n <name> -w <wishes>"
    echo "Options::"
    echo " -n, Specify the name (mandatory) "
    echo " -w, specify the wishes. ex, Good Morning"
    echo " -h, Display Help and exit"
}

while getopts ":n:w:h" opt; do
    case $opt in
        n) NAME="$OPTARG";;
        w) WISHES="$OPTARG";;
        \?) echo "invalid options: -"$OPTARG"" >&2; exit 1;;
        :) USAGE; exit 1;;
        h) USAGE; exit 0;;
    esac
done
if [ -z "$NAME" ]; then
    echo "Error: Name (-n) is required"
    USAGE
    exit 1
fi
if [ -z "$WISHES" ]; then
    WISHES="Hello"
fi

# echo "$WISHES, $NAME!"