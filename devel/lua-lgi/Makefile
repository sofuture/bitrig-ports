# $OpenBSD: Makefile,v 1.3 2012/05/15 15:16:29 jasper Exp $

COMMENT=	lua bindings to libraries using GObject-Introspection

DISTNAME=	lgi-0.5
PKGNAME=	lua-${DISTNAME}
REVISION=	0
CATEGORIES=	devel

HOMEPAGE=	https://github.com/pavouk/lgi

# MIT
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MODULES=	devel/gettext \
		lang/lua

WANTLIB += ffi girepository-1.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += gthread-2.0

LIB_DEPENDS=	devel/gobject-introspection

MASTER_SITES=	https://github.com/downloads/pavouk/lgi/ \
		http://distfiles.nl/

USE_GMAKE=	Yes
MAKE_ENV=	MAKE=${MAKE_PROGRAM}

REGRESS_TARGET= check

post-install:
	${INSTALL_DATA_DIR} ${MODLUA_EXAMPLEDIR}
	cd ${WRKSRC}/samples/ && umask 022 && \
		pax -rw . ${MODLUA_EXAMPLEDIR}

.include <bsd.port.mk>