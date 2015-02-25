# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A set of static analysis tools for JavaScript http://drjs.org/"
HOMEPAGE="http://drjs.org"

EGIT_REPO_URI="https://github.com/mozilla/doctorjs"
EGIT_HAS_SUBMODULES="1"

inherit git-2

LICENSE="MPL-1.1"
SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="net-libs/nodejs"
RDEPEND="${DEPEND}"

src_configure() {
	# nothing to configure
	return
}

src_compile() {
	# nothing to compile
	return
}

src_install() {
	sed -i "s#PREFIX=/usr/local#PREFIX=/${D}/${DESTTREE}#" Makefile
	make install
}
