# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit flag-o-matic git-r3

DESCRIPTION="An abstract library implementation of a DEC VT/xterm/ECMA-48 terminal emulator."
HOMEPAGE="https://launchpad.net/libvterm/"
EGIT_REPO_URI="git://github.com/neovim/libvterm.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
	emake PREFIX="${D}/usr" install
}
