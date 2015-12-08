# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=SMUELLER
MODULE_VERSION=1.05
inherit perl-module

DESCRIPTION="A set of useful typemaps"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=">=virtual/perl-ExtUtils-ParseXS-3.180.300"
DEPEND="${RDEPEND}
	>=dev-perl/perl-Module-Build-0.400.0
	test? (
		virtual/perl-Test-Simple
	)
"

SRC_TEST=do
