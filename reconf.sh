#!/bin/sh
#
# Copyright (c) 2001
#             Tama Communications Corporation. All rights reserved.
#
# This file is part of GNU GLOBAL.
#
# GNU GLOBAL is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
#
# GNU GLOBAL is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#
prog='autoconf automake aclocal autoheader'	# required programs
file='configure.in Makefile.am'			# required files

echo "- File existent checking..."
for f in `echo $file`; do
	if [ ! -f $f ]; then
		echo "*** File '$f' not found."
		echo "You must execute this command at the root of GLOBAL source directory."
		exit 1
	fi
done

echo "- Program existent checking..."
for p in `echo $prog`; do
	found=0
	for d in `echo $PATH | sed -e 's/^:/.:/' -e 's/::/:.:/g' -e 's/:$/:./' -e 's/:/ /g'`
	do
		if [ -x $d/$p ]; then
			#echo "Found at $d/$p."
			found=1
			break
		fi
	done
	case $found in
	0)	echo "*** Program '$p' not found."
		echo "Please install automake and autoconf."
		exit 1;;
	esac
done

echo "- Clean up config.cache..."
rm -f config.cache

# do the job
echo "- Generating configure items..."
(set -x; aclocal && autoheader && automake --add-missing && autoconf) &&
echo "You are ready to execute ./configure."
