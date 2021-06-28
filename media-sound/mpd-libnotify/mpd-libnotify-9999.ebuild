# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3

DESCRIPTION="libnotify daemon for MPD"
HOMEPAGE="http://git.silverirc.com/cgit.cgi/mpd-libnotify.git/"
EGIT_REPO_URI="git://github.com/KittyKatt/mpd-libnotify"

LICENSE=""
SLOT="0"
KEYWORDS="**"

RDEPEND="|| ( media-sound/mpd media-sound/mopidy )
media-sound/mpc
x11-libs/libnotify
media-gfx/imagemagick"
DEPEND="${RDEPEND}"

src_install() {
	chmod +x mpdnotify
	dobin mpdnotify
	dodir /usr/share/mpd-libnotify/
	cp -R ${WORKDIR}/${P}/extras ${D}/usr/share/mpd-libnotify/
}
