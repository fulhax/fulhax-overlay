# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils flag-o-matic git-r3

EGIT_REPO_URI="git://github.com/mauke/unibilium.git"
KEYWORDS=""

DESCRIPTION="A terminfo parsing library"
HOMEPAGE="https://github.com/mauke/unibilium"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_configure()  {
	# nothing to configure
	return
}

src_compile() {
	emake PREFIX="/" DESTDIR="${D}/${DESTTREE}"
}

src_install() {
	#sed -i "s#PREFIX=$(prefix)#PREFIX=$(real_prefix)#" Makefile
	emake PREFIX="/" DESTDIR="${D}/${DESTTREE}" install
}
