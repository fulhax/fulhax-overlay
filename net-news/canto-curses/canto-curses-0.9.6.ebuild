# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

PYTHON_COMPAT=( python{3_3,3_4} )
PYTHON_REQ_USE="ncurses(+),threads(+)"
inherit distutils-r1 multilib

DESCRIPTION="The ncurses client for canto-daemon"
HOMEPAGE="http://codezen.org/canto-ng/"
SRC_URI="https://github.com/themoken/${PN}/archive/v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=net-news/canto-next-0.9.5[${PYTHON_USEDEP}]"

python_prepare_all() {
	# Respect libdir during plugins installation
	sed -i -e "s:lib/canto:$(get_libdir)/canto:" setup.py || die

	distutils-r1_python_prepare_all
}
