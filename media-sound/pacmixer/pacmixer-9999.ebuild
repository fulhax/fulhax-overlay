# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="an alsamixer alike for PulseAudio."
HOMEPAGE="https://github.com/KenjiTakahashi/pacmixer"
EGIT_REPO_URI="git://github.com/KenjiTakahashi/pacmixer.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="**"

DEPEND="sys-libs/ncurses
	media-sound/pulseaudio
	gnustep-base/gnustep-base
	sys-devel/gcc[objc]"
RDEPEND="${DEPEND}"

src_install() {
	dobin pacmixer
}
