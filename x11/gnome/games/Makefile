# $OpenBSD: Makefile,v 1.59 2012/04/28 10:52:09 ajacoutot Exp $

BROKEN= 		update needs fixed clutter/Mesa

COMMENT=		collection of games for the GNOME desktop

GNOME_PROJECT=		gnome-games
GNOME_VERSION=		2.32.1

REVISION=		7

SHARED_LIBS +=  games-support-gi          0.0 # 0.0

CATEGORIES=		games

HOMEPAGE=		http://live.gnome.org/GnomeGames/

# GPLv2/GDFLv1.1
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

EXTRACT_SUFX=		.tar.bz2

WANTLIB += GL ICE SM X11 Xau Xcomposite Xcursor Xdamage rsvg-2
WANTLIB += Xdmcp Xext Xfixes Xi Xinerama Xrandr Xrender Xxf86vm guile
WANTLIB += atk-1.0 c cairo canberra canberra-gtk clutter-glx-1.0
WANTLIB += croco-0.6 xcb-shm drm expat fontconfig freetype
WANTLIB += gdk-x11-2.0 gdk_pixbuf-2.0 gio-2.0 glib-2.0 gmodule-2.0
WANTLIB += gmp gobject-2.0 gthread-2.0 gtk-x11-2.0 json-glib-1.0
WANTLIB += ltdl m ogg pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre
WANTLIB += pixman-1 png pthread pthread-stubs stdc++ vorbis vorbisfile
WANTLIB += xcb xcb-render xml2 z clutter-gtk-0.10

MODULES=		devel/gconf2 \
			devel/gettext \
			lang/python \
			x11/gnome

BUILD_DEPENDS=		devel/gobject-introspection
#			x11/gnome/py-gnome-desktop
LIB_DEPENDS=		graphics/clutter/clutter-gtk \
			lang/guile \
			x11/gnome/librsvg \
			audio/libcanberra,-gtk
RUN_DEPENDS=		multimedia/gstreamer-0.10/plugins-good
#			x11/gnome/py-gnome-desktop
REGRESS_DEPENDS=	devel/check

MODGNOME_TOOLS= 	goi yelp

MODGNOME_DESKTOP_FILE=	Yes
MODGNOME_ICON_CACHE=	Yes
MODGCONF2_SCHEMAS_DIR=	gnome-games

CONFIGURE_ARGS+= 	--with-scores-group="games"

# XXX
# lightsoff and swell-foop need seed
CONFIGURE_ARGS+=	--enable-omitgames=lightsoff,swell-foop

USE_GROFF =		Yes

REGRESS_IS_INTERACTIVE= x11

FAKE_FLAGS=		scoredir=${PREFIX}/share/gnome-games/scores/

pre-configure:
	${SUBST_CMD} ${WRKSRC}/configure ${WRKSRC}/glchess/src/glchess.in.in \
		${WRKSRC}/gnome-sudoku/src/gnome-sudoku.in.in \
		${WRKSRC}/glchess/gnuchess/book.h

.include <bsd.port.mk>
