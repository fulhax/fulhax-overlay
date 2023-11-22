EAPI=8

[[ ${PV} == *9999 ]] && SCM="git-r3"
inherit ${SCM}

DESCRIPTION="The Comprehensive Kerbal Archive Network"
HOMEPAGE="https://github.com/KSP-CKAN/CKAN"
if [[ ${PV} == *9999 ]]; then
	EGIT_REPO_URI="https://github.com/KSP-CKAN/CKAN.git"
else
    SRC_URI="https://github.com/KSP-CKAN/CKAN/archive/v${PV}.tar.gz \
        -> ${P}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	dev-lang/mono
	net-misc/curl
"

DEPEND="
	dev-dotnet/xdt-for-monodevelop
	dev-dotnet/nuget
	dev-lang/python:2.7
	${RDEPEND}
"

src_prepare() {
	cd "${S}"
	eapply "${FILESDIR}/disable_version_checks.diff"

	eapply_user

	nuget restore CKAN.sln
}

src_install() {
	echo "#!/bin/sh" > "${S}/ckan"
	echo "mono /usr/share/CKAN/ckan.exe" >> "${S}/ckan"

	dobin "${S}/ckan"

	insinto /usr/share/CKAN/
	doins "${S}/ckan.exe"
}
