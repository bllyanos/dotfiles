#!/bin/bash

alacritty -o window.dimensions.columns=65 -o window.dimensions.lines=12 --title 'PopUp Calendar' -e sh -c "cal -3; echo ''; echo 'Press any key to close...'; read -n 1" &
