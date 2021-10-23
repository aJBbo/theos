_THEOS_INTERNAL_CFLAGS += -DSIDELOAD -F.
# Use libc++ by default - for libstdc++ use TWEAK_NAME_LDFLAGS = -stdlib=libstdc++
_THEOS_INTERNAL_LDFLAGS += -F. -L. -stdlib=libc++

_THEOS_INTERNAL_LDFLAGS += $(patsubst %.framework,-framework %,$(notdir $(EMBED_FRAMEWORKS)))
_THEOS_INTERNAL_LDFLAGS += $(patsubst lib%.dylib,-l%,$(notdir $(EMBED_LIBRARIES)))

ifeq ($(call __theos_bool,$($(THEOS_CURRENT_INSTANCE)_USE_FISHHOOK)),$(_THEOS_TRUE))
__ALL_FILES += $(THEOS_JAILED_LIB)/fishhook/fishhook.c
_THEOS_INTERNAL_CFLAGS += -I$(THEOS_JAILED_LIB)/fishhook
endif

ifeq ($(_THEOS_PACKAGE_FORMAT),exo)
_THEOS_TARGET_LOGOS_DEFAULT_GENERATOR := internal
endif
