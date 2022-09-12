export MODPATH="/data/adb/modules/ezme-nodebug"

# Remove LineageOS props
# This should only confuse the OTA updater
resetprop --delete ro.lineage.build.version
resetprop --delete ro.lineage.build.version.plat.rev
resetprop --delete ro.lineage.build.version.plat.sdk
resetprop --delete ro.lineage.device
resetprop --delete ro.lineage.display.version
resetprop --delete ro.lineage.releasetype
resetprop --delete ro.lineage.version
resetprop --delete ro.lineagelegal.url

# Create a personalized system.prop
getprop | grep "userdebug" >> "$MODPATH/tmp.prop"
getprop | grep "test-keys" >> "$MODPATH/tmp.prop"
getprop | grep "lineage_"  >> "$MODPATH/tmp.prop"

sed -i 's/\[//g'  "$MODPATH/tmp.prop"
sed -i 's/\]//g'  "$MODPATH/tmp.prop"
sed -i 's/: /=/g' "$MODPATH/tmp.prop"

sed -i 's/userdebug/user/g' "$MODPATH/tmp.prop"
sed -i 's/test-keys/release-keys/g' "$MODPATH/tmp.prop"
sed -i 's/lineage_//g' "$MODPATH/tmp.prop"

sort -u "$MODPATH/tmp.prop" > "$MODPATH/system.prop"
rm "$MODPATH/tmp.prop"

# Make sure we set those props
sleep 30
resetprop -n --file "$MODPATH/system.prop"
