/*
 * This software was written by Maciej Węglarczyk and is licensed under MIT license.
 * https://github.com/FenixVoltres/QtIosAndroidAppSplit
 */

#include "nativeintegrationfactory.h"

#ifdef PLATFORM_ANDROID
#   include "android/androidnativeintegration.h"
#elif PLATFORM_IOS
#   include "ios/iosnativeintegration.h"
#endif

// Static public methods

BaseNativeIntegration* NativeIntegrationFactory::createNativeIntegration(QObject* parent)
{
    BaseNativeIntegration* nativeIntegration = nullptr;

#ifdef PLATFORM_ANDROID
    nativeIntegration = new AndroidNativeIntegration(parent);
#elif PLATFORM_IOS
    nativeIntegration = new IosNativeIntegration(parent);
#endif

    // Other integrations (i.e. desktop) should be added here

    return nativeIntegration;
}
