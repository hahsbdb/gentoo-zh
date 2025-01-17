# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit cmake-utils xdg-utils git-r3
EGIT_REPO_URI="https://gitlab.com/fcitx/xcb-imdkit.git"

if [[ ! "${PV}" =~ (^|\.)9999$ ]]; then
	EGIT_COMMIT="b82eddb3432b25f0db4aa7db4f68c6744ad895c1"
fi
SRC_URI=""

DESCRIPTION="An implementation of xim protocol in xcb"
HOMEPAGE="https://gitlab.com/fcitx/xcb-imdkit"

LICENSE="BSD-1 GPL-2+ LGPL-2+ MIT"
SLOT="5"
KEYWORDS="~amd64"
IUSE=""
REQUIRED_USE=""

RDEPEND="x11-libs/xcb-util
    x11-libs/xcb-util-keysyms"
DEPEND="${RDEPEND}
	kde-frameworks/extra-cmake-modules:5
	virtual/pkgconfig"


src_prepare() {
	cmake-utils_src_prepare
	xdg_environment_reset
}

src_configure() {
	local mycmakeargs=(
		-DLIB_INSTALL_DIR="${EPREFIX}/usr/$(get_libdir)"
	)
	cmake-utils_src_configure
}

src_install(){
	cmake-utils_src_install
}
