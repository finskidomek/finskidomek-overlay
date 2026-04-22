EAPI=8

DESCRIPTION="Professional Terminal-free Package Manager for Gentoo"
HOMEPAGE="https://github.com"
# Link do Twojego drugiego repozytorium ze źródłami
SRC_URI="https://github.com/archive/refs/heads/main.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
    dev-qt/qtbase:6[widgets]
    app-portage/eix
    app-portage/gentoolkit
    app-admin/sudo
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

# GitHub domyślnie pakuje źródła do folderu [nazwa-repo]-[branch]
S="${WORKDIR}/portager-main"

src_compile() {
    emake
}

src_install() {
    emake DESTDIR="${D}" install
}
