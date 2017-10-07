# QtIosAndroidAppSplit
An example of taking advantage of Apple Slicing and Android gradle splits in Qt project.
Please note - it is rather advanced stuff, so use and/or modify it at your own risk.

## What I need to use it?

Resources which are targeted for particular devices - i.e. different version of images for phones / tablets 7" / tablet 10", different densities...

## What I need to do?

Just compile and run it. If you want to customize it:

### iOS

1. Make sure all images use proper @nx suffixes (i.e. image@2x.png);
2. Make sure all assets for particular device type are in the same .qrc file (i.e. phone_x2.qrc);
3. Remove these .qrc files from RESOURCE variable in any .pro file and compile it using rcc tool;
4. Create .xcasset in Xcode, add Data Set entity, set split for iPhones / iPads / etc. and copy .rcc files there;
5. Load in from Obj-C++ in runtime;
6. That's it! Archive and upload to AppStore, it will slice it into many app variants, each device will get only resources meant for it.

### Android

(First 3 steps are identical to iOS ones)

1. Make sure all images use proper @nx suffixes (i.e. image@2x.png);
2. Make sure all assets for particular device are in the same .qrc file (i.e. phone_x2.qrc);
3. Remove .qrc files from RESOURCE variable in any .pro file and compile it using rcc tool;
4. Create Product Flavors in build.gradle with custom resource folders and copy .rcc files there;
5. Load in from Java/JNI in runtime;
6. Update filters in AndroidManifest for each Product Flavor to math containing resource types;
7. Change signing data in build.gradle (app variant need to be signed from there, as Qt Creator cannot sign more than one .apk during build);
8. Upload all resulting .apk to Google; if filters were set correctly, each device will get proper variant.

Enjoy!
