# wins

EAPI=8

PYTHON_COMPAT=( pypy3 python3_{10..13} )
inherit python-r1

DESCRIPTION="Work Instructions Reader and Displayer"
HOMEPAGE=""

EPYTHON="python3.12"

SRC_URI="https://github.com/velladecin/wins/archive/v${PV}.tar.gz -> wins-v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="karel test"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RESTRICT="!test? ( test )"

DEPEND=">=dev-lang/python-3.10.0"
RDEPEND="${DEPEND}"
# this fails as python-3.20.39 does not exist yet (Nov 2024)
# USE="karel" emerge -av1 vv-app/wins
# 'karel' must be in IUSE above
BDEPEND="karel? ( >=dev-lang/python-3.20.39 )"

src_compile() {
	elog "src_compile() ${WORKDIR}/${P}"
}

src_install() {
	elog "src_install(): fist attempt :)"
	python_scriptinto /usr/bin
	python_newscript wins wins

	dodoc README.md
}
