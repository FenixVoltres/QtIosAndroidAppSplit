#!/bin/sh -e

GENERATED_FILES_PATH=$2/generated/rcc
APPLICATION_PROJECT_PATH=$1/../application

echo [iOS] COPYING EXTERNAL RCC RESOURCES...

function mkdir_cp() {
    mkdir -p $2 && cp $1 $2$3
}

# first clear all previous generated .rcc files
find $APPLICATION_PROJECT_PATH/deploy/ios -type f -name "*.rcc" -exec rm {} \;

# Images
# There's no per_1_phone, as non-retina iPhones are not supported anymore
mkdir_cp $GENERATED_FILES_PATH/images_per_1_tablet10.rcc    $APPLICATION_PROJECT_PATH/deploy/ios/xcassets/QtImages.xcassets/rcc_images_per_1.dataset/ images_per_1_tablet10.rcc
mkdir_cp $GENERATED_FILES_PATH/images_per_2_phone.rcc       $APPLICATION_PROJECT_PATH/deploy/ios/xcassets/QtImages.xcassets/rcc_images_per_2.dataset/ images_per_2_phone.rcc
mkdir_cp $GENERATED_FILES_PATH/images_per_2_tablet10.rcc    $APPLICATION_PROJECT_PATH/deploy/ios/xcassets/QtImages.xcassets/rcc_images_per_2.dataset/ images_per_2_tablet10.rcc

echo [iOS] DONE COPYING EXTERNAL RCC RESOURCES.
