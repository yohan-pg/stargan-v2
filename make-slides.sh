#!/bin/bash

function preparefolder {
    >&2 echo "$1"
    cat <<EOF
        tell application "Keynote"
            activate
            if not (exists document 1) then error number -128
            tell front document
                make new slide with properties {base slide: master slide "Section Title"}
                set group_slide to the current slide
                tell the current slide 
                    set the object text of the default title item to "$(basename "$1")"
                    set the object text of the default body item to ""
                end 
                $(
                    for subfolder in "$1"/*.jpg; do
                        prepare_subfolder "$1" "$subfolder"
                    done
                )
            end tell
        end tell
EOF
}

function prepare_subfolder {
    >&2 echo "$1" "$2"
    if [[ "$2" == *"cycle"* ]]; then
        cat <<EOF
            make new slide with properties {base slide: master slide "Short Grid"}
EOF
    else
        cat <<EOF
            make new slide with properties {base slide: master slide "Full Grid"} 
EOF
    fi;
    cat <<EOF
        tell the current slide 
            set the object text of the default title item to "$2"
            set file name of image 1 to POSIX file "$(pwd)/$2"
        end tell
EOF
}

for folder in results/*; do 
    preparefolder "$folder" | osascript
done
