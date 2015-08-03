# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils distutils git-2

PYTHON_DEPEND="2"

DESCRIPTION="A Terminal Client for MySQL with AutoCompletion and Syntax Highlighting. "
HOMEPAGE="http://github.com/dbcli/mycli"
EGIT_REPO_URI="git://github.com/dbcli/mycli.git"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="
	>=dev-python/configobj-5.0.6
	>=dev-python/pymysql-0.6.6
	>=dev-python/click-4.1
	=dev-python/prompt_toolkit-0.45
	=dev-python/python-sqlparse-0.1.14
"
RDEPEND="${DEPEND}"
