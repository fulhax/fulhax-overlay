# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CMAKE_BUILD_TYPE=Release
inherit cmake-utils git-r3

DESCRIPTION="Robomongo — is a shell-centric crossplatform MongoDB management tool."
HOMEPAGE="http://www.robomongo.org/"
EGIT_REPO_URI="https://github.com/paralect/robomongo"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	>dev-qt/qtcore-5
	>dev-qt/qtgui-5
	>dev-qt/qtdbus-5
	>dev-qt/qtprintsupport-5
"

RDEPEND="${DEPEND}"

S=${WORKDIR}/${P}

scr_configure() {
	local mycmakeargs=(
		-DOS_ARC=64
	)
	cmake-utils_src_configure
}
