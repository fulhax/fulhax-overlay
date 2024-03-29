# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

MODULE_AUTHOR=TBR
MODULE_VERSION=0.02
inherit perl-module

DESCRIPTION="Perl interface to the wkhtmltopdf program for producing PDF-File from HTML-File."

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-perl/Module-Build"

SRC_TEST="do"
