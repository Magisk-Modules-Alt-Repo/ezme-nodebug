# Hide UserDebug, Test-Keys and LineageOS

Change some props and "remove" LineageOS ones.

## Description

Some Custom ROMs (like [LineageOS](https://lineageos.org/)) build their systems as <code>userdebug</code> which allows for [easier debugging and ADB usage](https://source.android.com/docs/setup/develop/new-device#build-variants).

However, if you want to pass SafetyNet or any alternative, that can be a pain, due to Certified ROMs using <code>user</code> builds.

Also, some developers may use <code>test-keys</code> to sign their builds as opposed to <code>release-keys</code>, which is more of a [security concern](https://source.android.com/docs/core/ota/sign_builds) than anything. (Anyone can use the default <code>test-keys</code> to sign stuff, with the system just accepting those).

So, this module dynamically gets system props from the device and patches them to change <code>userdebug</code> to <code>user</code> and <code>test-keys</code> to <code>release-keys</code>.

Additionally, this module removes all LineageOS specific props, to prevent apps from identifying it by using them. This has a known issue; [Over-the-Air updates](https://source.android.com/docs/core/ota) don't work, which in my opinion is a small price to pay (and you can always just disable the module before tyring to update).

The module is confirmed to work in LineageOS 19 (Android 12L) with Magisk 25+.

## Attribution

I took great inspiration from HuskyDG's [hide_userdebug](https://github.com/Magisk-Modules-Alt-Repo/hide_userdebug) module which seems to be abandoned, and didn't seem to work for some prop values, so I made my own version.
