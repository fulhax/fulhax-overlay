# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 versionator git-r3

DESCRIPTION="An interactive SSL-capable intercepting HTTP proxy"
HOMEPAGE="https://mitmproxy.org/"
EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"
EGIT_COMMIT="v${PV}"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+contentviews examples test"

#missing DEPEND/RDEPEND:
# test? coveralls
# examples? harparser
# hyperframe, hpack, h2

RDEPEND="
	contentviews? (
		>=dev-python/pyamf-0.8.0[${PYTHON_USEDEP}]
		>=dev-libs/protobuf-2.6.1-r3[${PYTHON_USEDEP}]
		>=dev-python/cssutils-1.0.1[${PYTHON_USEDEP}]
	)
	>=dev-python/enum34-1.0.4[${PYTHON_USEDEP}]
	>=dev-python/watchdog-0.8.3[${PYTHON_USEDEP}]
	>=dev-python/urwid-1.3.1[${PYTHON_USEDEP}]
	>=www-servers/tornado-4.3[${PYTHON_USEDEP}]
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/pyperclip-1.5.26[${PYTHON_USEDEP}]
	=dev-python/pyparsing-2.0.5[${PYTHON_USEDEP}]
	=dev-python/lxml-3.4.4[${PYTHON_USEDEP}]
	=dev-python/html2text-2015.11.4
	>=dev-python/configargparse-0.10.0[${PYTHON_USEDEP}]
	=dev-python/click-6.2[${PYTHON_USEDEP}]
	>=dev-python/blinker-1.4[${PYTHON_USEDEP}]
	>=dev-python/pillow-3.0.0[${PYTHON_USEDEP}] <dev-python/pillow-3.1.0[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	examples? (
		dev-python/pytz
		dev-python/beautifulsoup:4[${PYTHON_USEDEP}]
	)"
