# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Python library to download YouTube content and retrieve metadata "
HOMEPAGE="https://github.com/np1/pafy/"

EGIT_REPO_URI="git://github.com/np1/pafy.git"
PYTHON_DEPEND="2"

inherit eutils distutils git-2

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	distutils_src_install
}
