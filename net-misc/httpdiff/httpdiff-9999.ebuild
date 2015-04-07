# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="Perform the same request against two HTTP servers and diff the results"
HOMEPAGE="https://github.com/jgrahamc/httpdiff"
EGIT_REPO_URI="https://github.com/jgrahamc/httpdiff.git"
LICENSE="GNU2"
SLOT="0"
KEYWORDS="~*"
IUSE=""

GO_PN="github.com/jgrahamc/httpdiff"
EGIT_CHECKOUT_DIR="${S}/src/${GO_PN}"

DEPEND="dev-lang/go"
RDEPEND=""

export GOPATH="${S}"

src_compile(){
	go build -o httpdiff -v -x ${GO_PN}/${d} || die
}

src_install(){
	dobin httpdiff
}
