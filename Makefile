GO_EASY_ON_ME=1

include theos/makefiles/common.mk

TWEAK_NAME = StatusColor
StatusColor_FILES = Tweak.xm
StatusColor_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += statuscolorprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
