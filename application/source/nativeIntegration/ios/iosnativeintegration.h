/*
 * This software was written by Maciej Węglarczyk and is licensed under MIT license.
 * https://github.com/FenixVoltres/QtIosAndroidAppSplit
 */

#ifndef IOSNATIVEINTEGRATION_H
#define IOSNATIVEINTEGRATION_H

#include "../basenativeintegration.h"
#include "native/IosNativeUtils.h"

class IosNativeIntegration : public BaseNativeIntegration
{
    Q_OBJECT

public:
    explicit IosNativeIntegration(QObject* parent = nullptr);

protected:
    virtual bool loadImageRccResources() const override;
    virtual QString rccResourcesPath() const override;

private:
    IosNativeUtils mNativeUtils;
};

#endif // IOSNATIVEINTEGRATION_H
