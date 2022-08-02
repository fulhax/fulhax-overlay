EAPI=8

[[ ${PV} == *9999 ]] && SCM="git-r3"
inherit cmake-multilib ${SCM}

DESCRIPTION="An ncurses mixer for PulseAudio inspired by pavucontrol."
HOMEPAGE="https://github.com/fulhax/ncpamixer"

if [[ ${PV} == *9999 ]]; then
    EGIT_REPO_URI="https://github.com/fulhax/ncpamixer.git"
else
    SRC_URI="https://github.com/fulhax/ncpamixer/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="media-sound/pulseaudio sys-libs/ncurses[unicode]"
DEPEND="dev-util/cmake ${RDEPEND}"
IUSE="+wide"

CMAKE_USE_DIR="${S}/src/"

src_configure() {
	local mycmakeargs=(
		$(cmake-multilib_use_use wide)
	)

	cmake-multilib_src_configure
}
