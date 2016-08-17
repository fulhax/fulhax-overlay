EAPI=6 
inherit cmake-utils git-r3

DESCRIPTION="An ncurses mixer for PulseAudio inspired by pavucontrol."
HOMEPAGE="https://github.com/fulhax/ncpamixer" 

EGIT_REPO_URI="https://github.com/fulhax/ncpamixer.git"
EGIT_COMMIT="1.0"

LICENSE="MIT" 
SLOT="0" 
KEYWORDS="~amd64 ~x86" 
RDEPEND="media-sound/pulseaudio sys-libs/ncurses[unicode]"
DEPEND="dev-util/cmake ${RDEPEND}"
S="${WORKDIR}/${P}/src"
