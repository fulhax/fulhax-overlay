# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_{6,7} )

inherit distutils-r1

DESCRIPTION="Python 3.3's ipaddress for Python 2.6 and 2.7."
HOMEPAGE="https://github.com/phihag/ipaddress"
SRC_URI="https://pypi.python.org/packages/source/i/${PN}/${PN}-${PV}.tar.gz"

LICENSE="APACHE"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
