EAPI=5

PYTHON_COMPAT=( python{2_7,3_4} )

ESVN_REPO_URI="http://pylast.googlecode.com/svn/trunk/"
PYTHON_DEPEND="2"

inherit eutils distutils-r1 subversion

DESCRIPTION="a python interface to last.fm"
HOMEPAGE="http://code.google.com/p/pylast/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND=""
DEPEND="${RDEPEND}"
