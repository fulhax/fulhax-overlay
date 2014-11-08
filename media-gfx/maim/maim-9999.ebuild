# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="maim (make image) takes screenshots of your desktop. It has
options to take only a region, and relies on slop to query for regions. maim is
supposed to be an improved scrot."
HOMEPAGE="https://github.com/naelstrof/maim"
EGIT_REPO_URI="git://github.com/naelstrof/maim.git"

inherit cmake-utils git-2

LICENSE="GPL3"
SLOT="0"
KEYWORDS="**"
IUSE=""
BUILD_DIR="${WORKDIR}/${P}"

DEPEND="x11-libs/libXrandr x11-libs/libXfixes media-libs/imlib2"
RDEPEND="${DEPEND}"

src_install() {
	dobin maim
}
