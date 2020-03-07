# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

DESCRIPTION="Mopidy extension for playing music from Spotify"
HOMEPAGE="https://github.com/mopidy/mopidy-spotify"

EGIT_REPO_URI="git://github.com/mopidy/mopidy-spotify.git"

inherit eutils distutils-r1 git-r3

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="=media-sound/mopidy-9999"
RDEPEND="${DEPEND}"

src_install() {
	distutils-r1_src_install
}
