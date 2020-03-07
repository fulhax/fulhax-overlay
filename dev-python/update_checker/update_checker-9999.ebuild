# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eutils git-r3

DESCRIPTION="A python module that will check for package updates."
HOMEPAGE="https://github.com/bboe/update_checker"
EGIT_REPO_URI="git://github.com/bboe/update_checker"

LICENSE="Copyright Bryce Boe"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/requests"
RDEPEND="${DEPEND}"
