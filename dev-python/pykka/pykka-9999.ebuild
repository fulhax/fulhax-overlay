EAPI=5

PYTHON_COMPAT=( python2_7 )

EGIT_REPO_URI="git://github.com/jodal/pykka.git"

inherit eutils distutils-r1 git-r3

DESCRIPTION="Pykka is easy to use concurrency for Python using the actor mode."
HOMEPAGE="https://github.com/jodal/pykka"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND=""
DEPEND="${RDEPEND}"
