EAPI=5

PYTHON_COMPAT=( python2_7 )

EGIT_REPO_URI="git://github.com/trehn/termdown.git"


inherit eutils distutils-r1 git-r3

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
