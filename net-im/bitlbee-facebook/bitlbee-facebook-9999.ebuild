# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Facebook protocol plugin for BitlBee"
HOMEPAGE="https://github.com/jgeboski/bitlbee-facebook"

EGIT_REPO_URI="git://github.com/jgeboski/bitlbee-facebook.git"

inherit eutils git-2

LICENSE="GPL2"
SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="net-im/bitlbee"
RDEPEND="${DEPEND}"
