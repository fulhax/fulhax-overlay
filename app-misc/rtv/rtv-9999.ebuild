# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_DEPEND="2"
PYTHON_COMPAT=( python2_7 )

inherit eutils distutils git-2

DESCRIPTION="Browse Reddit from your terminal"
HOMEPAGE="https://github.com/michael-lazar/rtv"
EGIT_REPO_URI="git://github.com/michael-lazar/rtv.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="reddit"
IUSE=""

DEPEND="www-servers/tornado dev-python/six dev-python/requests dev-python/praw dev-python/kitchen"
RDEPEND="${DEPEND}"