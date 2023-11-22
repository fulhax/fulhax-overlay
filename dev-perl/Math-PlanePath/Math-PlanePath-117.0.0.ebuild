# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

MODULE_AUTHOR="KRYDE"
MODULE_VERSION="117"

inherit perl-module

DESCRIPTION="Mathematical paths through the 2-D plane"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
	dev-perl/Math-Libm
	>=dev-perl/constant-defer-5.0.0
	virtual/perl-Scalar-List-Utils
"

DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	test? (
		virtual/perl-Test
	)
"

SRC_TEST="do"
