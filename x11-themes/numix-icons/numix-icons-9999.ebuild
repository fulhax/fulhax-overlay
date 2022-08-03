# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
inherit gnome2-utils git-r3

DESCRIPTION="Numix is the official icon theme from the Numix project."
HOMEPAGE="https://github.com/numixproject/numix-icon-theme"
EGIT_REPO_URI="https://github.com/numixproject/numix-icon-theme.git"

LICENSE="CC-BY-NC-SA-4.0"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="x11-themes/hicolor-icon-theme"

RESTRICT="binchecks strip"

src_install() {
	insinto /usr/share/icons
	doins -r *
}

pkg_preinst() { gnome2_icon_savelist; }
pkg_postinst() { gnome2_icon_cache_update; }
pkg_postrm() { gnome2_icon_cache_update; }
