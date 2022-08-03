# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit git-r3

DESCRIPTION="A colorful wrapper for terminal programs"
HOMEPAGE="https://github.com/jeekl/cope"
SRC_URI=""
EGIT_REPO_URI="git://github.com/lotrfan/cope.git"

LICENSE="GPL-2 Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-perl/Class-Inspector
	dev-perl/Module-Install
	dev-perl/File-ShareDir
	dev-perl/List-MoreUtils
	dev-perl/Params-Util
	dev-perl/Regexp-Common
	dev-perl/Regexp-IPv6
	dev-perl/Env-Path
	dev-perl/IO-Stty
	dev-perl/IO-Tty
"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch ${FILESDIR}/${PV}-remove_no_experimental_warnings.diff
}

src_compile() {
	perl Makefile.PL INSTALLDIRS=vendor
	emake
}

src_install() {
	emake DESTDIR="${D}" install
	mv cope_path.pl cope_path
	dobin cope_path
}
