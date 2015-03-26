# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_{6,7} )

inherit distutils-r1 eutils

DESCRIPTION="Pyclewn is a python program that allows the use of the vim editor as a front end to a debugger"
HOMEPAGE="http://sourceforge.net/projects/pyclewn/"
SRC_URI="https://pypi.python.org/packages/source/p/pyclewn/${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="|| ( >=app-editors/vim-7.3[python] >=app-editors/gvim-7.0[netbeans] )"
RDEPEND="${DEPEND} sys-devel/gdb"

src_install() {
	VIMRUNTIME=/usr/share/vim/vimfiles

	einfo "Extracting Vimball"
	mkdir -p ${D}${VIMRUNTIME}
	vim -c "let g:vimball_home = \"${D}${VIMRUNTIME}\"" \
		-S ./lib/clewn/runtime/${PN}-${PV}.vmb -c 'q' < /dev/tty > /dev/tty

	rm "${D}${VIMRUNTIME}/doc/tags"
	sed -ri "s|${D}||g" "${D}${VIMRUNTIME}/.VimballRecord"

	distutils-r1_src_install
}
