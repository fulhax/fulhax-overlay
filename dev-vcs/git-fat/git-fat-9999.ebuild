# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

EGIT_REPO_URI="git://github.com/jedbrown/git-fat.git"

PYTHON_COMPAT=( python3_{4,5} )

inherit python-r1 git-2

DESCRIPTION="Simple way to handle fat files without committing them to git"
HOMEPAGE="https://github.com/jedbrown/git-fat"

LICENSE="BSD-2"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="
	dev-vcs/git
"

S="${WORKDIR}/${P}/src/${EGO_PN}"

src_install() {
	dobin git-fat
}
