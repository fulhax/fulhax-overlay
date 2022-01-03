# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit meson git-r3

DESCRIPTION="Pulseaudio command line mixer"
HOMEPAGE="https://github.com/cdemoulins/pamixer"
EGIT_REPO_URI="https://github.com/cdemoulins/pamixer.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/boost
		media-sound/pulseaudio"
RDEPEND="${DEPEND}"

src_configure() {
	meson_src_configure
}
