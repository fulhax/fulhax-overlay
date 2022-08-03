# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit git-r3

PYTHON_VERSION=3

DESCRIPTION="cli and curses mixer for pulseaudio "
HOMEPAGE="https://github.com/GeorgeFilipkin/pulsemixer"
EGIT_REPO_URI="git://github.com/GeorgeFilipkin/pulsemixer.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="**"

DEPEND="media-sound/pulseaudio"
RDEPEND="${DEPEND}"

src_install() {
	dobin pulsemixer
}
