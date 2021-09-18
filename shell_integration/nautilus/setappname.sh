#!/bin/sh

# this script replaces the line
#  appname = 'Elyranur'
# with the correct branding name in the syncstate.py script
# It also replaces the occurences in the class name so several
# branding can be loaded (see #6524)
sed -i.org -e "s/Elyranur/$1/g" syncstate.py
