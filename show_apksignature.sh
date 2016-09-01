#!/bin/bash
#This file is part of The Open GApps script of @mfonville.
#
#    The Open GApps scripts are free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    These scripts are distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#

# Note, for Chrome they changed signatures for Android 7.0 so make sure to pick one of those APKs

SCRIPT="$(readlink -f "$0")"
TOP="$(dirname "$SCRIPT")"
SCRIPTS="$TOP/scripts"

# shellcheck source=scripts/inc.tools.sh
. "$SCRIPTS/inc.tools.sh"
checktools base64 coreutils unzip

for argument in "$@"; do
  file="$(readlink -f "$argument")"
  if [ -f "$file" ]; then
    echo "base64 signature of $file:"
    unzip -p "$file" "META-INF/CERT.RSA" | base64 -
  fi
done
