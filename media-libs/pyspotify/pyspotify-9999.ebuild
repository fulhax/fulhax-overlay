EAPI=5

PYTHON_COMPAT=( python2_7 )

EGIT_REPO_URI="git://github.com/mopidy/pyspotify.git"

EGIT_MASTER="v2.x/master"
EGIT_BRANCH="v2.x/master"
# EGIT_HAS_SUBMODULES="of course!"

inherit eutils flag-o-matic distutils-r1 git-r3

DESCRIPTION="libspotify for Python"
HOMEPAGE="http://www.mopidy.com/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND=">=media-libs/libspotify-0.0.7
	 >=dev-python/gst-python-0.10"
DEPEND="${RDEPEND}"

#src_unpack() {
#  git_src_unpack
#  mv "${S}"/pyspotify/* "${S}"
#  rm -f "${S}"/src/spotify/api.h
#}
