# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="A modern flat theme with a combination of light and dark elements."
HOMEPAGE="https://numixproject.org"
SRC_URI="https://github.com/numixproject/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk2 gtk3"

DEPEND="dev-ruby/sass"
RDEPEND=""

S=${WORKDIR}

src_prepare() {
	cd ${P}
	make
}

src_install() {
	local folders=
	use gtk2 && folders+=" gtk-2.0 metacity-1"
	use gtk3 && folders+=" gtk-3.0 gtk-3.20 unity"

	insinto /usr/share/themes/numix
	for j in ${folders} ; do
		doins -r ${P}/${j} || die
	done
}
