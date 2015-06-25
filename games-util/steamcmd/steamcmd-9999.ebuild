# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit games

DESCRIPTION="SteamCMD"
HOMEPAGE="https://developer.valvesoftware.com/wiki/SteamCMD"
SRC_URI="http://media.steampowered.com/client/steamcmd_linux.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror strip"

RDEPEND=""

GAMES_USER="steam"
dir=${GAMES_PREFIX_OPT}/${GAMES_USER}/${PN}
GAMES_PREFIX=${GAMES_PREFIX_OPT}/${GAMES_USER}

src_install() {
	insinto "${dir}"
	doins -r * || die "doins failed"
	fperms +x "${dir}"/linux32/steamcmd || die "fperms failed"
	fperms +x "${dir}"/steam.sh || die "fperms failed"
	fperms +x "${dir}"/steamcmd.sh || die "fperms failed"

	prepgamesdirs
}
