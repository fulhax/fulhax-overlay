EAPI=5

PYTHON_COMPAT=( python{2_7,3_4} )

EGIT_REPO_URI="git://github.com/jodal/pykka.git"
PYTHON_DEPEND="2"

inherit eutils distutils-r1 git-2

DESCRIPTION="Pykka is easy to use concurrency for Python using the actor mode."
HOMEPAGE="https://github.com/jodal/pykka"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND=""
DEPEND="${RDEPEND}"
