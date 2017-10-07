/*
 * This software was written by Maciej Węglarczyk and is licensed under MIT license.
 * https://github.com/FenixVoltres/QtIosAndroidAppSplit
 */

#ifndef IOSNATIVEUTILS_H
#define IOSNATIVEUTILS_H

class QString;

class IosNativeUtils
{
public:
    bool loadIosNativeRccResource(const QString& resourceName) const;
};

#endif // IOSNATIVEUTILS_H
