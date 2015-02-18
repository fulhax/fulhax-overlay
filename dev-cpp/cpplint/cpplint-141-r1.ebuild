# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( jython2_7 pypy python2_7 )
inherit elisp-common eutils python-single-r1
RESTRICT="mirror"

SUBVERSION_REVISION="r=${PV}"
HTML_VERSION="20140908"
PY_VERSION="20141204"
TXT_VERSION="20090627"
EL_VERSION="20140929"
DESCRIPTION="The google styleguide for C++ together with a verifyer and an emacs file"
HOMEPAGE="http://code.google.com/p/google-styleguide/"
SRC_URI="http://google-styleguide.googlecode.com/svn/trunk/cpplint/cpplint.py?${SUBVERSION_REVISION} -> cpplint-${PY_VERSION}.py
	http://google-styleguide.googlecode.com/svn/trunk/cppguide.html?${SUBVERSION_REVISION} -> cpplint-${HTML_VERSION}.html
	http://google-styleguide.googlecode.com/svn/trunk/cpplint/README?${SUBVERSION_REVISION} -> cpplint-${TXT_VERSION}.txt
	emacs? ( http://google-styleguide.googlecode.com/svn/trunk/google-c-style.el?${SUBVERSION_REVISION} -> cpplint-${EL_VERSION}.el )"
LICENSE="CC-BY-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="emacs"

EMACSNAME="google-c-style"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
COMMON="emacs? ( virtual/emacs )"
DEPEND="${COMMON}"
RDEPEND="dev-lang/python
	${PYTHON_DEPS}
	${COMMON}"

S="${WORKDIR}"

src_unpack() {
	cp -- "${DISTDIR}/cpplint-${PY_VERSION}.py" cpplint.py || die
	cp -- "${DISTDIR}/cpplint-${HTML_VERSION}.html" cppguide.html || die
	cp -- "${DISTDIR}/cpplint-${TXT_VERSION}.txt" README || die
	if use emacs
	then	cp -- "${DISTDIR}/cpplint-${EL_VERSION}.el" "${EMACSNAME}.el" || die
		mkdir sitefile
		cat >"sitefile/50${EMACSNAME}-gentoo.el" <<EOF
(add-to-list 'load-path "@SITELISP@")
(autoload 'google-set-c-style "${EMACSNAME}"
  "Set the current buffer's c-style to Google C/C++ Programming
  Style. Meant to be added to \`c-mode-common-hook'." t)
(add-hook 'c-mode-common-hook 'google-set-c-style)

; If you want the RETURN key to go to the next line and space over
; to the right place, uncomment the following line
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)
EOF
	fi
}

src_prepare() {
	use prefix || sed -i \
		-e '1s"^#!/usr/bin/env python$"#!'"${EPREFIX}/usr/bin/python"'"' \
		-- "${PN}.py" || die
	python_fix_shebang "${S}"
	epatch_user
}

src_compile() {
	if use emacs
	then	elisp-compile *.el || die
	fi
}

src_install() {
	dobin cpplint.py
	dodoc README cppguide.html
	if use emacs
	then	elisp-install "${EMACSNAME}" "${EMACSNAME}".{el,elc} || die
		elisp-site-file-install "sitefile/50${EMACSNAME}-gentoo.el" "${EMACSNAME}" || die
	fi
}

pkg_postinst() {
	elisp-site-regen
}

pkg_postrm() {
	elisp-site-regen
}
