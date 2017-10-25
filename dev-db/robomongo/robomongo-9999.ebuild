# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CMAKE_BUILD_TYPE=Release
inherit cmake-utils scons-utils git-r3

DESCRIPTION="Robomongo — is a shell-centric crossplatform MongoDB management tool."
HOMEPAGE="http://www.robomongo.org/"
EGIT_REPO_URI="https://github.com/paralect/robomongo.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	>dev-qt/qtcore-5
	>dev-qt/qtgui-5
	>dev-qt/qtdbus-5
	>dev-qt/qtprintsupport-5
"

RDEPEND="${DEPEND}"

S=${WORKDIR}/${P}
roboshell="${S}/src/third-party/robomongo-shell"

src_prepare() {
	# epatch "${FILESDIR}/${PN}-9999-fix-qurl.patch"

	find "${S}" -type f -iname '*.cmake' -exec \
		sed -e "s/\/lib/\/lib\/lib/" -i  {} \;

	export ROBOMONGO_CMAKE_PREFIX_PATH=$PREFIX
	git clone "https://github.com/paralect/robomongo-shell.git" \
		"$roboshell"

	cd "$roboshell"
	git checkout roboshell-v3.2

	scons_opts=(
		CC="$(tc-getCC)"
		CXX="$(tc-getCXX)"

		--disable-warnings-as-errors
		--ssl
	)

	escons "${scons_opts[@]}" mongo \
		CPPPATH=/usr/include \
		LIBPATH=/usr/lib

	eapply_user
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=Release
		-DCMAKE_PREFIX_PATH="$roboshell"
	)
	cmake-utils_src_configure
}

src_install() {
	dobin "${WORKDIR}/${P}_build/src/${PN}/${PN}" || die
}
