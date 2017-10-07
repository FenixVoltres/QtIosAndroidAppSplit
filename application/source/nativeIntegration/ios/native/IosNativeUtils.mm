/*
 * This software was written by Maciej Węglarczyk and is licensed under MIT license.
 * https://github.com/FenixVoltres/QtIosAndroidAppSplit
 */

#import <UIKit/UIKit.h>

#import "IosNativeUtils.h"

#include <QResource>
#include <QDebug>

// Public methods

bool IosNativeUtils::loadIosNativeRccResource(const QString& resourceName) const
{
    NSDataAsset* resourceDataAsset = [[[NSDataAsset alloc] initWithName:QString("rcc_" + resourceName).toNSString()] autorelease];
    NSData* data = resourceDataAsset.data;

    if (data != nil && data.length > 0)
    {
        uchar* rawData = new uchar[data.length];
        memcpy(rawData, [data bytes], data.length);

        bool loaded = QResource::registerResource(rawData);
        if (!loaded)
        {
            qDebug() << "[iOS Resources]: fail to load" << resourceName;
            delete[] rawData;
        }

        return loaded;
    }

    return false;
}
