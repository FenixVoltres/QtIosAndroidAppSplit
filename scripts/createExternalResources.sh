#!/bin/sh -e

GENERATED_FILES_PATH=$3/generated/rcc
APPLICATION_PROJECT_PATH=$2/../application
RCC_FULL_PATH=$1/rcc

mkdir -p $GENERATED_FILES_PATH

echo UPDATING EXTERNAL RESOURCES...

# Here you can have also fonts, translations, souds...
$RCC_FULL_PATH -binary              $APPLICATION_PROJECT_PATH/assets/qml/_qml.qrc                               -o $GENERATED_FILES_PATH/qml.rcc

# Images
$RCC_FULL_PATH -binary -no-compress $APPLICATION_PROJECT_PATH/assets/images/oneSize/_images_xx.qrc              -o $GENERATED_FILES_PATH/images_one_x.rcc
$RCC_FULL_PATH -binary -no-compress $APPLICATION_PROJECT_PATH/assets/images/anySize/_images_x1.qrc              -o $GENERATED_FILES_PATH/images_any_1.rcc
$RCC_FULL_PATH -binary -no-compress $APPLICATION_PROJECT_PATH/assets/images/anySize/_images_x2.qrc              -o $GENERATED_FILES_PATH/images_any_2.rcc
$RCC_FULL_PATH -binary -no-compress $APPLICATION_PROJECT_PATH/assets/images/perSize/+tablet10/_images_x1.qrc    -o $GENERATED_FILES_PATH/images_per_1_tablet10.rcc
$RCC_FULL_PATH -binary -no-compress $APPLICATION_PROJECT_PATH/assets/images/perSize/+tablet7/_images_x1.qrc     -o $GENERATED_FILES_PATH/images_per_1_tablet7.rcc
$RCC_FULL_PATH -binary -no-compress $APPLICATION_PROJECT_PATH/assets/images/perSize/_images_x1.qrc              -o $GENERATED_FILES_PATH/images_per_1_phone.rcc
$RCC_FULL_PATH -binary -no-compress $APPLICATION_PROJECT_PATH/assets/images/perSize/+tablet10/_images_x2.qrc    -o $GENERATED_FILES_PATH/images_per_2_tablet10.rcc
$RCC_FULL_PATH -binary -no-compress $APPLICATION_PROJECT_PATH/assets/images/perSize/+tablet7/_images_x2.qrc     -o $GENERATED_FILES_PATH/images_per_2_tablet7.rcc
$RCC_FULL_PATH -binary -no-compress $APPLICATION_PROJECT_PATH/assets/images/perSize/_images_x2.qrc              -o $GENERATED_FILES_PATH/images_per_2_phone.rcc

echo DONE UPDATING EXTERNAL RESOURCES.
