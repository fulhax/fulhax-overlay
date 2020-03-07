# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A set of static analysis tools for JavaScript http://drjs.org/"
HOMEPAGE="http://drjs.org"

EGIT_REPO_URI="https://github.com/mozilla/doctorjs"
EGIT_HAS_SUBMODULES="1"

inherit git-r3 eutils

LICENSE="MPL-1.1"
SLOT="0"
KEYWORDS=""
IUSE="debug +ignore"

DEPEND="net-libs/nodejs"
RDEPEND="${DEPEND}"

src_prepare() {
	if use ignore; then
		epatch "${FILESDIR}"/0001-Add-ignore-commandline-flag.patch
	fi

	return
}

src_compile() {
	# nothing to compile
	return
}

src_install() {
	sed -i "s#util.puts#console.log#g" bin/jsctags.js
	sed -i "s#PREFIX=/usr/local#PREFIX=/${D}/${DESTTREE}#" Makefile
	make install
}
