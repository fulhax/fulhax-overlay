# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="Flat GTK 2/3 theme"
HOMEPAGE="http://gnome-look.org/content/show.php/FlatStudio?content=154296"
SRC_URI="http://gnome-look.org/CONTENT/content-files/154296-${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk2 gtk3"

DEPEND=""
RDEPEND="gtk2? ( x11-themes/murrine-themes )
	gtk3? ( >=x11-libs/gtk+-3.4:3 x11-themes/gtk-engines-unico )"

S=${WORKDIR}

src_install() {
	local folders=
	use gtk2 && folders+=" gtk-2.0 metacity-1"
	use gtk3 && folders+=" gtk-3.0 unity"

	for i in FlatStudio* ; do
		insinto /usr/share/themes/${i}
		for j in ${folders} ; do
			doins -r ${i}/${j} || die
		done
	done
}
