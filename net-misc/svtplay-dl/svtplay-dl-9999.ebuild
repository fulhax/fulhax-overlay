# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4} )

inherit eutils distutils-r1 git-r3

DESCRIPTION="Small command-line program to download videos from \
	svtplay.se/tv4play.se/tv3play.se/tv8play.se/tv6play.se/viaplay.se/aftonbladet"
HOMEPAGE="https://github.com/spaam/svtplay-dl"
EGIT_REPO_URI="git://github.com/spaam/svtplay-dl.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND="
	>=media-video/rtmpdump-2.4
	dev-python/pycrypto
	dev-python/requests
"
RDEPEND="${DEPEND}"
