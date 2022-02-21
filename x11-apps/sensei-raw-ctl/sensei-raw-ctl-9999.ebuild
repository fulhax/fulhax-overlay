# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="SteelSeries Sensei Raw configuration tool"
HOMEPAGE="https://github.com/Jkillelea/sensei-raw-ctl/"
EGIT_REPO_URI="https://github.com/Jkillelea/sensei-raw-ctl"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="gtk"

RDEPEND="
    >=dev-libs/libusb-1.0
	gtk? ( >=x11-libs/gtk+-3.0 )"
DEPEND="
    >=dev-util/cmake-2.8.5
    sys-apps/help2man
    $RDEPEND"

src_configure() {
    local mycmakeargs=(
		-DGUI=$(usex gtk)
    )

    cmake-utils_src_configure
}
