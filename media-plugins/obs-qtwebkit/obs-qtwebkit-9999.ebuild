# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="Browser plugin for obs-studio"
HOMEPAGE="http://github.com/bazukas/obs-qtwebkit"
EGIT_REPO_URI="git://github.com/bazukas/obs-qtwebkit.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	media-video/obs-studio
	dev-qt/qtwebkit:5
	dev-qt/qtcore:5
"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/obs/obs-plugins/obs-qtwebkit
	doins build/qtwebkit-browser.so
	doins build/renderer
	insinto /usr/share/obs/obs-plugins/obs-qtwebkit/locale
	doins locale/*.ini
}
