# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=LMEYER
MODULE_VERSION=v0.0.1
inherit perl-module

DESCRIPTION='Support for creating serializable "inside-out" classes'

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-perl/Class-Std
	dev-perl/Module-Build
"

SRC_TEST="do"
