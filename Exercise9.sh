#! /bin/bash

echo '
      Exercise 9, on "Getting started with Linux OS-GEOLive"'
echo -en '\n'
echo -e '\033[1m                         AD-Scripting team\033[0m'
echo -e '\033[1m                David Scholte-Albers & Astrid Bos\033[0m'
echo -en '\n'

echo -e '\033[1mDownloading Landsat data and putting it in the "/data" folder\033[0m'
cd data
wget https://github.com/GeoScripting-WUR/IntroToRaster/raw/gh-pages/data/gewata.zip
echo -e '\033[1mDownload completed\033[0m'
chmod a+x gewata.zip #allow writing rights
ls -l
unzip gewata.zip
echo -e '\033[1mData is now unpacked and original zip file has been removed\033[0m'
rm gewata.zip