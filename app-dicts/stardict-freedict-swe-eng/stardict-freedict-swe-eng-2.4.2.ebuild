# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

FROM_LANG="Swedish"
TO_LANG="English"
DICT_PREFIX=""

inherit stardict

HOMEPAGE="http://stardict.sourceforge.net/Dictionaries_dictd-www.freedict.de.php"

KEYWORDS="amd64 ppc sparc x86"
IUSE=""
SRC_URI="http://abloz.com/huzheng/stardict-dic/freedict.de/${P}.tar.bz2"
S="${WORKDIR}/${P}"

DEPEND=""
RDEPEND=""
