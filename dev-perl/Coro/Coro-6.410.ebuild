# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=7

MODULE_AUTHOR=MLEHMANN
MODULE_VERSION=6.41
inherit perl-module

DESCRIPTION="The only real threads in perl"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-perl/Event
	dev-perl/AnyEvent
	dev-perl/common-sense
	virtual/perl-Scalar-List-Utils
	dev-perl/EV
	dev-perl/AnyEvent
	virtual/perl-Storable
	virtual/perl-Time-HiRes
	dev-perl/Guard
	dev-perl/IO-AIO"

DEPEND="${RDEPEND}"

SRC_TEST="do"
