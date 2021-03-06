# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DIST_AUTHOR=CERNEY
DIST_VERSION=1.23
inherit perl-module virtualx

DESCRIPTION="Create and manipulate tables in Perl + Tk"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~sparc ~x86"
IUSE=""

DEPEND="dev-perl/Tk"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${PN}-1.23-makemaker.patch" )

src_install() {
	perl-module_src_install

	# Clean out stray conflicting file - its generated by perl-tk already.
	# Bug 169294
	rm	"${D}"/${VENDOR_ARCH}/auto/Tk/pTk/extralibs.ld || die
}

src_test() {
	virtx perl-module_src_test
}
