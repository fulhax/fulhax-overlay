# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

MODULE_AUTHOR=CHLIGE
MODULE_VERSION=0.96
inherit perl-module

DESCRIPTION="Guess C++ compiler and flags"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	>=dev-perl/Net-DNS-0.500.0
	>=virtual/perl-Socket-1.750.0
"

DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	test? (
		virtual/perl-Test-Simple
	)
"

SRC_TEST=do
