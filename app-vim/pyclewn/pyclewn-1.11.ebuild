# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python3_{2,3,4} )

inherit distutils-r1 eutils

DESCRIPTION="Pyclewn is a python program that allows the use of the vim editor as a front end to a debugger"
HOMEPAGE="http://sourceforge.net/projects/pyclewn/"
SRC_URI="mirror://sourceforge/${PN}/${P}.py3.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="|| ( >=app-editors/vim-7.3 >=app-editors/gvim-7.0[netbeans] )"
RDEPEND="${DEPEND} sys-devel/gdb"

src_unpack() {
	unpack ${A}
	mv ${WORKDIR}/${P}.py3 ${WORKDIR}/${P}
}

src_prepare() {
	PATCHES=(
		"${FILESDIR}/${PN}-vim-access-denied.patch"
	)

	distutils-r1_python_prepare_all
}
