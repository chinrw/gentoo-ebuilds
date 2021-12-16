# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools multilib-minimal

DESCRIPTION="Kernel coredump file access"
HOMEPAGE="https://github.com/ptesarik/libkdumpfile/"
SRC_URI="https://github.com/ptesarik/libkdumpfile/archive/refs/tags/v${PV}.tar.gz"

LICENSE="|| ( GPL-2+ LGPL-3+ )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="sys-libs/zlib[${MULTILIB_USEDEP}]
	dev-libs/lzo[${MULTILIB_USEDEP}]
	app-arch/snappy[${MULTILIB_USEDEP}]
"
DEPEND="${RDEPEND}"

BDEPEND="
	sys-devel/autoconf
	sys-devel/automake
	sys-devel/libtool
	sys-devel/gcc
	sys-libs/glibc
	virtual/pkgconfig
"

src_prepare() {
	default

	eautoreconf
}

src_configure() {
	multilib-minimal_src_configure
}

multilib_src_configure() {
	ECONF_SOURCE="${S}" econf
}
