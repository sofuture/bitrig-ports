# $OpenBSD: Makefile,v 1.143 2012/04/23 07:34:43 ajacoutot Exp $

SHARED_ONLY=	Yes

COMMENT-main=	multi-platform graphical toolkit
COMMENT-docs=	gtk+2 documentation
COMMENT-cups=	gtk+2 CUPS print backend
COMMENT-guic=	gtk+ icon theme caching utility

V=		2.24.10
DISTNAME=	gtk+-${V}

PKGNAME-main=	gtk+2-${V}
PKGNAME-docs=	gtk+2-docs-${V}
PKGNAME-cups=	gtk+2-cups-${V}
PKGNAME-guic=	gtk-update-icon-cache-${V}

CATEGORIES=	x11 devel

SHARED_LIBS +=  gdk-x11-2.0          2400.0   # 2400.0
SHARED_LIBS +=  gtk-x11-2.0          2400.0   # 2400.0
SHARED_LIBS +=  gailutil             26.0     # 18.1

HOMEPAGE=	http://www.gtk.org/

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# LGPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += ffi gdk_pixbuf-2.0 gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += gthread-2.0 m pcre png z

MASTER_SITES=	${MASTER_SITE_GNOME:=sources/gtk+/${V:C/^([0-9]+\.[0-9]+).*/\1/}/}
EXTRACT_SUFX=	.tar.xz

MULTI_PACKAGES=	-main -docs -cups -guic

MODULES=	devel/gettext \
		lang/python

RUN_DEPENDS-main= ${RUN_DEPENDS} \
		${BASE_PKGPATH},-guic \
		x11/hicolor-icon-theme \
		misc/shared-mime-info

LIB_DEPENDS-main= ${LIB_DEPENDS} \
		devel/glib2>=2.28.8 \
		devel/pango>=1.28.4p0 \
		devel/atk>=2.0.0p0 \
		graphics/gdk-pixbuf2>=2.22.1p0

WANTLIB-main += ${WANTLIB} c pthread glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB-main += gio-2.0 pango-1.0 pangocairo-1.0 pangoft2-1.0 atk-1.0
WANTLIB-main += GL X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB-main += Xi Xinerama Xrandr Xrender Xxf86vm cairo drm expat
WANTLIB-main += fontconfig freetype pixman-1 pthread-stubs stdc++ xcb
WANTLIB-main += xcb-render xcb-shm png

# python is only used by gtk-builder-convert, so let's not enforce the
# dependency
MODPY_BUILDDEP=	No
MODPY_RUNDEP=	No

BUILD_DEPENDS=	devel/gobject-introspection

LIB_DEPENDS-docs= # empty
RUN_DEPENDS-docs= # empty
WANTLIB-docs +=	# empty
PKG_ARCH-docs=	*

RUN_DEPENDS-cups= ${RUN_DEPENDS}
LIB_DEPENDS-cups= ${LIB_DEPENDS} \
		print/cups \
		STEM->=${V}:${BASE_PKGPATH},-main
WANTLIB-cups += ${WANTLIB}
WANTLIB-cups += asn1 atk-1.0 crypto gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB-cups += gssapi krb5 pango-1.0 pangocairo-1.0 pangoft2-1.0 png
WANTLIB-cups += ssl cups gdk-x11-2.0 gdk_pixbuf-2.0 gtk-x11-2.0
WANTLIB-cups += GL X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB-cups += Xi Xinerama Xrandr Xrender Xxf86vm cairo drm expat
WANTLIB-cups += fontconfig freetype pixman-1 pthread-stubs stdc++ xcb
WANTLIB-cups += xcb-render xcb-shm

RUN_DEPENDS-guic= ${RUN_DEPENDS} \
		x11/hicolor-icon-theme
LIB_DEPENDS-guic= graphics/gdk-pixbuf2
WANTLIB-guic += ${WANTLIB}
WANTLIB-guic += c pthread

USE_GMAKE=	Yes
USE_LIBTOOL=	Yes
REGRESS_IS_INTERACTIVE= x11

CONFIGURE_STYLE= gnu
CONFIGURE_ENV=	CPPFLAGS="-I${X11BASE}/include/freetype2/ \
			-I${LOCALBASE}/include \
			-I${LOCALBASE}/include/libpng" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	${CONFIGURE_SHARED} \
		--disable-gtk-doc \
		--enable-introspection \
		--with-xinput \
		--disable-papi

FAKE_FLAGS=	sysconfdir=${PREFIX}/share/examples/gtk+2

pre-configure:
	perl -pi -e 's,/usr/bin/env python,${MODPY_BIN},' \
		${WRKSRC}/gtk/gtk-builder-convert

.include <bsd.port.mk>
