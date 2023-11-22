# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit font

LICENSE="OFL-1.1"
MY_PN="${PN^}${PV%.*}${LICENSE%-*}"

DESCRIPTION="A sanserif typeface family with classical proportions"
HOMEPAGE="https://www.latofonts.com"
SRC_URI="http://www.latofonts.com/download/${MY_PN}.zip -> ${P}.zip"
RESTRICT="primaryuri"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-arch/unzip"

S="${WORKDIR}/${MY_PN}"
FONT_S="${S}"
FONT_SUFFIX="ttf"
