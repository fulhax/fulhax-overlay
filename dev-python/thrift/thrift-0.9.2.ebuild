# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_{6,7} )

inherit distutils-r1

DESCRIPTION="Python bindings for the Apache Thrift RPC system"
HOMEPAGE="https://thrift.apache.org/"
SRC_URI="https://pypi.python.org/packages/source/t/${PN}/${PN}-${PV}.tar.gz"

LICENSE="APACHE"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
