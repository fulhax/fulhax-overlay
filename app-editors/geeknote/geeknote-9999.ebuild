# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 git-2

EGIT_REPO_URI="git://github.com/VitaliyRodnenko/geeknote.git"

DESCRIPTION="Work with Evernote from command line"
HOMEPAGE="http://www.geeknote.me"
KEYWORDS=""
LICENSE="GPL"
SLOT="0"

DEPEND="
	dev-python/thrift
	dev-python/beautifulsoup:4
	dev-python/markdown2
	dev-python/sqlalchemy
	dev-python/html2text
	dev-python/evernote-sdk
"
RDEPEND="${DEPEND}"
