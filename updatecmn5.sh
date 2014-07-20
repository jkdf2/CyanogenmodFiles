#!/bin/bash
#script created by Taylor Kline
#Taylor.Kline@streamingfreebies.com
cmn5directory=/media/development/n5cm11
rootdirectory=/media/development
echo 'Updating the Nexus 5 CM11 repository located at:' $cmn5directory
cd $cmn5directory
echo 'Beginning by updating the repo command.'
repo selfupdate
echo 'Repo command updated.'
repo sync
echo 'Nexus 5 CM11 repository updated!'
echo "Updating breakfast for hammerhead."
source build/envsetup.sh
breakfast hammerhead
echo "Updating proprietary blobs for hammerhead."
cd ../lge_proprietary/
git pull
cp -r ./hammerhead/proprietary $rootdirectory/system
cd $cmn5directory/device/lge/hammerhead/
echo "Adding the updated blobs to repo."
./extract-files.sh $rootdirectory
croot
rm -rf $rootdirectory/system
rm $cmn5directory/vendor/lge/hammerhead/proprietary/Android.mk
echo "Update completed, visit" $cmn5directory "for your updated files."
echo "Don't forget to execute 'source build/envsetup.sh' to be able to run brunch hammerhead."
