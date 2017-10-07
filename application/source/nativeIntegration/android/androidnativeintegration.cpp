/*
 * This software was written by Maciej Węglarczyk and is licensed under MIT license.
 * https://github.com/FenixVoltres/QtIosAndroidAppSplit
 */

#include <jni.h>

#include <QtAndroid>
#include <QResource>

#include "androidnativeintegration.h"

AndroidNativeIntegration::AndroidNativeIntegration(QObject* parent)
    : BaseNativeIntegration(parent)
{
}

// Protected methods

bool AndroidNativeIntegration::loadImageRccResources() const
{
    bool imagesOneLoaded = loadRccResource("images_one_x");
    bool imagesAnyLoaded = loadAndroidNativeRccResource("images_any");
    bool imagesPerLoaded = loadAndroidNativeRccResource("images_per");

    return (imagesOneLoaded && imagesAnyLoaded && imagesPerLoaded);
}

QString AndroidNativeIntegration::rccResourcesPath() const
{
    return "assets:/rcc";
}

// Private methods

bool AndroidNativeIntegration::loadAndroidNativeRccResource(const QString& resourceName) const
{
    QAndroidJniEnvironment environment;
    QAndroidJniObject byteArrayObject = QtAndroid::androidActivity().callObjectMethod("nativeCallLoadRccResource", "(Ljava/lang/String;)[B", QAndroidJniObject::fromString(resourceName.toLower()).object<jstring>());

    if (environment->ExceptionCheck())
    {
        environment->ExceptionClear();

        // TODO handle resources fail here

        return false;
    }
    else
    {
        jbyteArray byteArray = byteArrayObject.object<jbyteArray>();
        long length = environment->GetArrayLength(byteArray);
        if (length > 0)
        {
            uchar* buffer = new unsigned char[length];
            environment->GetByteArrayRegion(byteArray, 0, length, reinterpret_cast<jbyte*>(buffer));

            return QResource::registerResource(buffer);
        }
        else
        {
            // TODO handle resources fail here

            return false;
        }
    }
}
