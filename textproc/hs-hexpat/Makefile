# $OpenBSD: Makefile,v 1.9 2011/09/16 11:41:40 espie Exp $

COMMENT =		XML parser/formatter based on expat

DISTNAME =		hexpat-0.19.5
REVISION =		2
CATEGORIES =		textproc

MAINTAINER =		Jim Razmus II <jim@openbsd.org>

# BSD3
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MODULES =		lang/ghc

MODGHC_BUILD =		cabal hackage haddock register

RUN_DEPENDS +=		devel/hs-List \
			devel/hs-deepseq \
			devel/hs-text \
			devel/hs-transformers
BUILD_DEPENDS +=	${RUN_DEPENDS}

.include <bsd.port.mk>
