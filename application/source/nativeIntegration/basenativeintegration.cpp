/*
 * This software was written by Maciej Węglarczyk and is licensed under MIT license.
 * https://github.com/FenixVoltres/QtIosAndroidAppSplit
 */

#include <QResource>
#include <QDebug>

#include "basenativeintegration.h"

BaseNativeIntegration::BaseNativeIntegration(QObject* parent)
    : QObject(parent)
{
    mDeviceSizeString = DeviceScreenInfo::sizeTypeString(DeviceScreenInfo::currentSizeType());

    updateDeviceDensityString(DeviceScreenInfo::currentDensityType());
}

// Public methods

bool BaseNativeIntegration::loadRccResources()
{
    bool imagesLoaded = loadImageRccResources();
    bool qmlLoaded = loadRccResource("qml");

    // Any other .rcc should be loaded here also, like translations, sounds, fonts...

    return (imagesLoaded && qmlLoaded);
}

// Protected methods

bool BaseNativeIntegration::loadRccResource(const QString& resourceName) const
{
    QString fullResourcePath = rccResourcesPath() + "/" + resourceName + ".rcc";
    bool loaded = QResource::registerResource(fullResourcePath);
    if (!loaded)
    {
        qDebug() << "[Resources]: fail to load" << resourceName;

        // TODO handle resources fail here
    }

    return loaded;
}

// Private methods

void BaseNativeIntegration::updateDeviceDensityString(DeviceScreenInfo::DeviceDensityType densityType)
{
    // mDeviceDensityString will be used to load proper binary image .rcc resource

    switch (densityType)
    {
        case DeviceScreenInfo::DeviceDensityTypeMdpi: mDeviceDensityString = "1"; break;
        case DeviceScreenInfo::DeviceDensityTypeXhdpi: mDeviceDensityString = "2"; break;
        default: mDeviceDensityString = ""; break;
    }
}
