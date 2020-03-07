# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

DESCRIPTION="Python library to download YouTube content and retrieve metadata "
HOMEPAGE="https://github.com/mps-youtube/pafy/"

EGIT_REPO_URI="git://github.com/mps-youtube/pafy.git"

inherit eutils distutils-r1 git-r3

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	distutils-r1_src_install
}
