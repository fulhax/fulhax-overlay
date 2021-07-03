# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN=OpenXR-SDK
inherit cmake

if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/KhronosGroup/${MY_PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/KhronosGroup/${MY_PN}/archive/release-${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}"/${MY_PN}-${PV}
fi

DESCRIPTION="OpenXR loader"
HOMEPAGE="https://github.com/KhronosGroup/OpenXR-SDK"

LICENSE="Apache-2.0"
SLOT="0"

BDEPEND=">=dev-util/cmake-3.10.2"
DEPEND="
	media-libs/vulkan-loader
	x11-libs/libxcb
	x11-libs/xcb-util-keysyms
	x11-libs/libXrandr
	x11-libs/libXxf86vm
	media-libs/mesa
"
