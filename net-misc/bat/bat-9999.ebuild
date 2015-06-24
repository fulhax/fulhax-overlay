# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="Go implemented CLI cURL-like tool for humans. Bat can be used for testing, debugging, and generally interacting with HTTP servers."
HOMEPAGE="https://github.com/astaxie/bat"
LICENSE="Apache License v2.0"
SLOT="0"
KEYWORDS="~*"
IUSE=""

GO_PN="github.com/astaxie/bat"

EGIT_REPO_URI="https://github.com/astaxie/bat.git"
EGIT_CHECKOUT_DIR="${S}/src/${GO_PN}"

DEPEND="dev-lang/go"
RDEPEND=""

export GOPATH="${S}"

src_compile(){
	go build -o bat -v -x ${GO_PN}/${d} || die
}

src_install(){
	dobin bat
}
