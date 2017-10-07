/*
 * This software was written by Maciej Węglarczyk and is licensed under MIT license.
 * https://github.com/FenixVoltres/QtIosAndroidAppSplit
 */

#ifndef DEVICESIZESELECTOR_H
#define DEVICESIZESELECTOR_H

#include <QString>

#define UNSUPPORTED ("unsupported")
#define TABLET_10 ("tablet10")
#define TABLET_7 ("tablet7")
#define PHONE ("phone")

class DeviceScreenInfo
{
public:
    // Contains only sizes supported by us
    enum DeviceSizeType
    {
        DeviceSizeTypeUndefined = 0,
        DeviceSizeTypePhone,
        DeviceSizeTypeTablet7,
        DeviceSizeTypeTablet10
    };

    // Contains only densities supported by us
    enum DeviceDensityType
    {
        DeviceDensityTypeUndefined = 0,
        DeviceDensityTypeMdpi, // x1
        DeviceDensityTypeXhdpi // x2
    };

    static void updateScreenVirtualResolution(int virtualWidth, int virtualHeight, double pixelRatio);
    static QString sizeTypeString(DeviceSizeType deviceSizeType);
    static DeviceDensityType currentDensityType();
    static DeviceSizeType currentSizeType();
};

#endif // DEVICESIZESELECTOR_H
