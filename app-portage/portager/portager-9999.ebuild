EAPI=8

# Dziedziczymy git-r3 (pobieranie z gita) oraz desktop (ikony/menu)
inherit git-r3 desktop

DESCRIPTION="Professional Terminal-free Package Manager for Gentoo"
HOMEPAGE="https://github.com/finskidomek"

# Zamiast linku do paczki tar.gz, podajemy bezpośredni adres repozytorium gita
EGIT_REPO_URI="https://github.com/finskidomek/portager.git"

LICENSE="GPL-3"
SLOT="0"

# W wersjach 9999 keywords zostawia się puste, by system wiedział, że to wersja testowa
KEYWORDS=""

RDEPEND="
    dev-qt/qtbase:6[widgets]
    app-portage/eix
    app-portage/gentoolkit
    app-admin/sudo
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_compile() {
    emake
}
src_install() {
    # 1. Instalacja programu binarnego do /usr/bin/
    dobin portager

    # 2. Instalacja ikony do /usr/share/icons/hicolor/...
    doicon "${S}/portager.png"

    # 3. Instalacja pliku menu do /usr/share/applications/
    domenu "${S}/portager.desktop"

    # 4. Instalacja pliku tła do globalnego folderu /usr/share/portager/
    insinto /usr/share/portager
    doins "${S}/background.png"
}
