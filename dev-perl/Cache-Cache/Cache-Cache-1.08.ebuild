# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=RJBS
MODULE_VERSION=1.08
inherit perl-module

DESCRIPTION="the Cache interface."

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-perl/IPC-ShareLite
	dev-perl/Module-Build
	dev-perl/Error
	virtual/perl-Digest-SHA
"

SRC_TEST="do"
