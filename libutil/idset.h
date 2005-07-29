/*
 * Copyright (c) 2005 Tama Communications Corporation
 *
 * This file is part of GNU GLOBAL.
 *
 * GNU GLOBAL is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * GNU GLOBAL is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA.
 */
#ifndef _IDSET_H_
#define _IDSET_H_

typedef struct {
	int size;
	int max;
	unsigned char *set;
} IDSET;

IDSET *idset_open(unsigned int);
void idset_add(IDSET *, unsigned int);
int idset_contains(IDSET *, unsigned int);
int idset_count(IDSET *);
void idset_close(IDSET *);

#endif /* ! _IDSET_H_ */
