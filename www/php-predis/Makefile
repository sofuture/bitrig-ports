# $OpenBSD: Makefile,v 1.10 2012/04/03 08:44:07 dcoppa Exp $

COMMENT =		PHP client library for the Redis key-value database

DISTNAME =		Predis-0.7.2
PKGNAME =		${DISTNAME:S/^P/php-p/}
CATEGORIES =		www databases

HOMEPAGE =		http://wiki.github.com/nrk/predis

MAINTAINER =		David Coppa <dcoppa@openbsd.org>

# MIT
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MASTER_SITES =		http://pear.nrk.io/get/
EXTRACT_SUFX =		.tgz

MODULES =		lang/php

NO_BUILD =		Yes
NO_REGRESS =		Yes
PKG_ARCH =		*

PREFIX =		/var/www
INSTDIR =		${PREFIX}/pear/lib/
SUBST_VARS =		INSTDIR

do-install:
	${INSTALL_DATA_DIR} ${INSTDIR}
	cp -Rp ${WRKSRC}/lib/Predis ${INSTDIR}
	chown -R ${SHAREOWN}:${SHAREGRP} ${INSTDIR}

.include <bsd.port.mk>
