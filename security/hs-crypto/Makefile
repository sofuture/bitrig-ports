# $OpenBSD: Makefile,v 1.14 2011/09/16 11:41:38 espie Exp $

COMMENT =	Haskell cryptographic library
CATEGORIES =	security

DISTNAME =	Crypto-4.2.1
# Historically named with a lower case `c'.
PKGNAME =	${DISTNAME:S,C,hs-c,}
REVISION =	6
HOMEPAGE =	http://www.haskell.org/crypto/

MAINTAINER =	Matthias Kilian <kili@openbsd.org>

# 3 different licenses from 3 authors: BSD, GPL, BSD-ish
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MODULES =		lang/ghc
MODGHC_BUILD =		cabal hackage haddock register
RUN_DEPENDS =		devel/hs-HUnit \
			devel/hs-QuickCheck>=2
BUILD_DEPENDS =		${RUN_DEPENDS}

do-regress:
.for t in HMACTest QuickTest RSATest SHA1Test SymmetricTest WordListTest
	cd ${WRKBUILD} && ./dist/build/$t/$t
.endfor

.include <bsd.port.mk>
