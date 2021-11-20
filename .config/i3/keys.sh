#!/bin/bash

# shellcheck disable=2016
grep -E '^bind|# KP_GROUP' .config/i3/config  | \
  grep -v -E  'workspace|Print ' | \
  sed 's|bindsym $mod+|Mod-|g;s|bindsym ||g;s|# KP_GROUP\(.*\)|\n\1|g' | \
  yad --text-info --back=#282c34 --fore=#46d9ff --geometry=1000x600

