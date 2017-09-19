# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
DESCRIPTION="Graphical development / admin tool for many popular database engines."
HOMEPAGE="http://dbeaver.jkiss.org/"
SRC_URI="https://github.com/serge-rider/dbeaver/releases/download/${PV}/dbeaver-ce-${PV}-linux.gtk.x86_64.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND=">=virtual/jre-1.7:* >=x11-libs/gtk+-2:2"
RDEPEND="${DEPEND}"
S="${WORKDIR}/dbeaver"

src_install() {
	insinto "/opt/${P}"
	exeinto "/opt/${P}"
	doins -r \
		"artifacts.xml" \
		"dbeaver.desktop" \
		"dbeaver.ini" \
		"dbeaver.png" \
		"icon.xpm" \
		"readme.txt" \
		"configuration" \
		"features" \
		"licenses" \
		"p2" \
		"plugins"
	doexe "dbeaver"
	dosym "/opt/${P}/dbeaver" "/usr/bin/dbeaver"
}
