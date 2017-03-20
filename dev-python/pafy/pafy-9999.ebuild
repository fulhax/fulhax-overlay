# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4} )

DESCRIPTION="Python library to download YouTube content and retrieve metadata "
HOMEPAGE="https://github.com/np1/pafy/"

EGIT_REPO_URI="git://github.com/np1/pafy.git"
PYTHON_DEPEND="2"

inherit eutils distutils-r1 git-2

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	distutils-r1_src_install
}
