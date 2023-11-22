# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit font git-r3

DESCRIPTION="a small , clear bitmap font with good support latin-script languages and Hebrew"
HOMEPAGE="https://github.com/ninjaaron/bitocra"
EGIT_REPO_URI="https://github.com/ninjaaron/bitocra.git"

LICENSE="SIL Open Font License"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86"
IUSE=""

FONT_S="${WORKDIR}/${P}"
FONT_SUFFIX="bdf"
