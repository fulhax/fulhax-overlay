# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit git-r3

DESCRIPTION="Improved colored diff"
HOMEPAGE="http://www.jefftk.com/icdiff"
EGIT_REPO_URI="https://github.com/jeffkaufman/icdiff"

LICENSE="Python 2.6.2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin icdiff
	dobin git-icdiff
}
