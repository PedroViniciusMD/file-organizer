#! /bin/bash

read -p "Config Your Dir: " dir

if [[ ! -d "$dir" ]]
then
    echo "Error: The directory '$dir' does not exist."
    exit 1
fi

start_time=$(date +%s)
echo ""

img_count=0
vid_count=0
music_count=0
doc_count=0
slide_count=0
other_count=0

shopt -s nocasematch

for archive in "$dir"/* #all archives
do 
    if [[ -f "$archive" ]]
    then 
        case "$archive" in 
            *.jpg | *.jpeg | *.png | *.gif | *.svg | *.raw )
                mkdir -p "$dir/images" #inheritance
                mv "$archive" "$dir/images/"
                (( img_count++ ))
                ;;
            *.mp4 | *.mkv | *.mov | *.avi | *.wmv )
                mkdir -p "$dir/videos"
                mv "$archive" "$dir/videos/"
                (( vid_count++ ))
                ;; 
            *.mp3 | *.wav | *.m4a )
                mkdir -p "$dir/musics"
                mv "$archive" "$dir/musics/"
                (( music_count++ ))
                ;; 
            *.pdf | *.docx | *.doc | *.xlsx | *.xls | *.csv | *.txt |*.md )
                mkdir -p "$dir/docs"
                mv "$archive" "$dir/docs/"
                (( doc_count++ ))
                ;; 
            *.pptx | *.ppt )
                mkdir -p "$dir/slides"
                mv "$archive" "$dir/slides/"
                (( slide_count++ ))
                ;;
            *)
                mkdir -p "$dir/others"
                mv "$archive" "$dir/others/"
                (( other_count++ ))
                ;;
        esac
    fi
done

shopt -u nocasematch

total_count=$(( img_count+vid_count+music_count+doc_count+slide_count+other_count ))
end_time=$(date +%s)
execution_time=$(( end_time - start_time ))
timestamp=$(date '+%Y%m%d_%H%M%S')

#Report Infos
echo "=========================================="
echo "*** Report ($(date '+%Y-%m-%d %H:%M:%S')) ***"
echo "=========================================="
echo "Images moved: $img_count" 
echo "Videos moved: $vid_count" 
echo "Musics moved: $music_count"
echo "Docs moved: $doc_count" 
echo "Slides moved: $slide_count" 
echo "Other Types moved: $other_count" 
echo "------------------------------------------"
echo "Total Files moved: $total_count"
echo "Time elapsed in seconds: ${execution_time}s"
echo "=========================================="
echo ""
#echo $start_time
#echo $end_time


#Report File
mkdir -p "$dir/reports"
report_file="$dir/reports/report_${timestamp}.log"

echo "==========================================" > "$report_file"
echo "*** RUN LOG: $(date '+%Y-%m-%d %H:%M:%S') ***" >> "$report_file"
echo "==========================================" >> "$report_file"
echo "Executed by      : $USER" >> "$report_file"
echo "Machine          : $HOSTNAME" >> "$report_file"
echo "Target Directory : $dir" >> "$report_file"
echo "------------------------------------------" >> "$report_file"
echo "Images moved     : $img_count" >> "$report_file"
echo "Videos moved     : $vid_count" >> "$report_file"
echo "Musics moved     : $music_count" >> "$report_file"
echo "Docs moved       : $doc_count" >> "$report_file"
echo "Slides moved     : $slide_count" >> "$report_file"
echo "Other Types moved: $other_count" >> "$report_file"
echo "------------------------------------------" >> "$report_file"
echo "Total Files      : $total_count" >> "$report_file"
echo "Execution Time   : ${execution_time}s" >> "$report_file"
echo "==========================================" >> "$report_file"
echo "Log saved to: $report_file"
echo ""