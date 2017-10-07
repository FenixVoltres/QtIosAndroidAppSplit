/*
 * This software was written by Maciej Węglarczyk and is licensed under MIT license.
 * https://github.com/FenixVoltres/QtIosAndroidAppSplit
 */

#ifndef BASENATIVEINTEGRATION_H
#define BASENATIVEINTEGRATION_H

#include <QObject>

#include "../devicescreeninfo.h"

class BaseNativeIntegration : public QObject
{
    Q_OBJECT

public:
    explicit BaseNativeIntegration(QObject* parent = nullptr);

    bool loadRccResources();

protected:
    virtual bool loadImageRccResources() const = 0;
    virtual QString rccResourcesPath() const = 0;

    bool loadRccResource(const QString& resourceName) const;

    QString mDeviceDensityString;
    QString mDeviceSizeString;

private:
    void updateDeviceDensityString(DeviceScreenInfo::DeviceDensityType densityType);
};

#endif // BASENATIVEINTEGRATION_H
