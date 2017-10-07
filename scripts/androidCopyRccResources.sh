#!/bin/sh -e

GENERATED_FILES_PATH=$2/generated/rcc
APPLICATION_PROJECT_PATH=$1/../application

echo [Android] COPYING EXTERNAL RCC RESOURCES...

function mkdir_cp() {
    mkdir -p $2 && cp $1 $2$3
}

# first clear all previous generated .rcc files
find $APPLICATION_PROJECT_PATH/deploy/android -type f -name "*.rcc" -exec rm {} \;

# Assets
mkdir_cp $GENERATED_FILES_PATH/qml.rcc                      $APPLICATION_PROJECT_PATH/deploy/android/source/main/assets/rcc/                    qml.rcc

# Images
mkdir_cp $GENERATED_FILES_PATH/images_one_x.rcc             $APPLICATION_PROJECT_PATH/deploy/android/source/main/assets/rcc/                    images_one_x.rcc
mkdir_cp $GENERATED_FILES_PATH/images_any_1.rcc             $APPLICATION_PROJECT_PATH/deploy/android/source/lowDpi/res/raw-mdpi/                images_any.rcc
mkdir_cp $GENERATED_FILES_PATH/images_any_2.rcc             $APPLICATION_PROJECT_PATH/deploy/android/source/highDpi/res/raw-xhdpi/              images_any.rcc
mkdir_cp $GENERATED_FILES_PATH/images_per_1_tablet10.rcc    $APPLICATION_PROJECT_PATH/deploy/android/source/xlargeLowDpi/res/raw-xlarge-mdpi/   images_per.rcc
mkdir_cp $GENERATED_FILES_PATH/images_per_1_tablet7.rcc     $APPLICATION_PROJECT_PATH/deploy/android/source/largeLowDpi/res/raw-large-mdpi/     images_per.rcc
mkdir_cp $GENERATED_FILES_PATH/images_per_1_phone.rcc       $APPLICATION_PROJECT_PATH/deploy/android/source/normalLowDpi/res/raw-normal-mdpi/   images_per.rcc
mkdir_cp $GENERATED_FILES_PATH/images_per_2_tablet10.rcc    $APPLICATION_PROJECT_PATH/deploy/android/source/xlargeHighDpi/res/raw-xlarge-xhdpi/ images_per.rcc
mkdir_cp $GENERATED_FILES_PATH/images_per_2_tablet7.rcc     $APPLICATION_PROJECT_PATH/deploy/android/source/largeHighDpi/res/raw-large-xhdpi/   images_per.rcc
mkdir_cp $GENERATED_FILES_PATH/images_per_2_phone.rcc       $APPLICATION_PROJECT_PATH/deploy/android/source/normalHighDpi/res/raw-normal-xhdpi/ images_per.rcc

echo [Android] DONE COPYING EXTERNAL RCC RESOURCES.
