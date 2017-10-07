/*
 * This software was written by Maciej Węglarczyk and is licensed under MIT license.
 * https://github.com/FenixVoltres/QtIosAndroidAppSplit
 */

#include <QQmlApplicationEngine>
#include <QQmlFileSelector>
#include <QScreen>

#include "nativeIntegration/nativeintegrationfactory.h"
#include "devicescreeninfo.h"
#include "application.h"

Application::Application(int& argc, char** argv)
    : QGuiApplication(argc, argv)
    , mQmlApplicationEngine(nullptr)
    , mNativeIntegration(nullptr)
{
    initDeviceScreenInfo(); // Check if it's phone, table7, or tablet10 device

    mNativeIntegration = NativeIntegrationFactory::createNativeIntegration(this);

    if (mNativeIntegration->loadRccResources())
    {
        mQmlApplicationEngine = new QQmlApplicationEngine();

        showQml();
    }
}

Application::~Application()
{
    if (mNativeIntegration != nullptr)
    {
        delete mNativeIntegration;
    }

    if (mQmlApplicationEngine != nullptr)
    {
        delete mQmlApplicationEngine;
    }
}

// Private methods

void Application::initDeviceScreenInfo() const
{
    QRect screenGeometry = primaryScreen()->geometry();
    DeviceScreenInfo::updateScreenVirtualResolution(screenGeometry.width(), screenGeometry.height(), primaryScreen()->devicePixelRatio());
}

void Application::showQml() const
{
    QString deviceSize = DeviceScreenInfo::sizeTypeString(DeviceScreenInfo::currentSizeType());

    // Set file selector so proper images for that type
    // of device (phone, tablet7, tablet10) will be loaded
    QQmlFileSelector* qmlFileSelector = new QQmlFileSelector(mQmlApplicationEngine);
    qmlFileSelector->setExtraSelectors(QStringList(deviceSize));

    mQmlApplicationEngine->load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
}
