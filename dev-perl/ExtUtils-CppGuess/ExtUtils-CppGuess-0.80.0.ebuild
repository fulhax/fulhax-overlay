# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=ETJ
MODULE_VERSION=0.08
inherit perl-module

DESCRIPTION="Guess C++ compiler and flags"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-perl/Capture-Tiny"

DEPEND="${RDEPEND}
	>=dev-perl/perl-Module-Build-0.420.0
	test? (
		virtual/perl-autodie
		virtual/perl-Test-Simple
		virtual/perl-File-Spec
		virtual/perl-ExtUtils-MakeMaker
		virtual/perl-ExtUtils-Manifest
	)
"

SRC_TEST=do
