# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR="DSLEWART"
MODULE_VERSION="1.00"

inherit perl-module

DESCRIPTION="wrapper to libm functions"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	virtual/perl-AutoLoader
	virtual/perl-Carp
"

DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
"

SRC_TEST="do"
