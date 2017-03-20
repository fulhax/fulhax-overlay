EAPI=5

PYTHON_COMPAT=( python{2_7,3_4} )

EGIT_REPO_URI="git://github.com/trehn/termdown.git"
PYTHON_DEPEND="2"

inherit eutils distutils-r1 git-2

DESCRIPTION="Countdown timer and stopwatch in your terminal"
HOMEPAGE="https://github.com/trehn/termdown"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND="
	dev-python/pyfiglet
"
DEPEND="${RDEPEND}"
