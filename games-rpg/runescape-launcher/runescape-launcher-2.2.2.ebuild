# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit multilib unpacker

DESCRIPTION="Official RuneScape NXT client launcher"
HOMEPAGE="http://www.runescape.com"

SRC_URI="
	amd64? (
		http://content.runescape.com/downloads/ubuntu/pool/non-free/r/runescape-launcher/runescape-launcher_${PV}_amd64.deb
	)
"

SLOT="0"

IUSE="kde"

KEYWORDS="-* ~amd64"

LICENSE="RuneScape-EULA"
RESTRICT="bindist mirror strip"

S="${WORKDIR}"

RDEPEND="
	media-libs/libpng:1.2
	>=media-libs/libsdl2-2.0.2
	>=media-libs/glew-1.10.0:0/1.10
	>=media-libs/libvorbis-1.3.2
	>=net-libs/webkit-gtk-2.4.8:2
	>=net-misc/curl-7.35.0
"

src_prepare() {
	# Fix path in launcher script
	sed -i "s:/usr/share/games/$PN:/usr/libexec:" usr/bin/$PN

	# Add missing trailing semicolon to .desktop MimeType entry
	sed -i '/MimeType=/{/;$/!{s/$/;/}}' usr/share/applications/${PN}.desktop

	eapply_user
}

src_install() {
	dobin usr/bin/$PN
	dodoc usr/share/doc/$PN/*

	exeinto /usr/libexec
	doexe usr/share/games/$PN/runescape

	insinto /usr/share/applications
	doins usr/share/applications/${PN}.desktop

	insinto /usr/share/icons
	doins -r usr/share/icons/hicolor

	if use kde ; then
		insinto /usr/share/kde4
		doins -r usr/share/kde4/services
	fi
}
