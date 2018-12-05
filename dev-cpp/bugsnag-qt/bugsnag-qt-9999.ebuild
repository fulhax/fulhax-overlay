# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 qmake-utils multilib

DESCRIPTION="Bugsnag client for QT projects"
HOMEPAGE="https://github.com/tanel/bugsnag-qt"
EGIT_REPO_URI="https://github.com/tanel/bugsnag-qt.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-qt/qtcore:5=
	dev-qt/qtnetwork:5=
	dev-qt/qtgui:5="
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i \
		-e "s|/usr/lib|/\$(DESTDIR)/usr/$(get_libdir)|" \
		bugsnag-qt.pro || die
}

src_configure() {
	eqmake5 bugsnag-qt.pro
}

src_install() {
	default

	doheader bugsnag.h bugsnag-qt_global.h
}
