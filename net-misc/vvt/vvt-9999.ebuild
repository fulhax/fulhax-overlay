# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="vvt.nu client to post and get pastes."
HOMEPAGE="https://vvt.nu"
EGIT_REPO_URI="https://github.com/rendom/vvt-cli.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~*"
IUSE=""

GO_PN="github.com/rendom/vvt-cli"
EGIT_CHECKOUT_DIR="${S}/src/${GO_PN}"

DEPEND="dev-lang/go"
RDEPEND=""

export GOPATH="${S}"

src_compile(){
	GO15VENDOREXPERIMENT=1 go build -o vvt -v -x ${GO_PN}/${d} || die
}

src_install(){
	dobin vvt
}
