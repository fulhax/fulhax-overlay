# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit autotools

if [[ ${PV} == 99999999 ]] ; then
	# live ebuild
	inherit git-r3
	EGIT_REPO_URI="https://github.com/neomutt/neomutt.git"
	EGIT_CHECKOUT_DIR="${WORKDIR}/neomutt-${P}"
	KEYWORDS=""
else
	SRC_URI="https://github.com/${PN}/${PN}/archive/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Teaching an Old Dog New Tricks"
HOMEPAGE="https://www.neomutt.org/"
IUSE="berkdb crypt debug doc gdbm gnutls gpg idn imap kerberos libressl mbox nls nntp notmuch pop qdbm sasl selinux sidebar slang smime smtp ssl tokyocabinet"
SLOT="0"
LICENSE="GPL-2"
CDEPEND="
	app-misc/mime-types
	nls? ( virtual/libintl )
	tokyocabinet?  ( dev-db/tokyocabinet )
	!tokyocabinet? (
		qdbm?  ( dev-db/qdbm )
		!qdbm? (
			gdbm?  ( sys-libs/gdbm )
			!gdbm? ( berkdb? ( >=sys-libs/db-4:= ) )
		)
	)
	imap?    (
		gnutls?  ( >=net-libs/gnutls-1.0.17 )
		!gnutls? (
			ssl? (
				!libressl? ( >=dev-libs/openssl-0.9.6:0 )
				libressl? ( dev-libs/libressl )
			)
		)
		sasl?    ( >=dev-libs/cyrus-sasl-2 )
	)
	kerberos? ( virtual/krb5 )
	pop?     (
		gnutls?  ( >=net-libs/gnutls-1.0.17 )
		!gnutls? (
			ssl? (
				!libressl? ( >=dev-libs/openssl-0.9.6:0 )
				libressl? ( dev-libs/libressl )
			)
		)
		sasl?    ( >=dev-libs/cyrus-sasl-2 )
	)
	smtp?     (
		gnutls?  ( >=net-libs/gnutls-1.0.17 )
		!gnutls? (
			ssl? (
				!libressl? ( >=dev-libs/openssl-0.9.6:0 )
				libressl? ( dev-libs/libressl )
			)
		)
		sasl?    ( >=dev-libs/cyrus-sasl-2 )
	)
	idn?     ( net-dns/libidn )
	gpg?     ( >=app-crypt/gpgme-0.9.0 )
	smime?   (
		!libressl? ( >=dev-libs/openssl-0.9.6:0 )
		libressl? ( dev-libs/libressl )
	)
	notmuch? ( net-mail/notmuch )
	slang? ( sys-libs/slang )
	!slang? ( >=sys-libs/ncurses-5.2:0 )
"
DEPEND="${CDEPEND}
	net-mail/mailbase
	doc? (
		dev-libs/libxml2
		dev-libs/libxslt
		app-text/docbook-xsl-stylesheets
		|| ( www-client/lynx www-client/w3m www-client/elinks )
	)"
RDEPEND="${CDEPEND}
	selinux? ( sec-policy/selinux-mutt )
	!mail-client/mutt
"

# github prefixes with project name
S="${WORKDIR}/neomutt-${P}"

src_prepare() {
	eapply_user

	# many patches touch the buildsystem, we always need this
	AT_M4DIR="m4" eautoreconf

	# the configure script contains some "cleverness" whether or not to setgid
	# the dotlock program, resulting in bugs like #278332
	sed -i -e 's/@DOTLOCK_GROUP@//' \
		Makefile.in || die "sed failed"
}

src_configure() {
	local myconf=(
		"$(use_enable crypt pgp)"
		"$(use_enable debug)"
		"$(use_enable doc)"
		"$(use_enable gpg gpgme)"
		"$(use_enable imap)"
		"$(use_enable nls)"
		"$(use_enable nntp)"
		"$(use_enable pop)"
		"$(use_enable sidebar)"
		"$(use_enable smime)"
		"$(use_enable smtp)"
		"$(use_enable notmuch)"
		"$(use_with idn)"
		"$(use_with kerberos gss)"
		"--with-$(use slang && echo slang || echo curses)=${EPREFIX}/usr"
		"--enable-compressed"
		"--enable-external-dotlock"
		"--enable-nfs-fix"
		"--sysconfdir=${EPREFIX}/etc/${PN}"
		"--with-docdir=${EPREFIX}/usr/share/doc/${PN}-${PVR}"
		"--with-regex"
		"--with-exec-shell=${EPREFIX}/bin/sh"
	)

	if [[ ${CHOST} == *-solaris* ]] ; then
		# arrows in index view do not show when using wchar_t
		myconf+=( "--without-wc-funcs" )
	fi

	# mutt prioritizes gdbm over bdb, so we will too.
	# hcache feature requires at least one database is in USE.
	local hcaches=(
		"tokyocabinet"
		"qdbm"
		"gdbm"
		"berkdb:bdb"
	)
	local ucache hcache lcache
	for hcache in "${hcaches[@]}" ; do
		if use ${hcache%%:*} ; then
			ucache=${hcache}
			break
		fi
	done
	if [[ -n ${ucache} ]] ; then
		myconf+=( "--enable-hcache" )
	else
		myconf+=( "--disable-hcache" )
	fi
	for hcache in "${hcaches[@]}" ; do
		[[ ${hcache} == ${ucache} ]] \
			&& myconf+=( "--with-${hcache#*:}" ) \
			|| myconf+=( "--without-${hcache#*:}" )
	done

	# there's no need for gnutls, ssl or sasl without socket support
	if use pop || use imap || use smtp ; then
		if use gnutls; then
			myconf+=( "--with-gnutls" )
		elif use ssl; then
			myconf+=( "--with-ssl" )
		fi
		# not sure if this should be mutually exclusive with the other two
		myconf+=( "$(use_with sasl)" )
	else
		myconf+=(
			"--without-gnutls"
			"--without-ssl"
			"--without-sasl"
		)
	fi

	if use mbox; then
		myconf+=( "--with-mailpath=${EPREFIX}/var/spool/mail" )
	else
		myconf+=( "--with-homespool=Maildir" )
	fi

	econf "${myconf[@]}" || die "configure failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"

	# A newer file is provided by app-misc/mime-types. So we link it.
	rm "${ED}"/etc/${PN}/mime.types
	dosym /etc/mime.types /etc/${PN}/mime.types

	# A man-page is always handy, so fake one
	if use !doc; then
		emake -C doc DESTDIR="${D}" muttrc.man || die
		# make the fake slightly better, bug #413405
		sed -e 's#@docdir@/manual.txt#http://www.neomutt.org/doc/devel/manual.html#' \
			-e 's#in @docdir@,#at http://www.neomutt.org/,#' \
			-e "s#@sysconfdir@#${EPREFIX}/etc/${PN}#" \
			-e "s#@bindir@#${EPREFIX}/usr/bin#" \
			doc/mutt.man > mutt.1
		doman mutt.1
	else
		# nuke manpages that should be provided by an MTA, bug #177605
		rm "${ED}"/usr/share/man/man5/{mbox,mmdf}.5 \
			|| ewarn "failed to remove files, please file a bug"
	fi

	for f in "${ED}"/usr/share/locale/*/LC_MESSAGES/mutt.mo ; do
		mv "${f}" "${f%/*}/mutt.mo"
	done

	if use !prefix ; then
		fowners root:mail /usr/bin/mutt_dotlock
		fperms g+s /usr/bin/mutt_dotlock
	fi

	dodoc BEWARE COPYRIGHT ChangeLog NEWS OPS* PATCHES README* TODO
}
