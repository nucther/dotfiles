#!/usr/bin/env bash

# Rofi Power Menu Script (Icon-Only with Formatted Uptime and Case Statement)
# This script uses an external .rasi theme file for styling.
# It displays only icons, includes formatted system uptime in the prompt,
# and uses a case statement for safer command execution.

# Define the menu options and their corresponding commands
# The format is "Icon|Command to execute"
# IMPORTANT: Ensure you have a Nerd Font or Font Awesome installed for these icons
# to display correctly in Rofi.
OPTIONS="\n"          # Restart icon
OPTIONS+="\n"   # Power Off icon
OPTIONS+="\n" # Logout icon
OPTIONS+="" # Lock icon

# Get system uptime using 'uptime -p' and format it
# 'uptime -p' output example: "up 2 days, 3 minutes"
# We want "Uptime : 2 days 3 minutes"
CURRENT_UPTIME_RAW=$(uptime -p)
# Remove "up " prefix and replace ", " with " " for minutes/hours/days
# This handles cases like "up 2 days, 3 hours, 5 minutes" or "up 30 minutes"
CURRENT_UPTIME=$(echo "${CURRENT_UPTIME_RAW}" | sed -E 's/^up //; s/, / /g')

# Construct the prompt string with formatted uptime
ROFI_PROMPT="Uptime : ${CURRENT_UPTIME}"

# Path to your Rofi theme file (.rasi)
# Adjust this path if you save your .rasi file elsewhere
ROFI_THEME_PATH="$HOME/.config/rofi/powermenu.rasi" # Common location

# Check if the theme file exists
if [ ! -f "$ROFI_THEME_PATH" ]; then
    echo "Error: Rofi theme file not found at $ROFI_THEME_PATH"
    echo "Please ensure 'power_menu.rasi' is saved in the correct location."
    exit 1
fi

# Rofi command to display the menu
# -dmenu: Run in dmenu mode (for selecting an option)
# -p "${ROFI_PROMPT}": Set the prompt text, now including formatted uptime
# -i: Case-insensitive matching (less relevant for icons, but good practice)
# -theme: Specify the path to your .rasi theme file
CHOSEN_OPTION=$(echo -e "$OPTIONS" | rofi -dmenu \
    -p "${ROFI_PROMPT}" \
    -i \
    -theme "$ROFI_THEME_PATH")

# Check if an option was chosen (not empty)
if [ -n "$CHOSEN_OPTION" ]; then
    # Extract ONLY the icon part from the chosen option string
    # This is the part before the first '|'
    CHOSEN_ICON=$(echo "$CHOSEN_OPTION" | awk -F'|' '{print $1}')
    
    # Use a case statement to execute the command based on the chosen icon
    case "$CHOSEN_ICON" in
        "") # Power Off
            shutdown -h now
            ;;
        "") # Restart
            reboot
            ;;
        "") # Logout
            qtile cmd-obj -o cmd -f shutdown
            ;;
        "") # Lock
            betterlockscreen -l dim
            ;;
        *) # Fallback for unknown options (shouldn't happen with fixed menu)
            echo "Unknown option selected: $CHOSEN_ICON. Exiting."
            ;;
    esac
else
    echo "No option selected. Exiting."
fi

