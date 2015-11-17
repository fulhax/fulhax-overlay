# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="A colorized Android logcat"
HOMEPAGE="http://zserge.com/blog/logdog.html"
EGIT_REPO_URI="https://bitbucket.org/zserge/logdog"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin logdog
}
