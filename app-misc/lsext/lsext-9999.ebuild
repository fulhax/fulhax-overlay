EAPI=8

[[ ${PV} == *9999 ]] && SCM="git-r3"
inherit cmake ${SCM}

DESCRIPTION="An ncurses mixer for PulseAudio inspired by pavucontrol."
HOMEPAGE="https://github.com/c0r73x/lsext"

if [[ ${PV} == *9999 ]]; then
    EGIT_REPO_URI="https://github.com/c0r73x/lsext.git"
else
    SRC_URI="https://github.com/c0r73x/lsext/archive/${PV}.tar.gz \
        -> ${P}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

CDEPEND="
	dev-libs/re2
	dev-libs/iniparser
	dev-libs/libgit2
"

DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"

CMAKE_USE_DIR="${S}/src/"
