# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils git-2 autotools

DESCRIPTION="BitTorrent Client using libtorrent - with Pyroscope patches"
HOMEPAGE="http://libtorrent.rakshasa.no/"

EGIT_REPO_URI="git://github.com/rakshasa/rtorrent.git"

#EGIT_COMMIT="cd029a6" # 0.9.3
#EGIT_COMMIT="6a3234e" # 0.9.4

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="**"
IUSE="daemon debug ipv6 selinux test xmlrpc"

COMMON_DEPEND="=net-libs/libtorrent-9999
	>=dev-libs/libsigc++-2.2.2:2
	>=net-misc/curl-7.19.1
	sys-libs/ncurses
	dev-util/cppunit
	xmlrpc? ( dev-libs/xmlrpc-c )"
RDEPEND="${COMMON_DEPEND}
	daemon? ( app-misc/screen )
	selinux? ( sec-policy/selinux-rtorrent )
"
DEPEND="${COMMON_DEPEND}
	test? ( dev-util/cppunit )
	virtual/pkgconfig"

DOCS=( doc/rtorrent.rc )

src_prepare() {
	# bug #358271
	epatch "${FILESDIR}"/${PN}-0.9.1-ncurses.patch


	# upstream forgot to include
	cp ${FILESDIR}/rtorrent.1 ${S}/doc/ || die

	# pyroscope patches
	mkdir ${S}/pyro
	cp ${FILESDIR}/*.{cc,h} ${S}/pyro

	cp ${FILESDIR}/ps-ui_pyroscope_0.8.8.patch ${S}/pyro
	cp ${FILESDIR}/pyroscope.patch ${S}/pyro
	cp ${FILESDIR}/ui_pyroscope.patch ${S}/pyro

	sed -i ${S}/src/ui/download_list.cc \
		-e 's:rTorrent \" VERSION:rTorrent-PS \" VERSION:'
    sed -i ${S}/doc/scripts/update_commands_0.9.sed \
        -e "s:':\":g"
    sed -i ${S}/pyro/command_pyroscope.cc \
        -e 's:view_filter:view.filter:' \
        -e 's:RT_HEX_VERSION < 0x000904:RT_HEX_VERSION > 0x000904:'

	for i in ${S}/pyro/*.patch; do
		sed -f ${S}/doc/scripts/update_commands_0.9.sed -i "$i"
		patch -uNp1 -i "$i"
	done

	for i in ${S}/pyro/*.{cc,h}; do
		sed -f ${S}/doc/scripts/update_commands_0.9.sed -i "$i"
		ln -s "$i" ${S}/src
	done


	eautoreconf
}

src_configure() {
	# configure needs bash or script bombs out on some null shift, bug #291229
	CONFIG_SHELL=${BASH} econf \
		--disable-dependency-tracking \
		$(use_enable debug) \
		$(use_enable ipv6) \
		$(use_with xmlrpc xmlrpc-c)
}

src_install() {
	default
	doman doc/rtorrent.1

	if use daemon; then
		newinitd "${FILESDIR}/rtorrentd.init" rtorrentd
		newconfd "${FILESDIR}/rtorrentd.conf" rtorrentd
	fi
}
