# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools eutils gnome2 vala git-r3

DESCRIPTION="Terminal emulator widget"
HOMEPAGE="https://github.com/thestinger/vte-ng"

# SRC_URI="https://github.com/thestinger/${PN}/archive/${PV}-ng.zip"
SRC_URI=""
EGIT_REPO_URI="git://github.com/thestinger/vte-ng.git"
EGIT_BRANCH="${PV%%.9999}b-ng"

LICENSE="LGPL-2+"
SLOT="2.91"
IUSE="debug glade +introspection vala"
KEYWORDS=""

PDEPEND=""
RDEPEND="
	>=dev-libs/glib-2.40:2
	>=x11-libs/gtk+-3.8:3[introspection?]
	>=x11-libs/pango-1.22.0

	sys-libs/ncurses:0=
	x11-libs/libX11
	x11-libs/libXft

	glade? ( >=dev-util/glade-3.9:3.10 )
	introspection? ( >=dev-libs/gobject-introspection-0.9.0:= )
"

DEPEND="${RDEPEND}
	$(vala_depend)
	>=dev-util/gtk-doc-am-1.13
	>=dev-util/intltool-0.35
	sys-devel/gettext
	dev-util/gtk-doc
	virtual/pkgconfig
"

RDEPEND="
	${RDEPEND}
	!x11-libs/vte:2.90[glade]
	!x11-libs/vte:2.91
"

S="${WORKDIR}/vte-ng-${PV}"

src_configure() {
	gtkdocize --copy --flavour no-tmpl || die
	autoreconf --force --install --verbose || die
	intltoolize --force || die
	gnome2_src_configure \
		--disable-deprecation \
		--disable-test-application \
		--disable-static \
		$(use_enable debug) \
		$(use_enable glade glade-catalogue) \
		$(use_enable introspection) \
		$(use_enable vala)
}

src_install() {
	emake DESTDIR="${D}" install
	mv "${D}"/etc/profile.d/vte{,-${SLOT}}.sh || die
}
