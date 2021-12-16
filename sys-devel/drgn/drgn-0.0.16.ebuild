# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

DESCRIPTION="Programmable debugger"
HOMEPAGE="https://github.com/osandov/drgn"
SRC_URI="https://github.com/osandov/drgn/archive/refs/tags/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="kdump"

RDEPEND="
	${PYTHON_DEPS}
	app-arch/xz-utils
	sys-apps/gawk
	sys-libs/zlib
	virtual/libelf
	kdump? ( dev-libs/libkdumpfile )
"

DEPEND="${RDEPEND}"

BDEPEND="
	app-arch/xz-utils
	sys-devel/autoconf
	sys-devel/automake
	sys-devel/gcc
	sys-devel/libtool
	sys-devel/make
	virtual/pkgconfig
"
