# $OpenBSD: Makefile,v 1.44 2012/03/29 06:38:37 ajacoutot Exp $

SHARED_ONLY=	Yes

COMMENT=	keyboard configuration library

GNOME_PROJECT=	libgnomekbd
GNOME_VERSION=	3.4.0.2

SHARED_LIBS +=  gnomekbd             7.0      # 7.0
SHARED_LIBS +=  gnomekbdui           7.0      # 7.0

CATEGORIES=		devel

# LGPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += GL X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender Xxf86vm atk-1.0 c cairo
WANTLIB += cairo-gobject drm expat fontconfig freetype gdk-3 gdk_pixbuf-2.0
WANTLIB += gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 gthread-2.0
WANTLIB += gtk-3 m pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre
WANTLIB += pixman-1 png pthread pthread-stubs xcb xcb-render xcb-shm
WANTLIB += xkbfile xklavier xml2 z ffi stdc++

MODULES=	devel/gettext \
		x11/gnome \
		devel/dconf

MODGNOME_TOOLS= goi

LIB_DEPENDS=	x11/gnome/libxklavier \
		x11/gtk+3

MODGNOME_DESKTOP_FILE=	Yes

MODGNOME_CPPFLAGS=	-I${X11BASE}/include

.include <bsd.port.mk>
