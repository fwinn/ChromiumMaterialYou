#!/bin/bash

scheme=$(jq ".schemes.dark" "/tmp/kde-material-you-colors-$(whoami).json") # import colors from kde-material-you
wallpaper=$(jq ".pywal.dark.wallpaper" "/tmp/kde-material-you-colors-$(whoami).json" -r)

THEME_NAME="MaterialYou"


DIR=$(dirname "${BASH_SOURCE[0]}")
THEME_DIR="$DIR/$THEME_NAME"

# Converts hex colors into rgb joined with comma
# #fff -> 255, 255, 255
hexToRgb() {
    # Remove '#' character from hex color #fff -> fff
    plain=${1#*#}
    printf "%d, %d, %d" 0x${plain:0:2} 0x${plain:2:2} 0x${plain:4:2}
}

prepare() {
    if [ -d $THEME_DIR ]; then
        rm -rf $THEME_DIR
    fi
    
    mkdir $THEME_DIR
    mkdir "$THEME_DIR/images"
    
    # Copy wallpaper so it can be used in theme  
    background_image="images/theme_ntp_background_norepeat.png"
    cp "$wallpaper" "$THEME_DIR/$background_image"

}


primary=$(hexToRgb $(echo $scheme | jq ".primary" -r))
on_primary=$(hexToRgb $(echo $scheme | jq ".onPrimary" -r))
secondary_container=$(hexToRgb $(echo $scheme | jq ".secondaryContainer" -r))
on_secondary_container=$(hexToRgb $(echo $scheme | jq ".onSecondaryContainer" -r))
surface_container=$(hexToRgb $(echo $scheme | jq ".surfaceContainer" -r))
background=$(hexToRgb $(echo $scheme | jq ".background" -r))

echo $background

generate() {
    # Theme template  
    cat > "$THEME_DIR/manifest.json" << EOF
    {
      "manifest_version": 3,
      "version": "1.0",
      "name": "$THEME_NAME Theme",
      "theme": {
        "images": {
          "theme_ntp_background" : "$background_image"
        },
        "colors": {
          "frame": [$surface_container],
          "frame_inactive": [$background],
          "toolbar": [$secondary_container],
          "ntp_text": [$on_secondary_container],
          "ntp_link": [$tertiary],
          "ntp_section": [$secondary_container],
          "button_background": [$on_primary],
          "toolbar_button_icon": [$on_secondary_container],
          "toolbar_text": [$on_secondary_container],
          "omnibox_background": [$primary],
          "omnibox_text": [$on_primary]
        },
        "properties": {
          "ntp_background_alignment": "bottom"
        }
      }
    }
EOF
}

prepare
generate
echo "Pywal Chrome theme generated at $THEME_DIR"
