# $OpenBSD: Makefile,v 1.10 2011/12/27 21:16:56 kili Exp $

COMMENT =		tools to build Gtk2Hs

DISTNAME =		gtk2hs-buildtools-0.12.0
REVISION =		1
CATEGORIES =		devel

HOMEPAGE =		http://www.haskell.org/gtk2hs/

MAINTAINER =		Matthias Kilian <kili@openbsd.org>

# GPL2
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB =		c gmp m pthread util

MODULES =		lang/ghc converters/libiconv

MODGHC_BUILD =		cabal hackage nort

BUILD_DEPENDS =		devel/alex \
			devel/happy

LIB_DEPENDS =		devel/gmp

.include <bsd.port.mk>
