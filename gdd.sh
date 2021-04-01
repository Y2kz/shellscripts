#!/bin/bash
nano links.txt
mkdir files-dnld

#tr -s ", " "\n"
awk '{gsub(/, /,"\n")}1' links.txt >links2.txt
##REMOVE COMA ADD NEW LINE FOR ALL LINKS

sed -r 's/.{32}/wget --no-check-certificate _replacethis/' links2.txt > links3.txt 
#REPLACE FIRST 32 CHAR with wget....................

sed -r 's/.{17}$/_changethis/' links3.txt > links4.txt
#REPLACE LAST 17 CHAR AND REPLACE TO "changethis"

awk '{gsub(/_changethis/,"\47")}1' links4.txt > links5.txt

awk '{gsub(/_replacethis/,"\47docs.google.com/uc?export=download*id=")}1' links5.txt > links6.txt


cat links6.txt | tr -s "*" "&" >download-links.sh

chmod +x download-links.sh

rm links.txt links2.txt links3.txt links4.txt links5.txt links6.txt 
mv download-links.sh files-dnld
cd files-dnld
./download-links.sh
rm download-links.sh

#####################################################################
######NOTE#######
##THIS SCRIPT BREAK WHEN DOWNLOADING ZIP,TAR ETC (ARCHIVE TYPES)
##GOOGLE RESTRICTS API CALLS WHEN THE FILES EXCEED ABOUT 30 ITEMS
##SO USE THE SCRIPT USING A DELAY
##I AM TRYING TO GET THE PERFECT DELAY 
######################################################################
