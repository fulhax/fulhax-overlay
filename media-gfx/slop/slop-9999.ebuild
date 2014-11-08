# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="slop (Select Operation) is an application that queries for a
selection from the user and prints the region to stdout."
HOMEPAGE="https://github.com/naelstrof/slop"
EGIT_REPO_URI="git://github.com/naelstrof/slop.git"

inherit cmake-utils git-2

LICENSE="GPL3"
SLOT="0"
KEYWORDS="**"
IUSE=""
BUILD_DIR="${WORKDIR}/${P}"

DEPEND="x11-libs/libXext"
RDEPEND="${DEPEND}"

src_install() {
	dobin slop
}
