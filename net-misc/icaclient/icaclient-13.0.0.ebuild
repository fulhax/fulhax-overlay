# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit multilib eutils rpm 

DESCRIPTION="ICA Client for Citrix Presentation servers"
HOMEPAGE="http://www.citrix.com/"
SRC_URI="amd64? ( ICAClient-13.0.0.256735-0.x86_64.rpm )
x86? ( ICAClient-13.0.0.256735-0.i386.rpm )"

LICENSE="icaclient"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="nsplugin linguas_de linguas_es linguas_fr linguas_ja linguas_zh_CN"
RESTRICT="mirror strip userpriv fetch"

ICAROOT="/opt/Citrix/ICAClient"

QA_TEXTRELS="opt/Citrix/ICAClient/VDSCARD.DLL
	opt/Citrix/ICAClient/TW1.DLL
	opt/Citrix/ICAClient/NDS.DLL
	opt/Citrix/ICAClient/CHARICONV.DLL
	opt/Citrix/ICAClient/PDCRYPT1.DLL
	opt/Citrix/ICAClient/VDCM.DLL
	opt/Citrix/ICAClient/libctxssl.so
	opt/Citrix/ICAClient/PDCRYPT2.DLL
	opt/Citrix/ICAClient/npica.so
	opt/Citrix/ICAClient/VDSPMIKE.DLL
	opt/Citrix/ICAClient/VDFLASH2.DLL
	opt/Citrix/ICAClient/lib/libavutil.so
	opt/Citrix/ICAClient/lib/libavcodec.so
	opt/Citrix/ICAClient/lib/libavformat.so
	opt/Citrix/ICAClient/lib/libswscale.so"

QA_EXECSTACK="opt/Citrix/ICAClient/wfica
	opt/Citrix/ICAClient/libctxssl.so"

RDEPEND="x11-terms/xterm
	media-fonts/font-adobe-100dpi
	media-fonts/font-misc-misc
	media-fonts/font-cursor-misc
	media-fonts/font-xfree86-type1
	media-fonts/font-misc-ethiopic
	x86? (
		x11-libs/libXp
		x11-libs/libXaw
		x11-libs/libX11
		x11-libs/libSM
		x11-libs/libICE
		x11-libs/libXinerama
	)
	amd64? (
		|| (
			(
				x11-libs/libXp[abi_x86_32]
				x11-libs/libXaw[abi_x86_32]
				x11-libs/libX11[abi_x86_32]
				x11-libs/libSM[abi_x86_32]
				x11-libs/libICE[abi_x86_32]
				x11-libs/libXinerama[abi_x86_32]
			)
			>=app-emulation/emul-linux-x86-xlibs-20110129
		)
		>=app-emulation/emul-linux-x86-soundlibs-20110928
		>=app-emulation/emul-linux-x86-gtklibs-20110928
		nsplugin? ( www-plugins/nspluginwrapper )
	)"
DEPEND=""
S="${WORKDIR}${ICAROOT}"

pkg_nofetch() {
	elog "Download the client RPM file ${SRC_URI} from
	https://www.citrix.com/downloads/citrix-receiver/legacy-receiver-for-linux/receiver-for-linux-130.html"
	elog "and place it in ${DISTDIR:-/usr/portage/distfiles}."
}

src_install() {
	dodir "${ICAROOT}"

	exeinto "${ICAROOT}"
	doexe *.DLL libctxssl.so libproxy.so FlashContainer.bin wfica AuthManagerDaemon PrimaryAuthManager selfservice ServiceRecord

	exeinto "${ICAROOT}"/lib
	doexe lib/*.so

	exeinto "${ICAROOT}"
	if use nsplugin
	then
		doexe npica.so
		dosym "${ICAROOT}"/npica.so /usr/lib32/nsbrowser/plugins/npica.so
	fi

	insinto "${ICAROOT}"
	doins nls/en/eula.txt

	insinto "${ICAROOT}"/config
	doins config/* config/.* nls/en/*.ini

	insinto "${ICAROOT}"/gtk
	doins gtk/*

	insinto "${ICAROOT}"/gtk/glade
	doins gtk/glade/*

	dodir "${ICAROOT}"/help

	insinto "${ICAROOT}"/config/usertemplate
	doins config/usertemplate/*

	LANGCODES="en"
	use linguas_de && LANGCODES="${LANGCODES} de"
	use linguas_es && LANGCODES="${LANGCODES} es"
	use linguas_fr && LANGCODES="${LANGCODES} fr"
	use linguas_ja && LANGCODES="${LANGCODES} ja"
	use linguas_zh_CN && LANGCODES="${LANGCODES} zh_CN"

	for lang in ${LANGCODES}; do
		insinto "${ICAROOT}"/nls/${lang}
		doins nls/${lang}/*

		insinto "${ICAROOT}"/nls/$lang/UTF-8
		doins nls/${lang}.UTF-8/*

		insinto "${ICAROOT}"/nls/${lang}/LC_MESSAGES
		doins nls/${lang}/LC_MESSAGES/*

		insinto "${ICAROOT}"/nls/${lang}
		dosym UTF-8 "${ICAROOT}"/nls/${lang}/utf8
	done

	insinto "${ICAROOT}"/nls
	dosym en /opt/Citrix/ICAClient/nls/C

	insinto "${ICAROOT}"/icons
	doins icons/*

	insinto "${ICAROOT}"/keyboard
	doins keyboard/*

	rm -rf "${S}"/keystore/cacerts
	dosym /etc/ssl/certs "${ICAROOT}"/keystore/cacerts
	#insinto "${ICAROOT}"/keystore/cacerts
	#doins keystore/cacerts/*

	insinto "${ICAROOT}"/util
	doins util/pac.js

	exeinto "${ICAROOT}"/util
	doexe util/{configmgr,conncenter,DeleteCompleteFlashCache.sh,echo_cmd,gst_aud_play,gst_aud_read,hdxcheck.sh,icalicense.sh,integrate.sh}
	doexe util/{new_store.sh,nslaunch,pacexec,pnabrowse,sunraymac.sh,what,xcapture}

	# Citrix receiver 13 has util/gst_{play,read}.{32,64} versions, install both
	doexe util/gst_{play,read}.{32,64}
	# Ditto for libgstflatstm.so
	doexe util/libgstflatstm.{32,64}.so

	dosym "${ICAROOT}"/util/integrate.sh "${ICAROOT}"/util/disintegrate.sh

	doenvd "${FILESDIR}"/10ICAClient

	make_wrapper wfica "${ICAROOT}"/wfica . "${ICAROOT}"

	dodir /etc/revdep-rebuild/
	echo "SEARCH_DIRS_MASK="${ICAROOT}"" > "${D}"/etc/revdep-rebuild/70icaclient
}

pkg_postinst() {
	if use amd64 && use nsplugin; then
		einfo
		einfo "To use the browser plugin with a 64-bit browser, run"
		einfo "#  nspluginwrapper -i /usr/lib32/nsbrowser/plugins/npica.so"
		einfo ""
	fi
}
