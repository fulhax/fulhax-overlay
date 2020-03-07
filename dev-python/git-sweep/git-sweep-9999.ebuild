# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4} )

inherit eutils distutils-r1 git-r3

DESCRIPTION=" A command-line tool that helps you clean up Git branches that have been merged into master."
HOMEPAGE="https://github.com/arc90/git-sweep"
EGIT_REPO_URI="git://github.com/arc90/git-sweep.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="git"
IUSE=""

DEPEND="dev-vcs/git dev-python/git-python"
RDEPEND="${DEPEND}"
