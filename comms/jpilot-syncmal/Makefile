# $OpenBSD: Makefile,v 1.18 2011/11/04 08:21:59 jasper Exp $

SHARED_ONLY=	Yes

COMMENT=	MAL plugin for J-Pilot

DISTNAME=	jpilot-syncmal-0.81
REVISION=	3
CATEGORIES=	comms palm

HOMEPAGE=	http://www.jlogday.com/code/syncmal/

# MPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${HOMEPAGE}

WANTLIB += X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender atk-1.0 cairo expat fontconfig
WANTLIB += freetype gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += m pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre pixman-1
WANTLIB += pthread-stubs xcb z pisock>=9 mal>=1 png>=5
WANTLIB += gtk-x11-2.0>=400.13 gdk-x11-2.0>=400.13 gdk_pixbuf-2.0>=400.13
WANTLIB += GL Xxf86vm drm ffi gthread-2.0 stdc++ xcb-render xcb-shm

MODULES=	devel/gettext
RUN_DEPENDS=	comms/jpilot
LIB_DEPENDS=	comms/pilot-link \
		comms/libmal \
		graphics/png \
		x11/gtk+2

USE_LIBTOOL=	Yes
CONFIGURE_STYLE=gnu

CONFIGURE_ENV=	CPPFLAGS="-I/usr/local/include/libmal" \
		LDFLAGS="-L/usr/local/lib -pthread -lmal"
CONFIGURE_ARGS=	${CONFIGURE_SHARED} \
		--with-libmal=${LOCALBASE} \
		--enable-static \
		--enable-gtk2

.include <bsd.port.mk>
