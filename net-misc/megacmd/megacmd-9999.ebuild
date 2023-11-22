# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools
if [[ -z ${PV%%*9999} ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/meganz/${PN}.git"
	EGIT_SUBMODULES=( '*' )
	DEPEND=""
else
	inherit vcs-snapshot
	MY_PV="23b1acb"
	[[ -n ${PV%%*_p*} ]] && MY_PV="${PV}"
	SRC_URI="
		mirror://githubcl/meganz/${PN}/tar.gz/${MY_PV}
		-> ${P}.tar.gz
	"
	RESTRICT="primaryuri"
	KEYWORDS="~amd64 ~x86"
	DEPEND="net-misc/meganz-sdk[-megacmd(-),sodium(+),sqlite]"
fi

DESCRIPTION="Command Line Interactive and Scriptable Application to access MEGA"
HOMEPAGE="https://mega.nz/cmd"

LICENSE="BSD-2"
SLOT="0"
IUSE=""

DEPEND="$DEPEND
	dev-libs/libpcre:3[cxx]
	sys-libs/readline:0
"
RDEPEND="
	${DEPEND}
"
DOCS=( README.md build/megacmd/megacmd.changes )

src_prepare() {
	autoreconf -fiv
	default
	eautoreconf
}
