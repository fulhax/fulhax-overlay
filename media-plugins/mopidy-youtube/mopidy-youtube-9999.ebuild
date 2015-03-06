# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Mopidy extension that plays sound from Youtube"
HOMEPAGE="https://github.com/dz0ny/mopidy-youtube"

EGIT_REPO_URI="git://github.com/dz0ny/mopidy-youtube.git"
PYTHON_DEPEND="2"

inherit eutils distutils git-2

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="
=media-sound/mopidy-9999
=dev-python/pafy-9999
"
RDEPEND="${DEPEND}"

src_install() {
	distutils_src_install
}