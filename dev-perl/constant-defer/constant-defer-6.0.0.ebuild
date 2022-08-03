# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

MODULE_AUTHOR="KRYDE"
MODULE_VERSION="6"

inherit perl-module

DESCRIPTION="constant subs with deferred value calculation"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND="
	virtual/perl-ExtUtils-MakeMaker
	test? (
		virtual/perl-Test
	)
"

SRC_TEST="do"
