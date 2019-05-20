# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

LICENSE="OFL-1.1"
MY_PN="${PN^}${PV%.*}${LICENSE%-*}"
inherit font

DESCRIPTION="A sanserif typeface family with classical proportions"
HOMEPAGE="https://www.latofonts.com"
SRC_URI="http://www.latofonts.com/download/${MY_PN}.zip -> ${P}.zip"
RESTRICT="primaryuri"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-arch/unzip"
S="${WORKDIR}/${MY_PN}"

