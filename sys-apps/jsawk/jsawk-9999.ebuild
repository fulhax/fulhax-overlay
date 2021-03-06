# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils git-r3

DESCRIPTION="Like awk, buf for JSON"
HOMEPAGE="https://github.com/micha/jsawk"
EGIT_REPO_URI="git://github.com/micha/jsawk.git"

LICENSE=""
SLOT="0"
KEYWORDS="**"
IUSE=""

DEPEND="dev-lang/spidermonkey"
RDEPEND="${DEPEND}"

src_install() {
	dobin jsawk
}
