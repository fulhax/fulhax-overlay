# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

DESCRIPTION="Mopidy extension for controlling Mopidy through the MPRIS D-Bus interface"
HOMEPAGE="https://www.mopidy.com/"

EGIT_REPO_URI="git://github.com/mopidy/mopidy-mpris.git"

inherit eutils distutils-r1 git-2

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="
	=media-sound/mopidy-9999
	>=dev-python/pykka-1.1
	>=dev-python/dbus-python-1.2
"
RDEPEND="${DEPEND}"

src_install() {
	distutils-r1_src_install
}
