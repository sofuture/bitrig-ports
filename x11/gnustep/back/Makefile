# $OpenBSD: Makefile,v 1.28 2011/07/06 23:56:08 ajacoutot Exp $

COMMENT=	GNUstep gui backend

V =		0.20.1
DISTNAME=	gnustep-back-${V}
REVISION =	1

CATEGORIES=	devel

HOMEPAGE=	http://www.gnustep.org/
MASTER_SITES=	${MASTER_SITE_GNUSTEP:=core/}

MODULES=	devel/gettext x11/gnustep
MODGNUSTEP_NEEDS_BACK=	No

WANTLIB+= 	Xau Xdmcp Xft Xrender expat fontconfig pixman-1
WANTLIB+= 	png cairo pthread-stubs xcb xcb-render xcb-shm
WANTLIB+= 	Xdamage Xfixes Xxf86vm drm glib-2.0 gobject-2.0
WANTLIB+= 	gthread-2.0 freetype z GL X11 Xext Xmu Xt c m pthread

LIB_DEPENDS=	graphics/cairo

BACKENDV=	${V:C/([0-9])*[.]([0-9]*).*/\1\2/1}
SUBST_VARS=	BACKENDV

CONFIGURE_STYLE=gnu
CONFIGURE_ENV=	LDFLAGS="-L${LOCALBASE}/lib -lm"
CONFIGURE_ARGS=	--with-x \
		--disable-glitz \
		--enable-graphics=cairo

.include <bsd.port.mk>
