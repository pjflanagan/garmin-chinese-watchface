
# Garmin Chinese Watch Face

Available on Garmin ConnectIQ soon!

![Promo Banner](images/HeroImage.jpg)

View the time in Chinese! Great for students! 

Watch displays:
- the time of day in Chinese
- the hour and minute in Chinese
- a second hand
- and a decorative wave background.

Choose from a list of themes including:
- Waves
- Sky
- Chinese New Year
- and more!

NOTE: This watch face does NOT require a APAC/Taiwan/China/HK model to be able to display Chinese.

## About

This is a branch of [garmin-mandarin-clock](https://github.com/starryalley/garmin-mandarin-clock) by [Mark Kuo](https://github.com/starryalley).
I love using this watch face, and wanted to give it a little decoration and some motion.
Inspired by how dive watches often have wave backgrounds, 
I added a wave background meant to resemble the way clouds are often drawn in Asia.
I've also added a second hand to make the watch feel more alive.


## Development

See the [Garmin Developer](https://developer.garmin.com/connect-iq/overview/) page for details about the SDK, compiler, and publishing.

### Run

Go to `Run > Run without debugging` then select the device to run on.
Note: the device selection comes up every time because we have a `.vscode/launch.json` file present.

### Export

Exporting the project for dev and prod release follow similar steps

1. Update the version number in `ChineseWatchFaceComplications.mc`
  - dev: use `dev_1.0.##`
  - prod: remove `dev_` and use the same `1.0.##` that was released and tested in dev.
2. Copy and paste the correct App UUID into `manifest.xml`
  - prod: ensure that all the correct devices are enabled
3. Run `Monkey C: Export Project`
4. Upload to the Developer Dashboard and use the version number in the app

### Error Reporting

Run `Monkey C: Open ERA Viewer` to see error logs.

### Notes

- [Garmin Color Palette](https://lospec.com/palette-list/6-bit-rgb)
