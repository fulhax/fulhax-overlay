# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=4

MODULE_AUTHOR=MSTRAT
MODULE_VERSION=0.61
inherit perl-module

DESCRIPTION="Get a localized string representing the duration"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-perl/DateTime"

DEPEND="virtual/perl-Module-Build
	virtual/perl-File-Temp
	${RDEPEND}"

SRC_TEST="do"
