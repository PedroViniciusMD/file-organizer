#! /bin/bash

#config your dir (pwd)
dir=""
shopt -s nocasematch

for archive in "$dir"/* #all archives
do 
    if [[ -f "$archive" ]]
    then 
        case "$archive" in 
            *.jpg | *.jpeg | *.png | *.gif | *.svg | *.raw )
                mkdir -p "$dir/images" #inheritance
                mv "$archive" "$dir/images/"
                ;;
            *.mp4 | *.mkv | *.mov | *.avi | *.wmv )
                mkdir -p "$dir/videos"
                mv "$archive" "$dir/videos/"
                ;; 
            *.mp3 | *.wav | *.m4a )
                mkdir -p "$dir/musics"
                mv "$archive" "$dir/musics/"
                ;; 
            *.pdf | *.docx | *.doc | *.xlsx | *.xls | *.csv | *.txt |*.md )
                mkdir -p "$dir/docs"
                mv "$archive" "$dir/docs/"
                ;; 
            *.pptx | *.ppt )
                mkdir -p "$dir/slides"
                mv "$archive" "$dir/slides/"
                ;;
            *)
                mkdir -p "$dir/others"
                mv "$archive" "$dir/others/"
                ;;
        esac
    fi
done

shopt -u nocasematch
