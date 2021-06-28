# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit git-r3 qmake-utils

DESCRIPTION="Additional style plugins for Qt"
HOMEPAGE="http://code.qt.io/cgit/qt/qtstyleplugins.git/"
LICENSE="LGPL"
SLOT="0"

EGIT_REPO_URI="http://code.qt.io/cgit/qt/qtstyleplugins.git"
EGIT_BRANCH="master"
SRC_URI=""
KEYWORDS=""

IUSE=""

RDEPEND="dev-qt/qtcore:5
         x11-libs/gtk+:2
         x11-libs/libX11"
DEPEND="${RDEPEND}"

src_configure() {
	eqmake5 PREFIX="${D}"/usr
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
