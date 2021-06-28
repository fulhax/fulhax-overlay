# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3

DESCRIPTION="A command-line fuzzy finder written in Go"
HOMEPAGE="https://github.com/junegunn/fzf"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~*"
IUSE="zsh-completion bash-completion screen fish-completion"

DEPEND="dev-lang/go sys-libs/ncurses"
RDEPEND="bash-completion? ( >=app-shells/bash-4 )
	zsh-completion? ( app-shells/zsh )
	fish-completion? ( app-shells/fish )
	screen? ( app-misc/tmux )"

PACKAGENAME="github.com/junegunn/fzf"
GO_PN="src/${PACKAGENAME}"
EGIT_REPO_URI="https://github.com/junegunn/fzf"
EGIT_CHECKOUT_DIR="${S}/src/${GOPN}"

export GOPATH="${S}"

src_prepare(){
	# http://gowithconfidence.tumblr.com/post/63648535238/effective-production-management-for-go
	go get -v -d github.com/junegunn/fzf/... || die
}

src_compile() {
	go install -v ${PACKAGENAME}/... || die
}

src_install(){
	dobin ${S}/bin/fzf
	
	if use screen ; then 
		dobin ${GO_PN}/bin/fzf-tmux
	fi

	if use zsh-completion ; then
		insinto /etc/profile.d
		newins ${GO_PN}/shell/key-bindings.zsh fzf.zsh
	fi

	if use bash-completion ; then 
		insinto /etc/profile.d
		newins ${GO_PN}/shell/completion.bash fzf.sh 

		insinto /usr/share/bash-completion/completions
		newins ${GO_PN}/shell/completion.bash fzf.bash 
	fi
		
	if use fish-completion ; then
		insinto /etc/profile.d
		newins  ${GO_PN}/shell/key-bindings.fish fzf.fish
	fi
	
	doman ${GO_PN}/man/man1/fzf.1
	dodoc ${GO_PN}/README.md
}
