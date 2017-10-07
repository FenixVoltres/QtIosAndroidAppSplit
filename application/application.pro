# Common

DEFINES += QT_DEPRECATED_WARNINGS QT_DISABLE_DEPRECATED_BEFORE=0x060000
CONFIG += c++11 qtc_runnable
TARGET = Application
QT += quick

SOURCES += source/main.cpp \
    source/application.cpp \
    source/nativeIntegration/basenativeintegration.cpp \
    source/nativeIntegration/nativeintegrationfactory.cpp \
    source/devicescreeninfo.cpp

HEADERS += \
    source/application.h \
    source/nativeIntegration/basenativeintegration.h \
    source/nativeIntegration/nativeintegrationfactory.h \
    source/devicescreeninfo.h

# Hack for Qt Creator to display these files in project structure
# They are compiled by resources.pro subproject, should not be in
# RESOURCES variable
fake:RESOURCES += assets/qml/_qml.qrc \
    assets/images/anySize/_images_x1.qrc \
    assets/images/anySize/_images_x2.qrc \
    assets/images/oneSize/_images_xx.qrc \
    assets/images/perSize/_images_x1.qrc \
    assets/images/perSize/_images_x2.qrc \
    assets/images/perSize/+tablet7/_images_x1.qrc \
    assets/images/perSize/+tablet7/_images_x2.qrc \
    assets/images/perSize/+tablet10/_images_x1.qrc \
    assets/images/perSize/+tablet10/_images_x2.qrc

# Android
android {
    DEFINES += PLATFORM_ANDROID
    QT += androidextras

    SOURCES += source/nativeIntegration/android/androidnativeintegration.cpp

    HEADERS += source/nativeIntegration/android/androidnativeintegration.h

    DISTFILES += \
        deploy/android/AndroidManifest.xml \
        deploy/android/gradle/wrapper/gradle-wrapper.jar \
        deploy/android/gradlew \
        deploy/android/res/values/libs.xml \
        deploy/android/build.gradle \
        deploy/android/gradle/wrapper/gradle-wrapper.properties \
        deploy/android/gradlew.bat \
        deploy/android/source/largeHighDpi/AndroidManifest.xml \  # Watch out! Opening those AndroidManifests
        deploy/android/source/largeLowDpi/AndroidManifest.xml \   # in Qt Creator will result with unwanted
        deploy/android/source/normalHighDpi/AndroidManifest.xml \ # modifications, as Qt Creator expects only one
        deploy/android/source/normalLowDpi/AndroidManifest.xml \  # manifest with different structure. Check in git!
        deploy/android/source/xlargeHighDpi/AndroidManifest.xml \
        deploy/android/source/xlargeLowDpi/AndroidManifest.xml \
        deploy/android/source/main/java/io/qt/example/splitapplication/AndroidQtActivity.java

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/deploy/android
}

# iOS
ios {
    DEFINES += PLATFORM_IOS

    QMAKE_IOS_DEPLOYMENT_TARGET = 9.0 # Needed for App Thinning to work

    # iOS native bundle identifier
    Q_PRODUCT_BUNDLE_IDENTIFIER.name = PRODUCT_BUNDLE_IDENTIFIER
    Q_PRODUCT_BUNDLE_IDENTIFIER.value = io.qt.example.splitapplication
    QMAKE_MAC_XCODE_SETTINGS += Q_PRODUCT_BUNDLE_IDENTIFIER

    SOURCES += source/nativeIntegration/ios/iosnativeintegration.cpp \
        source/nativeIntegration/ios/native/IosNativeUtils.mm

    HEADERS += source/nativeIntegration/ios/iosnativeintegration.h \
        source/nativeIntegration/ios/native/IosNativeUtils.h

    # Qt .rcc binary resources
    externalResourcesBundle.files = $$OUT_PWD/../resources/generated/rcc/qml.rcc \
        $$OUT_PWD/../resources/generated/rcc/images_any_1.rcc \
        $$OUT_PWD/../resources/generated/rcc/images_any_2.rcc \
        $$OUT_PWD/../resources/generated/rcc/images_one_x.rcc
    QMAKE_BUNDLE_DATA += externalResourcesBundle

    # iOS native .xcassets
    QMAKE_ASSET_CATALOGS += $$PWD/deploy/ios/xcassets/QtImages.xcassets

    OTHER_FILES += $$PWD/deploy/ios/Info.plist

    QMAKE_INFO_PLIST = $$PWD/deploy/ios/Info.plist
}
