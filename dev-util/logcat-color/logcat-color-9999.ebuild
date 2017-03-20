EAPI=5

PYTHON_COMPAT=( python{2_7,3_4} )

EGIT_REPO_URI="git://github.com/marshall/logcat-color.git"
PYTHON_DEPEND="2"

inherit eutils distutils-r1 git-2

DESCRIPTION="A colorful and highly configurable alternative to the standard \"adb logcat\" command from the Android SDK"
HOMEPAGE="https://github.com/marshall/logcat-color"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND="dev-python/colorama"
DEPEND="${RDEPEND}"
