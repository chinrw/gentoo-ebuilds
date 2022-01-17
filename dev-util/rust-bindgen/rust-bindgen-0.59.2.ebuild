# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick-0.7.15
	ansi_term-0.11.0
	atty-0.2.14
	bitflags-1.2.1
	cexpr-0.6.0
	cfg-if-1.0.0
	clang-sys-1.2.0
	clap-2.33.3
	diff-0.1.12
	either-1.6.1
	env_logger-0.9.0
	getrandom-0.2.3
	glob-0.3.0
	hermit-abi-0.1.19
	humantime-2.1.0
	lazy_static-1.4.0
	lazycell-1.3.0
	libc-0.2.98
	libloading-0.7.0
	log-0.4.14
	memchr-2.3.4
	minimal-lexical-0.1.4
	nom-7.0.0
	peeking_take_while-0.1.2
	ppv-lite86-0.2.10
	proc-macro2-1.0.28
	quote-1.0.9
	rand-0.8.4
	rand_chacha-0.3.1
	rand_core-0.6.3
	rand_hc-0.3.1
	redox_syscall-0.2.9
	regex-1.4.6
	regex-syntax-0.6.25
	remove_dir_all-0.5.3
	rustc-hash-1.1.0
	shlex-1.0.0
	strsim-0.8.0
	tempfile-3.2.0
	termcolor-1.1.2
	textwrap-0.11.0
	unicode-width-0.1.8
	unicode-xid-0.2.2
	vec_map-0.8.2
	version_check-0.9.3
	wasi-0.10.2+wasi-snapshot-preview1
	which-4.2.1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="Automatically generates Rust FFI bindings to C and C++ libraries."
HOMEPAGE="https://rust-lang.github.io/rust-bindgen"
SRC_URI="https://github.com/rust-lang/rust-bindgen/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz $(cargo_crate_uris)"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	sys-devel/clang
	virtual/rust
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	cargo_src_install
	einstalldocs
}
