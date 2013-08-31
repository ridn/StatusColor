include theos/makefiles/common.mk

BUNDLE_NAME = statuscolorPrefs
statuscolorPrefs_FILES = statuscolorPrefs.x
statuscolorPrefs_INSTALL_PATH = /Library/PreferenceBundles
statuscolorPrefs_FRAMEWORKS = UIKit
statuscolorPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/statuscolorPrefs.plist$(ECHO_END)
