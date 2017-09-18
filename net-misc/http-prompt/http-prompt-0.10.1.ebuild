# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="HTTPie + prompt_toolkit = an interactive command-line HTTP client featuring autocomplete and syntax highlighting"
HOMEPAGE="http://http-prompt.com/"
SRC_URI="https://github.com/eliangcs/${PN}/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/click-5.0[${PYTHON_USEDEP}]
	>=net-misc/httpie-0.9.2[${PYTHON_USEDEP}]
	>=dev-python/prompt_toolkit-0.60[${PYTHON_USEDEP}]
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/parsimonious-0.6.2[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.1.0[${PYTHON_USEDEP}]"
