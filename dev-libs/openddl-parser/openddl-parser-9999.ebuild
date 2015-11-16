# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 cmake-utils

DESCRIPTION="A simple and fast OpenDDL Parser"
HOMEPAGE="http://github.com/kimkulling/openddl-parser"
EGIT_URI="git://github.com/kimkulling/openddl-parser.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	cmake
"
DEPEND="
	${RDEPEND}
"

src_install() {
	dolib.so lib/libopenddl_parser.so
	insinto /usr/include/openddlparser
	doins include/openddlparser/*.h

	insinto /usr/lib/pkgconfig
	doins "${FILESDIR}"/openddlparser.pc
}
