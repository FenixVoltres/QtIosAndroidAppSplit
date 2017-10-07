/*
 * This software was written by Maciej Węglarczyk and is licensed under MIT license.
 * https://github.com/FenixVoltres/QtIosAndroidAppSplit
 */

#include <QCoreApplication>

#include "iosnativeintegration.h"

IosNativeIntegration::IosNativeIntegration(QObject* parent)
    : BaseNativeIntegration(parent)
{
}

// Protected methods

bool IosNativeIntegration::loadImageRccResources() const
{
    bool imagesOneLoaded = loadRccResource("images_one_x");
    bool imagesAnyLoaded = loadRccResource("images_any_" + mDeviceDensityString);

    bool imagesPerLoaded = mNativeUtils.loadIosNativeRccResource("images_per_" + mDeviceDensityString);

    return (imagesOneLoaded && imagesAnyLoaded && imagesPerLoaded);
}

QString IosNativeIntegration::rccResourcesPath() const
{
    return qApp->applicationDirPath();
}
