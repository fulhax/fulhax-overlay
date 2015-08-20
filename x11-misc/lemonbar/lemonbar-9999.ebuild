# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="A featherweight, lemon-scented, bar based on xcb"
HOMEPAGE="https://github.com/LemonBoy/bar"
SRC_URI=""
EGIT_REPO_URI="https://github.com/LemonBoy/bar.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="x11-libs/libxcb
		>=dev-lang/perl-5"
RDEPEND="x11-libs/libxcb"

src_prepare() {
	sed -i -e 's/-Os//' Makefile || die "Sed failed"
}
