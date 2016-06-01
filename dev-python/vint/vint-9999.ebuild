# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Vint is a Vim script Language Lint."
HOMEPAGE="https://github.com/Kuniwak/vint"

EGIT_REPO_URI="git://github.com/Kuniwak/vint.git"
PYTHON_DEPEND="2"

inherit eutils distutils git-2

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="
	>=dev-python/pathlib-1.0.1
	>=dev-python/ansicolor-0.2.4
	>=dev-python/pyyaml-3.11
	=dev-python/enum34-1.0.4
"
RDEPEND="${DEPEND}"

src_install() {
	distutils_src_install
}
