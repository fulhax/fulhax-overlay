# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_{6,7} python3_{4,5} )

inherit distutils-r1

DESCRIPTION="https://github.com/michael-lazar/mailcap_fix"
HOMEPAGE="A patched mailcap module that conforms to RFC 1524"
SRC_URI="https://github.com/michael-lazar/${PN}/archive/v${PV}.tar.gz"

LICENSE="UNLICENSE"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
