#! /bin/bash

echo '
      Exercise 9, on "Getting started with Linux OS-GEOLive"'
echo -en '\n'
echo -e '\033[1m                         AD-Scripting team\033[0m'
echo -e '\033[1m                David Scholte-Albers & Astrid Bos\033[0m'
echo -en '\n'


## to download and unzip files
echo -e '\033[1mDownloading Landsat data and putting it in the "/data" folder\033[0m'
cd data
wget https://github.com/GeoScripting-WUR/IntroToRaster/raw/gh-pages/data/gewata.zip
echo -e '\033[1mDownload completed\033[0m'
chmod a+x gewata.zip #allow writing rights
ls -l
unzip gewata.zip
echo -e '\033[1mData is now unpacked and original zip file has been removed\033[0m'
rm gewata.zip

## to create and calculate NDVI file
echo -e '\033[1m...Create and calculate NDVI file\033[0m'
cp LE71700552001036SGS00_SR_Gewata_INT1U.tif input.tif
gdal_calc.py -A input.tif --A_band=4 -B input.tif --B_band=3  --outfile=ndvi.tif  --calc="(A.astype(float)-B)/(A.astype(float)+B)" --type='Float32' --co="COMPRESS=LZW"
echo -e '\033[1m...remove the input temporary file, PLEASE CONFIRM WITH "Y"\033[0m'
rm input.tif

## resampels the NDVI tif file to pixels of 60 m

## reprojects this resampled file to Lat/long WGS84 (the projection code is: EPSG:4326)
      ##solution!!!: gdalwarp -t_srs EPSG:4326 $fntemp $fnout
      
## Optional: - convert the .tif file (i.e. a geotif) to .png
