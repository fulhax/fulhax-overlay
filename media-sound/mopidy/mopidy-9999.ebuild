EAPI=5
EGIT_REPO_URI="git://github.com/mopidy/mopidy.git"
EGIT_PATCHES="${FILESDIR}/install.patch"
PYTHON_DEPEND="2"

inherit eutils distutils git-2

# EGIT_MASTER="develop"
# EGIT_BRANCH="develop"

EGIT_MASTER="master"
EGIT_BRANCH="master"
EGIT_HAS_SUBMODULES="of course!"

DESCRIPTION="MPD server for Spotify service."
HOMEPAGE="http://www.mopidy.com/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND="=media-libs/pyspotify-9999
	 =dev-python/pykka-9999
	 =media-libs/pylast-9999
	 >=www-servers/tornado-3.1.1
	 dev-python/gst-python:0.10
	 media-libs/gst-plugins-bad:0.10
	 media-libs/gst-plugins-good:0.10
     media-libs/gst-plugins-ugly:0.10
	 media-plugins/gst-plugins-meta:0.10"
DEPEND="${RDEPEND}"

src_install() {
  distutils_src_install
  make_desktop_entry "${PN}" "Mopidy Music Server" "audio-x-generic" \
    "AudioVideo;Audio;Player;ConsoleOnly;" "Terminal=true"
}
