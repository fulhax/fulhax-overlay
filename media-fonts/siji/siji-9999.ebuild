# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit font git-r3

DESCRIPTION="Systemd of iconic fonts"
HOMEPAGE="https://github.com/gstk/siji"
EGIT_REPO_URI="https://github.com/gstk/siji.git"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86"
IUSE=""

FONT_S="${WORKDIR}/${P}/pcf"
FONT_SUFFIX="pcf"
