# !/bin/bash
# Reads input regarding what user wants
read input

cd "$HOME/.config/polybar/scripts/diskspace" 
touch usage

# prints disk usage using vizex
vizex --path / > $HOME/.config/polybar/scripts/diskspace/usage

filename="usage"
fetchfrom=$(cat $filename | head -n 2 | tail -n 1)
finalfetch=$(echo "$fetchfrom" | sed 's/ //g')

# All the spaces value
totalspace=$(grep -o -P '(?<=Total:).*(?=Used:)' <<< $finalfetch)
usedspace=$(grep -o -P '(?<=Used:).*(?=Free:)' <<< $finalfetch)

if [ "$input" = "used_total" ] ;
then
    echo "$usedspace/$totalspace"
elif [ "$input" = "free" ] ;
then
    value=${finalfetch#*"Free:"}
    printf "%s" "$value [Free]"
elif [ "$input" = "used" ] ;
then
    echo "$usedspace [Used]"
elif [ "$input" = "all" ] ;
then
    echo "$fetchfrom"
else
    echo "error.check the passing parameter"
fi
