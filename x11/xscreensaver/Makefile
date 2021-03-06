# $OpenBSD: Makefile,v 1.73 2012/01/08 15:36:26 dcoppa Exp $

COMMENT-main=		screen saver and locker for the X Window System
COMMENT-data=		graphical demos (savers) for screensavers
COMMENT-gle=		OpenGL Extrusion library support for screensaver-data

V=			5.15
DISTNAME=		xscreensaver-${V}
PKGNAME-main=		${DISTNAME}
PKGNAME-data=		xscreensaver-data-${V}
PKGNAME-gle=		xscreensaver-gle-${V}

CATEGORIES=		x11

HOMEPAGE=		http://www.jwz.org/xscreensaver/

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes

MULTI_PACKAGES=	-main -data -gle

WANTLIB=	GL GLU ICE SM X11 Xext Xmu Xpm Xt Xxf86vm c glib-2.0 \
		gmodule-2.0 gobject-2.0 m pthread gthread-2.0

WANTLIB-main=	${WANTLIB} Xau Xcomposite Xcursor Xdamage Xdmcp Xfixes \
		Xi Xinerama Xrandr Xrender Xxf86misc atk-1.0 cairo \
		expat fontconfig freetype gdk-x11-2.0 gdk_pixbuf-2.0 \
		gdk_pixbuf_xlib-2.0 gio-2.0 gtk-x11-2.0 jpeg \
		pango-1.0 pangocairo-1.0 pangoft2-1.0 pixman-1 png \
		pthread-stubs xcb xml2 z xcb-render glade-2.0 \
		drm xcb-shm

WANTLIB-data=	${WANTLIB} jpeg util gdk_pixbuf-2.0 gdk_pixbuf_xlib-2.0 \
		png z

MASTER_SITES=		${HOMEPAGE}

MODULES=		devel/gettext \
			textproc/intltool

# ${FILESDIR}/migrate-xscreensaver-config.sh needs xsltproc
BUILD_DEPENDS=		textproc/libxslt

# note that we don't need desktop-file-utils for the -data subpackage
# because the desktop files it installs are under a subdirectory of
# ${LOCALBASE}/share/applications/
RUN_DEPENDS-main=	devel/desktop-file-utils \
			x11/xscreensaver,-data

LIB_DEPENDS-main=	${MODGETTEXT_LIB_DEPENDS} \
			devel/libglade2

LIB_DEPENDS-data=	${MODGETTEXT_LIB_DEPENDS} \
			graphics/gdk-pixbuf2

USE_GMAKE=		Yes
USE_GROFF =		Yes
NO_REGRESS=		Yes

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-hackdir="${PREFIX}/libexec/xscreensaver" \
			--with-x-app-defaults="${PREFIX}/lib/X11/app-defaults"
CONFIGURE_ENV+=		CPPFLAGS="-I${LOCALBASE}/include" \
			CFLAGS="${CFLAGS} -I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib -liconv -lintl"

# License issues with graphics/gle necessitate this
PSEUDO_FLAVORS=		no_gle
FLAVOR?=		no_gle

.include <bsd.port.arch.mk>

LIB_DEPENDS-gle=	${MODGETTEXT_LIB_DEPENDS} \
			graphics/gle \
			x11/gtk+2
RUN_DEPENDS-gle=	${BUILD_PKGPATH},-data
WANTLIB-gle=		${WANTLIB} gle gdk_pixbuf-2.0 gdk_pixbuf_xlib-2.0

.if ${BUILD_PACKAGES:M-gle}
CONFIGURE_ARGS+=	--with-gle
.else
CONFIGURE_ARGS+=	--without-gle
.endif

post-extract:
	cp ${FILESDIR}/migrate-xscreensaver-config.sh ${WRKSRC}/hacks/config
	cp ${FILESDIR}/xscreensaver-config.xsl ${WRKSRC}/hacks/config

post-install:
# remove conflict on games/circuit, misc/deco
	for i in circuit deco ; do \
		mv ${PREFIX}/man/man6/$${i}.6 ${PREFIX}/man/man6/x$${i}.6 ; \
		mv ${PREFIX}/libexec/xscreensaver/$${i} \
			${PREFIX}/libexec/xscreensaver/x$${i} && \
		mv ${PREFIX}/share/xscreensaver/config/$${i}.xml \
			${PREFIX}/share/xscreensaver/config/x$${i}.xml && \
		mv ${WRKSRC}/hacks/config/$${i}.xml \
			${WRKSRC}/hacks/config/x$${i}.xml ; done
	cd ${WRKSRC}/hacks/config && \
		for i in ${WRKSRC}/hacks/config/*.xml; do \
			/bin/sh migrate-xscreensaver-config.sh $${i} ; done
# conflict with x11/gnome/screensaver and is not needed by xscreensaver per se
	rm ${WRKSRC}/hacks/config/popsquares.desktop
	${INSTALL_DATA_DIR} ${PREFIX}/share/applications/screensavers/
	${INSTALL_DATA} ${WRKSRC}/hacks/config/*.desktop \
		${PREFIX}/share/applications/screensavers/

.include <bsd.port.mk>
