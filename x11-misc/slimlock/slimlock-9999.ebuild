# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/dunst/dunst-1.0.0-r1.ebuild,v 1.1 2014/05/08 05:59:22 wired Exp $

EAPI=5

inherit eutils git-2

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
