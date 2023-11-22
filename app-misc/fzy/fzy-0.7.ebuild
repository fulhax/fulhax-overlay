# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="Fuzzy text finder/selector for the terminal with an advanced scoring algorithm"
HOMEPAGE="https://github.com/jhawthorn/${PN}"
SRC_URI="https://github.com/jhawthorn/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	exeinto /usr/bin
	doexe ${PN}
	doman ${PN}.1
}
