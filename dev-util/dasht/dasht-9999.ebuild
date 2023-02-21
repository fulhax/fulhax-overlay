# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit git-r3

DESCRIPTION="API documentation in your terminal"
HOMEPAGE="http://github.com/sunaku/dasht"
EGIT_REPO_URI="https://github.com/sunaku/dasht.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	app-shells/bash
	dev-db/sqlite
	net-misc/wget
	net-misc/socat
	www-client/w3m
"
DEPEND="
	${RDEPEND}
"

src_install() {
	dobin bin/*
	dodoc man/man1/*
}
