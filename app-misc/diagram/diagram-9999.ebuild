# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_{3,4} )

inherit distutils-r1 git-2

DESCRIPTION="Text mode diagrams using UTF-8 characters and fancy colors (using Python)."
HOMEPAGE="https://github.com/tehmaze/diagram"
EGIT_REPO_URI="git://github.com/tehmaze/diagram.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="**"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
