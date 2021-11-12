# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_OPTIONAL=1
PYTHON_COMPAT=( python3_{8,9,10} )

inherit distutils-r1

DESCRIPTION="A lightweight, multi-platform, multi-architecture CPU emulator framework based on QEMU"
HOMEPAGE="https://www.unicorn-engine.org"


SRC_URI="https://github.com/unicorn-engine/unicorn/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"

IUSE="debug python static_libs"

RDEPEND="
	python? ( ${PYTHON_DEPS} )
"
DEPEND="${RDEPEND}"

REQUIRED_USE="
	python? ( ${PYTHON_REQUIRED_USE} )
"

wrap_python() {
	if use python; then
		pushd bindings/python >/dev/null || die
		distutils-r1_${1} "$@"
		popd >/dev/null || die
	fi
}

src_prepare() {
	default
	wrap_python ${FUNCNAME}
}

src_configure() {
	local config_mk='config.mk'
	local config_mk_old='config.mk.old'
	mv ${config_mk} ${config_mk_old}

	if ! use debug; then
		sed 's/UNICORN_DEBUG ?.*/UNICORN_DEBUG ?= no/' ${config_mk_old} > ${config_mk} || die
	fi

	mv ${config_mk} ${config_mk_old}

	if ! use static_libs; then
		sed 's/UNICORN_STATIC ?.*/UNICORN_STATIC ?= no/' ${config_mk_old} > ${config_mk} || die
	fi

	rm ${config_mk_old}

	wrap_python ${FUNCNAME}
}

src_compile() {
	emake
	wrap_python ${FUNCNAME}
}

src_install() {
	emake DESTDIR="${D}" LIBDIRARCH=lib64 install
	wrap_python ${FUNCNAME}
}
