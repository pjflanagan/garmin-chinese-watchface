
# Development

See the [Garmin Developer](https://developer.garmin.com/connect-iq/overview/) page for details about the SDK, compiler, and publishing.

## Run

Go to `Run > Run without debugging` then select the device to run on.
Note: the device selection comes up every time because we have a `.vscode/launch.json` file present.

## Export

Exporting the project for dev and prod release follow similar steps

1. Update the version number and environment in `ChineseWatchFaceComplications.mc`
  - Use this pattern `<prodRelease>.<devRelease>`
2. Copy and paste the correct App UUID into `manifest.xml`
  - prod: ensure that all the correct devices are enabled
3. Run `Monkey C: Export Project`
4. Upload to the Developer Dashboard and use the version number in the app

## Error Reporting

Run `Monkey C: Open ERA Viewer` to see error logs.

## Notes

- [Garmin Color Palette](https://lospec.com/palette-list/6-bit-rgb)
