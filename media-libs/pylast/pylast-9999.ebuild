EAPI=5

PYTHON_COMPAT=( python2_7 )

ESVN_REPO_URI="http://pylast.googlecode.com/svn/trunk/"

inherit eutils distutils-r1 subversion

DESCRIPTION="a python interface to last.fm"
HOMEPAGE="http://code.google.com/p/pylast/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND=""
DEPEND="${RDEPEND}"
