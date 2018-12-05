# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit qmake-utils

DESCRIPTION="Toggl Desktop app"
HOMEPAGE="https://github.com/toggl/toggldesktop https://www.toggl.com"
SRC_URI="https://github.com/toggl/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/poco:=[crypto,data,json,net,sqlite,ssl,xml]
	dev-cpp/bugsnag-qt
	dev-qt/qtcore:5=
	dev-qt/qtgui:5=
	dev-lang/lua:5.2
	dev-libs/openssl:=
	app-misc/ca-certificates[cacert]"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-unbundle.patch" )

src_configure() {
	# https://github.com/toggl/toggldesktop/wiki/Building-Toggl-Desktop-from-source-for-usage-with-live-servers
	sed -i \
		-e 's|development|production|' \
		src/ui/linux/TogglDesktop/TogglDesktop.pro || die
	sed -i \
		-e '/urls::SetUseStagingAsBackend/,+1d' \
		src/context.cc || die

	# use our installed cacert root certificate
	sed -i \
		-e 's|cacert.pem|../share/ca-certificates/cacert.org/cacert.org_root.crt|' \
		src/ui/linux/TogglDesktop/toggl.cpp || die

	cd "${S}/src/lib/linux/TogglDesktopLibrary"
	eqmake5 TogglDesktopLibrary.pro

	cd "${S}/src/ui/linux/TogglDesktop"
	eqmake5 TogglDesktop.pro
}

src_compile() {
	emake -C src/lib/linux/TogglDesktopLibrary
	emake -C src/ui/linux/TogglDesktop
}

src_install() {
	dolib src/lib/linux/TogglDesktopLibrary/build/release/libTogglDesktopLibrary.so.*
	dobin src/ui/linux/TogglDesktop/build/release/TogglDesktop

	dodoc -r AUTHORS README.md docs/
}
