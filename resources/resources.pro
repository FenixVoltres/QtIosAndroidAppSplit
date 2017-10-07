TEMPLATE = aux

QMAKE_CLEAN = $$OUT_PWD/generated/rcc/*

# create .rcc files
createExternalResources.commands = $$PWD/../scripts/createExternalResources.sh $$[QT_HOST_BINS] $$PWD $$OUT_PWD

android {
    # Android copy .rcc files into proper res/raw folders
    androidCopyRccResources.commands = $$PWD/../scripts/androidCopyRccResources.sh $$PWD $$OUT_PWD
    androidCopyRccResources.depends = createExternalResources

    first.depends = $(first) androidCopyRccResources createExternalResources
    QMAKE_EXTRA_TARGETS += first androidCopyRccResources createExternalResources

    QMAKE_CLEAN += \
        $$PWD/../application/deploy/android/source/largeLowDpi/res/raw-large-mdpi/*.rcc \
        $$PWD/../application/deploy/android/source/largeHighDpi/res/raw-large-xhdpi/*.rcc \
        $$PWD/../application/deploy/android/source/normalLowDpi/res/raw-normal-mdpi/*.rcc \
        $$PWD/../application/deploy/android/source/normalHighDpi/res/raw-normal-xhdpi/*.rcc \
        $$PWD/../application/deploy/android/source/xlargeLowDpi/res/raw-xlarge-mdpi/*.rcc \
        $$PWD/../application/deploy/android/source/xlargeHighDpi/res/raw-xlarge-xhdpi/*.rcc \
        $$PWD/../application/deploy/android/source/highDpi/res/raw-xhdpi/*.rcc \
        $$PWD/../application/deploy/android/source/lowDpi/res/raw-mdpi/*.rcc \
        $$PWD/../application/deploy/android/source/main/assets/rcc/*.rcc
}

ios {
    # iOS copy .rcc files into .xcassets bundle
    iosCopyRccResources.commands = $$PWD/../scripts/iosCopyRccResources.sh $$PWD $$OUT_PWD
    iosCopyRccResources.depends = createExternalResources

    first.depends = $(first) iosCopyRccResources createExternalResources
    QMAKE_EXTRA_TARGETS += first iosCopyRccResources createExternalResources

    QMAKE_CLEAN += \
        $$PWD/../application/deploy/ios/xcassets/QtImages.xcassets/rcc_images_per_1.dataset/*.rcc \
        $$PWD/../application/deploy/ios/xcassets/QtImages.xcassets/rcc_images_per_2.dataset/*.rcc
}
