EAPI=5

PYTHON_COMPAT=( python{2_7,3_4} )

EGIT_REPO_URI="git://github.com/pwaller/pyfiglet.git"
PYTHON_DEPEND="2"

inherit eutils distutils-r1 git-2

DESCRIPTION="An implementation of figlet written in python "
HOMEPAGE="https://github.com/pwaller/pyfiglet"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND=""
DEPEND="${RDEPEND}"
