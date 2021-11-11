ifeq ($(USE_DYNAMIC_REFRESH_RATE), true)
# Overlays
PRODUCT_PACKAGES += \
    RefreshRate

# Refresh Rate Dynamic Props
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.set_idle_timer_ms=80 \
    ro.surface_flinger.set_touch_timer_ms=200 \
    ro.surface_flinger.set_display_power_timer_ms=1000 \
    ro.surface_flinger.use_content_detection_for_refresh_rate=true

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.defer_fps_frame_count=4 \
    vendor.display.idle_time=0 \
    vendor.display.idle_time_inactive=0 \
    vendor.display.disable_metadata_dynamic_fps=1
else
# Overlays
PRODUCT_PACKAGES += \
    SmoothDisplay

# Init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.refresrate.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.refreshrate.rc

# Refresh Rate Props
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.set_idle_timer_ms=80 \
    ro.surface_flinger.set_touch_timer_ms=200 \
    ro.surface_flinger.set_display_power_timer_ms=1000 \
    ro.surface_flinger.use_content_detection_for_refresh_rate=true \
    ro.surface_flinger.support_kernel_idle_timer=true

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.defer_fps_frame_count=2 \
    vendor.display.idle_time=1100
endif
