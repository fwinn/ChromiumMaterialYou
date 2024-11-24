# Chromium pywal theme generator

Generates [pywal](https://github.com/dylanaraps/pywal) and [kde-material-you-colors](https://github.com/luisbocanegra/kde-material-you-colors) themes for Chromium and Chromium-based browsers.

![Screenshot](./Screenshots/screenshot.png)

## Usage
Note: If you're using kde-material-you-colors, `generate-pywal-theme.sh` will not deliver good results.
So make sure to use `generate-material-you-theme.sh` instead
1. Run script `./generate-pywal-theme.sh` for pywal or `./generate-material-you-theme.sh` for kde-material-you-colors.
2. Open Chromium
3. Go to `chrome://extensions`
4. Turn on "Developer Mode" in the top right corner
5. Press "Load unpacked"
6. Select "Pywal" or "MaterialYou" (by default) in the same folder with the script
7. PROFIT!


However, you need to run this script and restart chromium each time you change pywal colors (or reload extension manually, since there is no way to do it automatically).
So, make an alias or something like that.
But you don't need to repeat the steps above, just run the script and that's it, chromium will update theme colors automatically. 😁

