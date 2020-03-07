# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eutils git-r3

DESCRIPTION="PRAW, an acronym for \"Python Reddit API Wrapper\",\
	is a python package that allows for simple access to reddit's API."
HOMEPAGE="https://github.com/praw-dev/praw"
EGIT_REPO_URI="git://github.com/praw-dev/praw.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-python/prawcore
	dev-python/decorator
	dev-python/six
	dev-python/requests
"

RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e 's/update_checker == 0.11/update_checker/' setup.py
}

src_compile() {
	python setup.py --prefix=/usr --root="${D}" --optimize=1
}

src_install() {
	python setup.py install --prefix=/usr --root="${D}" --optimize=1
}
