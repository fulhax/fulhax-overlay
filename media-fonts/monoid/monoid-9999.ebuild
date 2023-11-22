# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit font

DESCRIPTION="Customisable coding font with alternates, ligatures and contextual positioning. Crazy crisp at 12px/9pt."
HOMEPAGE="http://larsenwork.com/monoid/"
SRC_URI="https://cdn.rawgit.com/larsenwork/monoid/94d4a3d3c645e80c5bd4d751437ddbb371a54ead/Monoid.zip"

LICENSE="MIT and Monoisome is OFL license"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/unzip"

S=${WORKDIR}
FONT_S="${S}"
FONT_SUFFIX="ttf"
