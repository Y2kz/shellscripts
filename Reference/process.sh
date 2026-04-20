ps -u $USER -o pid,%mem,%cpu,comm | sort -b -k2 -g
