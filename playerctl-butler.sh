#!/usr/bin/env bash
if ! hash playerctl 2>/dev/null; then
  echo "FATAL: playerctl required but not found in PATH."
  exit 1
fi

declare -A map
map["NoCopyright;;Best Hits"]=70
map["copyleft;;best of"]=85

format="{{artist}};;{{album}}"
player="vlc"
interval=5

queryAndSetVolume() {
  command="playerctl -p $player metadata -f $format"
  output=$($command 2>&1)
  output=${output,,}
  [ "${map[$output]}" ] && playerctl -p $player volume $(LC_NUMERIC=POSIX printf %.2f "$((10**3 * "${map[$output]}"/100))e-3")
  loop
}

loop() {
  while $command 2>&1 | grep -xi "$output"; do
    sleep $interval
  done
  queryAndSetVolume
}

queryAndSetVolume
