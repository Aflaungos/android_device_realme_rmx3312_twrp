# TWRP Device configuration for Realme GT2 - RMX3311-RMX3312 - Covenant Fuchsia

## Device specifications
Basic    | Spec Sheet
--------:|:----------------------
Chipset  | Qualcomm Snapdragon 888 SM8350
CPU      | 1x 2.84 GHz Cortex-X1 + 3x 2.42 GHz Cortex-A78 + 4x 1.80 GHz Cortex-A55
GPU      | Adreno 660
Memory   | 8GB RAM
Storage  | 256GB
Shipped Android version | Android 12, Realme UI 3.0
Battery  | Li-Po 5000mAh, non-removable
Display  | LCD, 120Hz, 6.62 inch, 1080 x 2400 pixels, 20:9 ratio

## Device picture
<img src="https://t2.tudocdn.net/605718?w=142&h=304" width="100%"/>

## Kernel Source
From Stock ROM
```
RMX3312-user 14 UKQ1.230924.001 S.1a33387-2-4 release-keys
```
## How to compile locally:
First repo init the twrp-12.1 tree:

```
mkdir ~/android/twrp-12.1
cd ~/android/twrp-12.1
repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
mkdir -p .repo/local_manifests
```

Then add to a local manifest (if you don't have .repo/local_manifest then make that directory and make a blank file and name it something like twrp.xml):

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <remote name="me" 
        fetch="https://github.com/Aflaungos" />
  <project name="android_device_realme_rmx3312" path="device/realme/rmx3312" remote="me" revision="android-12.1"/>
</manifest>
```
Now you can sync your source:
```
repo sync
```
Finally execute these:
```
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
lunch twrp_porsche-eng
mka bootimage
```
