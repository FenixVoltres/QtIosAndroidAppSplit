/*
 * This software was written by Maciej Węglarczyk and is licensed under MIT license.
 * https://github.com/FenixVoltres/QtIosAndroidAppSplit
 */

#ifndef NATIVEINTEGRATIONFACTORY_H
#define NATIVEINTEGRATIONFACTORY_H

#include "basenativeintegration.h"

class NativeIntegrationFactory
{
public:
    static BaseNativeIntegration* createNativeIntegration(QObject* parent = nullptr);
};

#endif // NATIVEINTEGRATIONFACTORY_H
