TEMPLATE = subdirs

SUBDIRS += \
    application \
    resources

# In order to disable resources target
# from appearing as run configuration
CONFIG += qtc_runnable

application.depends = resources # update on every build

OTHER_FILES += scripts/androidCopyRccResources.sh \
    scripts/createExternalResources.sh \
    scripts/iosCopyRccResources.sh
