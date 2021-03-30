# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit font

DESCRIPTION="A typeface designed for source code"
HOMEPAGE="http://sourcefoundry.org/hack/"
SRC_URI="https://github.com/chrissimpkins/Hack/releases/download/v2.010/Hack-v2_010-ttf.zip"

LICENSE="SIL Open Font License"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="${DEPEND}"

S=${WORKDIR}
FONT_S="${S}"
FONT_SUFFIX="ttf"
