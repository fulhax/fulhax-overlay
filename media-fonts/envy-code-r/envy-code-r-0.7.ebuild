# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit font

DESCRIPTION="Free scalable coding font by DamienG"
HOMEPAGE="http://damieng.com/blog/tag/envy-code-r"
SRC_URI="http://download.damieng.com/fonts/original/EnvyCodeR-PR7.zip"

LICENSE="freeware"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="${DEPEND}"

S="${WORKDIR}/Envy-Code-R-PR7"
FONT_S="${S}"
FONT_SUFFIX="ttf"

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}/Envy Code R PR7" "${S}"
}
