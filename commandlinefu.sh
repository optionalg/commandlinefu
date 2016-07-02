#!/bin/bash

# commandlinefu - search commandlinefu.com
# Copyright (C) 2016 Benjamin Abendroth
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

usage() {
   cat << EOF
Usage: `basename $0` SEARCH-TERMS...

Searches commandlinefu.com
EOF
}

search_commandlinefu()
{
   local search=$(printf "%s" "$*" | base64);
   curl -# "http://www.commandlinefu.com/commands/matching/1/$search/plaintext";
}

(( $# )) || {
   usage;
   exit 1;
}

for arg; do
   [[ "$arg" == "--help" ]] && {
      usage;
      exit 0;
   }
done

search_commandlinefu "$@"
