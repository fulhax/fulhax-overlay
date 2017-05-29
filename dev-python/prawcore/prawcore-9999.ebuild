# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eutils git-2

DESCRIPTION="Low-level communication layer for PRAW 4+."
HOMEPAGE="https://github.com/praw-dev/prawcore"
EGIT_REPO_URI="git://github.com/praw-dev/prawcore.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-python/decorator
	dev-python/six
	dev-python/requests
	dev-python/update_checker
"

RDEPEND="${DEPEND}"

src_compile() {
	python setup.py --prefix=/usr --root="${D}" --optimize=1
}

src_install() {
	python setup.py install --prefix=/usr --root="${D}" --optimize=1
}
