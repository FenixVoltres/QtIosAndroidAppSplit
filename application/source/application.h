/*
 * This software was written by Maciej Węglarczyk and is licensed under MIT license.
 * https://github.com/FenixVoltres/QtIosAndroidAppSplit
 */

#ifndef APPLICATION_H
#define APPLICATION_H

#include <QGuiApplication>

class QQmlApplicationEngine;

class BaseNativeIntegration;

class Application : public QGuiApplication
{
public:
    explicit Application(int& argc, char** argv);
    ~Application();

private:
    void initDeviceScreenInfo() const;
    void showQml() const;

    QQmlApplicationEngine* mQmlApplicationEngine;
    BaseNativeIntegration* mNativeIntegration;
};

#endif // APPLICATION_H
