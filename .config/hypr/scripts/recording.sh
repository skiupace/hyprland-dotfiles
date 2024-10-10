#!/usr/bin/env bash

getdate() {
    date '+%Y-%m-%d_%H.%M.%S'
}
getaudiooutput() {
    pactl list sources | grep 'Name' | grep 'monitor' | cut -d ' ' -f2
}
getactivemonitor() {
    hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name'
}

VIDEOS_DIR="$HOME/Videos/Recordings"
mkdir -p "$VIDEOS_DIR"

if pgrep wf-recorder > /dev/null; then
    notify-send "Recording Stopped" "Stopped" -a 'record-script.sh' &
    pkill wf-recorder &
else
    FILENAME="${VIDEOS_DIR}/recording_$(getdate).mp4"
    notify-send "Starting recording" 'recording_'"$(getdate)"'.mp4' -a 'record-script.sh'
    if [[ "$1" == "--sound" ]]; then
        wf-recorder --pixel-format yuv420p -f "$FILENAME" -t --geometry "$(slurp -b 00000080 -c 00000080)" --audio="$(getaudiooutput)" & disown
    elif [[ "$1" == "--fullscreen-sound" ]]; then
        wf-recorder -o $(getactivemonitor) --pixel-format yuv420p -f "$FILENAME"  -t --audio="$(getaudiooutput)" & disown
    elif [[ "$1" == "--fullscreen" ]]; then
        wf-recorder -o $(getactivemonitor) --pixel-format yuv420p -f "$FILENAME"  -t & disown
    else
        wf-recorder --pixel-format yuv420p -f "$FILENAME"  -t --geometry "$(slurp -b 00000080 -c 00000080)" & disown
    fi
fi
