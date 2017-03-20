# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eutils git-2

DESCRIPTION="PRAW, an acronym for \"Python Reddit API Wrapper\",\
	is a python package that allows for simple access to reddit's API."
HOMEPAGE="https://github.com/praw-dev/praw"
EGIT_REPO_URI="git://github.com/praw-dev/praw.git"

LICENSE="GNU GPLv3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/decorator dev-python/six dev-python/requests dev-python/update_checker"
RDEPEND="${DEPEND}"
