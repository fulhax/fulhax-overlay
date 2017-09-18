EAPI=5

PYTHON_COMPAT=( python2_7 )

EGIT_REPO_URI="git://github.com/pylast/pylast.git"

inherit eutils distutils-r1 git-2

DESCRIPTION="A Python interface to Last.fm and Libre.fm"
HOMEPAGE="https://github.com/pylast/pylast"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND=""
DEPEND="${RDEPEND}"
