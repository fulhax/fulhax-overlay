# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/dunst/dunst-1.0.0-r1.ebuild,v 1.1 2014/05/08 05:59:22 wired Exp $

EAPI=5

inherit eutils git-r3

DESCRIPTION="lightweight and customizable notification daemon"
HOMEPAGE="http://dunst-project.org"
EGIT_REPO_URI="git://github.com/dunst-project/dunst.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="**"
IUSE="dunstify wordexp"

CDEPEND="
	dev-libs/glib:2
	dev-libs/libxdg-basedir
	sys-apps/dbus
	x11-libs/libXScrnSaver
	x11-libs/libXft
	x11-libs/libXinerama
	x11-libs/cairo[X,glib]
	x11-libs/pango[X]
	dunstify? ( x11-libs/libnotify )
"

DEPEND="${CDEPEND}
		dev-lang/perl
		virtual/pkgconfig"

RDEPEND="${CDEPEND}"

src_prepare() {
	# Remove nasty CFLAGS which override user choice
	sed -ie "/^CFLAGS/ {
		s:-g::
		s:-O.::
	}" config.mk || die "sed failed"

	if ! use dunstify; then
		# don't build dunstify: it pulls in deps but is not being installed
		sed -ie "/^all:/ s:dunstify::" Makefile || die "sed failed"
	fi

	if use wordexp; then
		epatch "${FILESDIR}"/dunst_wordexp.patch
	fi

	epatch_user
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
}
