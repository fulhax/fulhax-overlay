# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils git-r3

DESCRIPTION="SLiM + slock = slimlock"
HOMEPAGE="https://github.com/joelburget/slimlock"
EGIT_REPO_URI="https://github.com/dannyn/slimlock"

LICENSE="GNU-2"
SLOT="0"
KEYWORDS="**"
IUSE=""

CDEPEND="
	x11-libs/libX11
	media-libs/imlib2
	media-libs/freetype
"

DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"
