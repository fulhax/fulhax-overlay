# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_{6,7} )

inherit python-single-r1 subversion

DESCRIPTION="Checker to make sure a C++ file follows Google's C++ style guide"
HOMEPAGE="https://code.google.com/p/google-styleguide"
ESVN_REPO_URI="http://google-styleguide.googlecode.com/svn/trunk/${PN}"

LICENSE="cpplint"
SLOT="0"
KEYWORDS=""
IUSE="test"

src_test() {
	einfo "Running ${EPYTHON} cpplint_unittest.py"
	${EPYTHON} cpplint_unittest.py --verbose \
		|| die "cpplint_unittest.py failed"
}

src_install() {
	python_doscript cpplint.py

	dodoc README
}
