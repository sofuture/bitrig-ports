# $OpenBSD: Makefile,v 1.9 2011/09/16 09:24:51 espie Exp $

COMMENT =		DrIFT with pugs-specific rules

DISTNAME =		pugs-DrIFT-2.2.3.1
REVISION =		6
CATEGORIES =		devel
HOMEPAGE =		http://pugscode.org/

# BSD3
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB =		c gmp m pthread util

MODULES =		lang/ghc converters/libiconv
MODGHC_BUILD =		cabal hackage haddock register

BUILD_DEPENDS =		${RUN_DEPENDS}
RUN_DEPENDS =		devel/hs-HsSyck \
			devel/hs-mtl \
			devel/hs-stm

.include <bsd.port.mk>
