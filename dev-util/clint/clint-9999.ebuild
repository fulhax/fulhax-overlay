# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_{6,7} )

inherit python-single-r1 git-r3

DESCRIPTION="Checker to make sure a C file follows Google's C style guide"
HOMEPAGE="https://github.com/neovim/neovim"
EGIT_REPO_URI="https://github.com/neovim/neovim"

LICENSE="cpplint"
SLOT="0"
KEYWORDS=""
IUSE="test"

src_install() {
	python_doscript ${PN}/src/clint.py
}
