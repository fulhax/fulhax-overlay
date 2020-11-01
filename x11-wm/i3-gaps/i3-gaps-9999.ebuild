# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools git-r3

DESCRIPTION="i3 with more features"
HOMEPAGE="https://github.com/Airblader/i3.git"

EGIT_REPO_URI="https://github.com/Airblader/i3.git"
if [[ ${PV} = 9998 ]]; then
	EGIT_BRANCH="gaps"
else
	EGIT_BRANCH="gaps-next"
fi

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
RESTRICT="!test? ( test )"

CDEPEND="dev-libs/glib:2
	dev-libs/libev
	dev-libs/libpcre
	dev-libs/yajl
	x11-libs/cairo[X,xcb(+)]
	x11-libs/libxcb[xkb]
	x11-libs/libxkbcommon[X]
	x11-libs/pango[X]
	x11-libs/startup-notification
	x11-libs/xcb-util
	x11-libs/xcb-util-cursor
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-wm
	x11-libs/xcb-util-xrm
"
DEPEND="${CDEPEND}
	test? (
		dev-perl/ExtUtils-PkgConfig
		dev-perl/IPC-Run
		dev-perl/Inline
		dev-perl/Inline-C
		dev-perl/X11-XCB
		dev-perl/XS-Object-Magic
		x11-base/xorg-server[xephyr,xvfb]
		x11-misc/xvfb-run
	)
"
BDEPEND="
	app-text/asciidoc
	app-text/xmlto
	dev-lang/perl
	virtual/pkgconfig
"
RDEPEND="${CDEPEND}
	dev-lang/perl
	dev-perl/AnyEvent-I3
	dev-perl/JSON-XS
	!x11-wm/i3
"

DOCS=( RELEASE-NOTES-${PV} )
BUILDDIR="${S}/build"
PATCHES=( "${FILESDIR}/i3-outline.patch" )

src_prepare() {
	default
	eautoreconf
	sed -i 's/-non-git//' I3_VERSION
	if has nodoc ${FEATURES}; then
		sed -e 's/\(AM_CONDITIONAL(\[BUILD_DOCS\],\).*/\1 false)/' -i configure.ac || die
	fi
	if has noman ${FEATURES}; then
		sed -e 's/\(AM_CONDITIONAL(\[BUILD_MANS\],\).*/\1 false)/' -i configure.ac || die
	fi
	cat <<- EOF > "${T}"/i3wm
		#!/bin/sh
		exec /usr/bin/i3
	EOF
}

src_configure() {
	mkdir "${BUILDDIR}"
	cd "${BUILDDIR}"
	../configure
}

src_compile() {
	cd "${BUILDDIR}"
	emake V=1
}

src_install() {
	cd "${BUILDDIR}"
	emake DESTDIR="${D}" install
	exeinto /etc/X11/Sessions
	doexe "${T}"/i3wm
}

pkg_postinst() {
	einfo "There are several packages that you may find useful with ${PN} and"
	einfo "their usage is suggested by the upstream maintainers, namely:"
	einfo "  x11-misc/dmenu"
	einfo "  x11-misc/i3status"
	einfo "  x11-misc/i3lock"
	einfo "Please refer to their description for additional info."
}
