# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="ctags for JavaScript based on Google Closure Compiler "
HOMEPAGE="https://github.com/AnyChart/gjstags"

EGIT_REPO_URI="https://github.com/AnyChart/gjstags"
EGIT_HAS_SUBMODULES="1"

inherit git-2

LICENSE="MPL-1.1"
SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="virtual/jre"
RDEPEND="${DEPEND}"

src_prepare() {
	econf --prefix="${D}/${DESTTREE}"
}

src_install() {
	sed -i "s#/usr/local/#${DESTTREE}/#" bin/gjstags
	dobin bin/gjstags
	dobin bin/gjstags.jar
	dobin libs/compiler.jar
}
