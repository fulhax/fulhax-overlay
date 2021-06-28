# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

MODULE_AUTHOR=BLOONIX
MODULE_VERSION=0.88
inherit perl-module

DESCRIPTION="Log messages to several outputs."

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-perl/Params-Validate
	dev-perl/Module-Build
"

SRC_TEST="do"
