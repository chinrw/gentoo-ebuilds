# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8


inherit cmake git-r3

EGIT_REPO_URI="https://github.com/WebAssembly/wabt.git"

DESCRIPTION="The WebAssembly Binary Toolkit"
HOMEPAGE="https://github.com/WebAssembly/wabt"

LICENSE="Apache-2.0"
KEYWORDS="~amd64"
SLOT="0"
IUSE="test"

src_prepare() {
	git checkout ${PV} || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs
	if ! use test; then
		mycmakeargs=(
			-DBUILD_TESTS="OFF"
		)
	fi
	cmake_src_configure
}

src_test() {
	test/run-tests.py || die
}
