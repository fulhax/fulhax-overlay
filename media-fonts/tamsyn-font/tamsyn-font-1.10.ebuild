# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit font

DESCRIPTION="A set of monospaced bitmap programming fonts"
HOMEPAGE="http://www.fial.com/~scott/tamsyn-font/"
SRC_URI="http://www.fial.com/~scott/${PN}/download/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86"
IUSE=""

FONT_S="${WORKDIR}/${P}"
FONT_SUFFIX="pcf"
