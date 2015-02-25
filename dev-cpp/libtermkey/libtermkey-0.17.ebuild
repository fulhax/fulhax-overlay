# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit flag-o-matic

DESCRIPTION="Library for easy processing of keyboard entry from terminal-based programs"
HOMEPAGE="http://www.leonerd.org.uk/code/libtermkey/"
SRC_URI="http://www.leonerd.org.uk/code/libtermkey/${PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
	emake PREFIX="${D}/usr" install
}
