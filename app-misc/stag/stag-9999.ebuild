# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit git-r3

DESCRIPTION="Stag generates a streaming bar graph inside the terminal from the data passed through stdin."
HOMEPAGE="https://github.com/seenaburns/stag"
EGIT_REPO_URI="https://github.com/seenaburns/stag.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="**"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake
}
