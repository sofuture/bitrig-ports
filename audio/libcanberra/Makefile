# $OpenBSD: Makefile,v 1.31 2012/04/28 10:52:08 ajacoutot Exp $

COMMENT-main=	implementation of the Freedesktop sound theme spec.
COMMENT-gtk=	gtk+2 helper for libcanberra
COMMENT-gtk3=	gtk+3 helper for libcanberra

V=		0.28
DISTNAME=	libcanberra-${V}

PKGNAME-main=	${DISTNAME}
PKGNAME-gtk=	libcanberra-gtk-${V}
PKGNAME-gtk3=	libcanberra-gtk3-${V}

REVISION-main=	2
REVISION-gtk=	3
REVISION-gtk3=	3

SHARED_LIBS +=  canberra             2.0      # 2.5
SHARED_LIBS +=  canberra-gtk3        1.8      # 1.8
SHARED_LIBS +=  canberra-gtk         1.0      # 1.8

CATEGORIES=	audio devel

HOMEPAGE=	http://0pointer.de/lennart/projects/libcanberra/

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# LGPLv2.1
PERMIT_PACKAGE_CDROM=   Yes
PERMIT_PACKAGE_FTP=     Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=   Yes

MASTER_SITES=	${HOMEPAGE}

cWANTLIB += ltdl m ogg vorbis vorbisfile

WANTLIB-main += ${cWANTLIB} sndio

WANTLIB-gtk += ${cWANTLIB} ${MODGETTEXT_WANTLIB}
WANTLIB-gtk += GL X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB-gtk += Xi Xinerama Xrandr Xrender Xxf86vm atk-1.0 cairo canberra
WANTLIB-gtk += drm expat ffi fontconfig freetype gdk-x11-2.0 gdk_pixbuf-2.0
WANTLIB-gtk += gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 gthread-2.0
WANTLIB-gtk += gtk-x11-2.0 pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre
WANTLIB-gtk += pixman-1 png pthread-stubs xcb xcb-render xcb-shm z stdc++

WANTLIB-gtk3 += ${cWANTLIB} ${MODGETTEXT_WANTLIB}
WANTLIB-gtk3 += GL X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB-gtk3 += Xi Xinerama Xrandr Xrender Xxf86vm atk-1.0 c cairo
WANTLIB-gtk3 += cairo-gobject canberra drm expat ffi fontconfig freetype
WANTLIB-gtk3 += gdk-3 gdk_pixbuf-2.0 gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB-gtk3 += gthread-2.0 gtk-3 pango-1.0 pangocairo-1.0 pangoft2-1.0
WANTLIB-gtk3 += pcre pixman-1 png pthread pthread-stubs xcb xcb-render
WANTLIB-gtk3 += xcb-shm z stdc++

MODULES=		devel/gettext \
			devel/gconf2

MULTI_PACKAGES=		-main -gtk -gtk3

MODGCONF2_SCHEMAS_DIR=	libcanberra
MODGCONF2_LIBDEP=	No

SUBST_VARS=		V

AUTOCONF_VERSION=	2.68
AUTOMAKE_VERSION= 	1.10

BUILD_DEPENDS=		${MODGNU_AUTOCONF_DEPENDS} \
			${MODGNU_AUTOMAKE_DEPENDS}

LIB_DEPENDS-main=	audio/libvorbis \
			devel/libtool,-ltdl
RUN_DEPENDS-main=	audio/sound-theme-freedesktop>=0.6

LIB_DEPENDS-gtk=	${BASE_PKGPATH} \
			${MODGETTEXT_LIB_DEPENDS} \
			x11/gtk+2
RUN_DEPENDS-gtk=	${MODGCONF2_RUN_DEPENDS} \
			${MODGETTEXT_RUN_DEPENDS}

LIB_DEPENDS-gtk3=	${BASE_PKGPATH} \
			${MODGETTEXT_LIB_DEPENDS} \
			x11/gtk+3
RUN_DEPENDS-gtk3=	${MODGETTEXT_RUN_DEPENDS}

USE_LIBTOOL=		Yes
USE_GMAKE=		Yes

CONFIGURE_STYLE=	 gnu
CONFIGURE_ARGS= 	${CONFIGURE_SHARED} \
			--enable-sndio \
			--disable-gstreamer \
			--disable-oss \
			--disable-alsa \
			--disable-pulse \
			--disable-tdb \
			--disable-udev \
			--disable-gtk-doc \
			--disable-gtk-doc-html
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"

pre-configure:
	cp ${FILESDIR}/sndio.c ${WRKSRC}/src
	${SUBST_CMD} ${WRKSRC}/src/sound-theme-spec.c \
		${WRKSRC}/src/test-canberra.c
	cd ${WRKSRC} && env AUTOCONF_VERSION=${AUTOCONF_VERSION} \
		AUTOMAKE_VERSION=${AUTOMAKE_VERSION} aclocal -I m4
	cd ${WRKSRC} && env AUTOCONF_VERSION=${AUTOCONF_VERSION} \
		AUTOMAKE_VERSION=${AUTOMAKE_VERSION} autoconf
	cd ${WRKSRC} && env AUTOCONF_VERSION=${AUTOCONF_VERSION} \
		AUTOMAKE_VERSION=${AUTOMAKE_VERSION} autoheader
	cd ${WRKSRC} && env AUTOCONF_VERSION=${AUTOCONF_VERSION} \
		AUTOMAKE_VERSION=${AUTOMAKE_VERSION} automake

.include <bsd.port.mk>
