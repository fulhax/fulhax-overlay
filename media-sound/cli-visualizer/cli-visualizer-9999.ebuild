EAPI=6

inherit git-r3

EGIT_REPO_URI="git://github.com/dpayne/cli-visualizer.git"

DESCRIPTION="CLI based audio visualizer"
HOMEPAGE="https://github.com/dpayne/cli-visualizer"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="debug pulseaudio"

RDEPEND="
	pulseaudio? ( media-sound/pulseaudio )
	>=sci-libs/fftw-3.0
	>=sys-libs/ncurses-5.0
"
DEPEND="${RDEPEND}"

src_compile() {
	if [ use 'pulseaudio' ]; then
		make ENABLE_PULSE=1 
	else
		make
	fi
}

src_install() {
	dobin build/vis
}
