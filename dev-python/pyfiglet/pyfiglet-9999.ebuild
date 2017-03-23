EAPI=5

PYTHON_COMPAT=( python2_7 )

EGIT_REPO_URI="git://github.com/pwaller/pyfiglet.git"

inherit eutils distutils-r1 git-2

DESCRIPTION="An implementation of figlet written in python "
HOMEPAGE="https://github.com/pwaller/pyfiglet"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND=""
DEPEND="${RDEPEND}"
