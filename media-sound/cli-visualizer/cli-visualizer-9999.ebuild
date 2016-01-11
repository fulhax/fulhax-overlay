EAPI=5

inherit git-r3

EGIT_REPO_URI="git://github.com/dpayne/cli-visualizer.git"

DESCRIPTION="CLI based audio visualizer"
HOMEPAGE="https://github.com/dpayne/cli-visualizer"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND="
	>=sci-libs/fftw-3.0
	>=sys-libs/ncurses-5.0
"
DEPEND="${RDEPEND}"
