# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Mopidy-Local-SQLite is a Mopidy local library extension that uses an SQLite database for keeping track of your local media."
HOMEPAGE="https://github.com/tkem/mopidy-local-sqlite"

EGIT_REPO_URI="git://github.com/tkem/mopidy-local-sqlite.git"
PYTHON_DEPEND="2"

inherit eutils distutils git-2

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="=media-sound/mopidy-9999"
RDEPEND="${DEPEND}"

src_install() {
	distutils_src_install
}
