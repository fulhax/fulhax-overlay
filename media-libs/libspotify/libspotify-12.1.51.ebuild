# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit multilib-minimal

DESCRIPTION="SDK/C language API for Spotify"
HOMEPAGE="https://developer.spotify.com/technologies/libspotify/"
SRC_URI="abi_x86_64? ( https://developer.spotify.com/download/${PN}/${P}-Linux-x86_64-release.tar.gz )
	abi_x86_32? ( https://developer.spotify.com/download/${PN}/${P}-Linux-i686-release.tar.gz )"

LICENSE="libspotify Boost-1.0 MIT BSD ZLIB CPOL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	declare -A abi_map
	abi_map["amd64"]="x86_64"
	abi_map["x86"]="i686"

	multilib_src_unpack() {
		# manually unpack and strip first dir
		mkdir -p "${BUILD_DIR}" || die
		tar -C "${BUILD_DIR}" \
			-x --strip-components 1 \
			-f "${DISTDIR}/${P}-Linux-${abi_map[${ABI}]}-release.tar.gz" || die
	}

	multilib_parallel_foreach_abi multilib_src_unpack
}

multilib_src_configure() {
	sed -i \
		-e "s|PKG_PREFIX|${EROOT}/usr|" \
		-e "s|/lib|/$(get_libdir)|" \
		lib/pkgconfig/libspotify.pc || die
}

src_compile() { :; }

multilib_src_install() {
	insinto /usr/$(get_libdir)
	doins lib/libspotify.so*

	insinto /usr/$(get_libdir)/pkgconfig
	doins lib/pkgconfig/libspotify.pc

	insinto /usr/include
	doins -r include/libspotify

	doman share/man*/*

	if use doc ; then
		dodoc -r share/doc/libspotify/examples/
		dohtml -r share/doc/libspotify/html/*
	fi
}
