#!/usr/bin/env zsh

# Usage: cd to the directory, run the script, recompile files

# -q for quiet
# -m for monitor (i.e. run indefinitely)
# -e close_write (monitor close write events)
inotifywait -q -m -e close_write "$PWD" |
while read event filename; do
    clear
    echo "$filename" | awk '{print $2}'
    javac *.java
done
