#!/bin/bash
# script created by Taylor Kline
# Taylor.Kline@streamingfreebies.com
cmn5directory=~/Desktop/android/cm13
echo 'Updating the Nexus 5 CM11 repository located at:' $cmn5directory
cd $cmn5directory
echo 'Beginning by syncing the directory.'
# repo sync
echo 'Nexus 5 CM11 repository updated!'
echo "Updating breakfast for hammerhead."
source build/envsetup.sh
breakfast hammerhead
echo "Updating proprietary blobs for hammerhead."
cd $cmn5directory/../proprietary_vendor_lge/
git pull
cp -r ./hammerhead/proprietary $cmn5directory/../system
echo "Adding the updated blobs to repo."
cd $cmn5directory/device/lge/hammerhead
./extract-files.sh $cmn5directory/../system
rm -rf $cmn5directory/../system
echo "Update completed, visit" $cmn5directory "for your updated files."
echo "Don't forget to execute 'source build/envsetup.sh' to be able to run brunch hammerhead."
