# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils multilib unpacker

DESCRIPTION="GPU stress-testing tool from the developers of Heaven Benchmark"
HOMEPAGE="http://unigine.com/products/valley/"
SRC_URI="Unigine_Valley-${PV}.run"
LICENSE="valley-benchmark.pdf"

SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE=""

RESTRICT="strip"

DEPEND="app-admin/chrpath"
RDEPEND="
	media-libs/openal
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	dev-qt/qtwebkit:4
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXinerama
	x11-libs/libXrandr
	x11-libs/libXrender
"

S=${WORKDIR}

pkg_nofetch() {
	einfo "Please download '${SRC_URI}' from:"
	einfo "'http://unigine.com/products/valley/download/'"
	einfo "and move it to '${DISTDIR}'"
}

src_unpack() {
	unpack_makeself
}

src_install() {
	if [ "${ARCH}" = "amd64" ] ; then
		XARCH="x64"
	else
		XARCH="x86"
	fi

	# removing RPATH to avoid security checks faults
	chrpath -d bin/browser_${XARCH}
	chrpath -d bin/valley_${XARCH}

	insinto "/opt/${PN}"
	doins -r data documentation

	insinto "/opt/${PN}/bin"
	doins bin/browser_${XARCH}
	doins bin/valley_${XARCH}
	doins bin/libAppStereo_${XARCH}.so
	doins bin/libAppSurround_${XARCH}.so
	doins bin/libAppWall_${XARCH}.so
	doins bin/libGPUMonitor_${XARCH}.so
	doins bin/libUnigine_${XARCH}.so

	local module
	for module in Core Gui Network WebKit Xml; do
		dosym /usr/$(get_libdir)/qt4/libQt${module}.so.4 /opt/${PN}/bin/libQt${module}Unigine_${XARCH}.so.4
	done

	# fixing permissions
	fperms 0755 "/opt/${PN}/bin/browser_${XARCH}"
	fperms 0755 "/opt/${PN}/bin/valley_${XARCH}"

	doicon "${FILESDIR}"/${PN}.png
	make_wrapper valley "./browser_${XARCH} -config /opt/valley/data/launcher/launcher.xml" /opt/valley/bin /opt/valley/bin
	make_desktop_entry valley "Valley Benchmark"
}

pkg_postinst() {
	ewarn "Please make sure you have"
	ewarn "1) Installed proprietary x11 drivers, like ATI ones or NVIDIA"
	ewarn "2) Selected it with 'eselect opengl'"
	ewarn "Otherwise you will get OpenGL error"
}
