EAPI=6 
inherit cmake-utils

DESCRIPTION="An ncurses mixer for PulseAudio inspired by pavucontrol."
HOMEPAGE="https://github.com/fulhax/ncpamixer" 
SRC_URI="https://github.com/fulhax/ncpamixer/archive/${PV}.tar.gz \
		 -> ${P}.tar.gz"

LICENSE="MIT" 
SLOT="0" 
KEYWORDS="amd64 x86" 

RDEPEND="media-sound/pulseaudio sys-libs/ncurses[unicode]"
DEPEND="dev-util/cmake ${RDEPEND}"

CMAKE_USE_DIR="${S}/src/"
