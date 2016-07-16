# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 git-r3

DESCRIPTION="HTTP/2 State-Machine based protocol implementation"
HOMEPAGE="http://python-hyper.org/h2/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/python-hyper/hyper-${PN}.git"
EGIT_COMMIT="v${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}
	dev-python/hyperframe
	dev-python/hpack"
RDEPEND="${DEPEND}"
