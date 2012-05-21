# $OpenBSD: Makefile,v 1.5 2012/05/03 07:20:42 ajacoutot Exp $

COMMENT=	easy and universal access to shared and/or personnal files

DISTNAME=	owncloud-3.0.3
EXTRACT_SUFX=	.tar.bz2

CATEGORIES=	www

HOMEPAGE=	http://owncloud.org/

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# AGPLv3 (GNU Affero Public License)
# jQuery: MIT / GPLv3
# HTTP: 3 clause BSD
# MDB2: BSD-like
# User: AGPL
# XML/RPC: MIT / PHP
# Silk icons: Creative Commons Attribution
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${HOMEPAGE}releases/

MODULES=	lang/php

NO_BUILD=	Yes
NO_REGRESS=	Yes
PKG_ARCH=	*

WRKDIST=	${WRKDIR}/owncloud

PREFIX=		/var/www
INSTDIR=	${PREFIX}/owncloud
TINSTDIR=	${TRUEPREFIX}/owncloud
SUBST_VARS=	INSTDIR TINSTDIR

RUN_DEPENDS=	archivers/pecl-zip \
		lang/php/${MODPHP_VERSION},-curl \
		lang/php/${MODPHP_VERSION},-gd

do-install:
	cp -Rp ${WRKSRC} ${INSTDIR}
	${SUBST_CMD} -c ${FILESDIR}/owncloud.conf \
		${INSTDIR}/owncloud.conf.dist
	mv ${INSTDIR}/.htaccess ${INSTDIR}/.htaccess.dist
	chown -R ${BINOWN}:${BINGRP} ${INSTDIR}

.include <bsd.port.mk>