/*
 * This software was written by Maciej Węglarczyk and is licensed under MIT license.
 * https://github.com/FenixVoltres/QtIosAndroidAppSplit
 */

#ifndef ANDROIDNATIVEINTEGRATION_H
#define ANDROIDNATIVEINTEGRATION_H

#include <QAndroidJniEnvironment>
#include <QAndroidJniObject>

#include "../basenativeintegration.h"

class AndroidNativeIntegration : public BaseNativeIntegration
{
    Q_OBJECT

public:
    explicit AndroidNativeIntegration(QObject* parent = nullptr);

protected:
    virtual bool loadImageRccResources() const override;
    virtual QString rccResourcesPath() const override;

private:
    bool loadAndroidNativeRccResource(const QString& resourceName) const;
};

#endif // ANDROIDNATIVEINTEGRATION_H
