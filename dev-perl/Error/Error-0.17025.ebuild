# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=SHLOMIF
MODULE_VERSION=0.17025
inherit perl-module

DESCRIPTION="Error/exception handling in an OO-ish way"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	virtual/perl-Scalar-List-Utils
"

SRC_TEST="do"
