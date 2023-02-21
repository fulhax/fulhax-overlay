# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
inherit eutils git-r3

EGIT_REPO_URI="https://github.com/qw3rtman/gg.git"

DESCRIPTION="Git Goodies: At-A-Glance, Efficient, and Aesthetically Pleasing Git Shortcuts"
HOMEPAGE="https://git.io/gitgoodies"
KEYWORDS=""
LICENSE=""
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin bin/gg
}
