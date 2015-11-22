# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_DEPEND="2"
PYTHON_COMPAT=( python2_7 )

inherit distutils eutils git-2

DESCRIPTION="Useful snippets of python code"
HOMEPAGE="https://github.com/fedora-infra/kitchen"
EGIT_REPO_URI="git://github.com/fedora-infra/kitchen.git"

LICENSE="GPL 2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
