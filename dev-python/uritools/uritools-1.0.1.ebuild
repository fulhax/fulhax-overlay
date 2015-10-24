# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_{6,7} )

inherit distutils-r1

DESCRIPTION="RFC 3986 compliant, Unicode-aware, scheme-agnostic replacement for urlparse"
HOMEPAGE="https://github.com/tkem/uritools"
SRC_URI="https://pypi.python.org/packages/source/u/${PN}/${PN}-${PV}.tar.gz"

LICENSE="APACHE"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
