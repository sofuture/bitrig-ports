# $OpenBSD: Makefile,v 1.37 2011/11/01 20:30:49 jasper Exp $

COMMENT=		vector graphics library

DISTNAME=		cairo-1.10.2
REVISION=		3
SHARED_LIBS=		cairo 11.1
SHARED_LIBS+=		cairo-trace 0.0
SHARED_LIBS+=		cairo-gobject 0.0
SHARED_LIBS+=		cairo-script-interpreter 0.0
CATEGORIES=		graphics

HOMEPAGE=		http://cairographics.org/introduction

MAINTAINER=		Eric Faurot <eric@openbsd.org>

WANTLIB=		GL X11 Xau Xdamage Xdmcp Xext Xfixes Xrender \
			Xxf86vm drm expat fontconfig freetype glib-2.0 \
			gobject-2.0 gthread-2.0 m pcre pixman-1 png \
			pthread-stubs xcb xcb-render xcb-shm z ffi stdc++

# LGPLv2.1 / MPL 1.1
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=		http://cairographics.org/releases/

MODULES=		devel/gettext

USE_LIBTOOL=		Yes
USE_GMAKE=		Yes

LIB_DEPENDS=		graphics/png \
			devel/glib2

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV=		PTHREAD_LIBS="-pthread"
CONFIGURE_ARGS=		--enable-gl \
			--enable-tee \
			--enable-xml \
			--enable-xcb --enable-trace=yes --enable-pthread=yes

REGRESS_DEPENDS=	print/ghostscript/gnu

.include <bsd.port.mk>

.for i in ${GCC2_ARCHS}
. if ${MACHINE_ARCH} == $i
PATCH_LIST=	patch-* gcc2-patch-*
. endif
.endfor
