/*
 * This software was written by Maciej Węglarczyk and is licensed under MIT license.
 * https://github.com/FenixVoltres/QtIosAndroidAppSplit
 */

#include "devicescreeninfo.h"

// These definitions come from Android,
// but iOS devices match with them also.
// See https://developer.android.com/guide/practices/screens_support.html
#define XLARGE_MINIMUM_HEIGHT 720
#define NORMAL_MINIMUM_HEIGHT 320
#define XLARGE_MINIMUM_WIDTH 960
#define NORMAL_MINIMUM_WIDTH 470
#define LARGE_MINIMUM_HEIGHT 480
#define LARGE_MINIMUM_WIDTH 640

static DeviceScreenInfo::DeviceDensityType sCurrentDeviceDensityType = DeviceScreenInfo::DeviceDensityTypeUndefined;
static DeviceScreenInfo::DeviceSizeType sCurrentDeviceSizeType = DeviceScreenInfo::DeviceSizeTypeUndefined;

// Static public methods

void DeviceScreenInfo::updateScreenVirtualResolution(int virtualWidth, int virtualHeight, double pixelRatio)
{
    // Size

    if (virtualWidth >= XLARGE_MINIMUM_WIDTH && virtualHeight >= XLARGE_MINIMUM_HEIGHT)
    {
        sCurrentDeviceSizeType = DeviceSizeTypeTablet10;
    }
    else if (virtualWidth >= LARGE_MINIMUM_WIDTH && virtualHeight >= LARGE_MINIMUM_HEIGHT)
    {
        sCurrentDeviceSizeType = DeviceSizeTypeTablet7;
    }
    else if (virtualWidth >= NORMAL_MINIMUM_WIDTH && virtualHeight >= NORMAL_MINIMUM_HEIGHT)
    {
        sCurrentDeviceSizeType = DeviceSizeTypePhone;
    }
    else
    {
        sCurrentDeviceSizeType = DeviceSizeTypeUndefined;
    }

    // Density

    // Of course one may support more device density types than 2; Qt limits them
    // to be int-based, as image named i.e. "image@1.5x.png" won't be recognized.
    // sCurrentDeviceDensityType will be used to load proper image binary .rcc asset
    if (pixelRatio < 1.5)
    {
        sCurrentDeviceDensityType = DeviceDensityTypeMdpi;
    }
    else
    {
        sCurrentDeviceDensityType = DeviceDensityTypeXhdpi;
    }
}

QString DeviceScreenInfo::sizeTypeString(DeviceScreenInfo::DeviceSizeType deviceSizeType)
{
    switch (deviceSizeType)
    {
        case DeviceSizeTypeTablet10: return TABLET_10;
        case DeviceSizeTypeTablet7: return TABLET_7;
        case DeviceSizeTypePhone: return PHONE;
        default: return UNSUPPORTED;
    }
}

DeviceScreenInfo::DeviceDensityType DeviceScreenInfo::currentDensityType()
{
    return sCurrentDeviceDensityType;
}

DeviceScreenInfo::DeviceSizeType DeviceScreenInfo::currentSizeType()
{
    return sCurrentDeviceSizeType;
}
