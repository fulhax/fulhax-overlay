# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="Command-line productivity booster, offers quick access to files and directories, inspired by autojump, z and v."
HOMEPAGE="https://github.com/clvv/fasd"
SRC_URI="https://github.com/clvv/fasd/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Personal"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bash-completion zsh-completion"

RDEPEND="
	bash-completion? ( >=app-shells/bash-4 )
	zsh-completion? ( app-shells/zsh )
"
