# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 git-2

EGIT_REPO_URI="git://github.com/evernote/evernote-sdk-python.git"

DESCRIPTION="Evernote SDK for Python"
HOMEPAGE="http://dev.evernote.com"

LICENSE="APACHE"
SLOT="0"
KEYWORDS="**"
IUSE=""

DEPEND="
	dev-python/oauth2
"
RDEPEND="${DEPEND}"

src_prepare() {
	# evernote shouldl not install thrift!
	einfo "Removing thrift"
	rm -r ${WORKDIR}/${P}/lib/thrift
}
