# $OpenBSD: Makefile,v 1.48 2012/05/08 08:24:40 dcoppa Exp $

COMMENT =	e-donkey client
DISTNAME =	mldonkey-3.1.1
REVISION =	0
CATEGORIES =	net

HOMEPAGE =	http://mldonkey.sourceforge.net/Main_Page
MASTER_SITES =	${MASTER_SITE_SOURCEFORGE:=mldonkey/}

MAINTAINER =	David Coppa <dcoppa@openbsd.org>

# GPLv2
PERMIT_PACKAGE_FTP =	Yes
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_DISTFILES_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes

EXTRACT_SUFX =		.tar.bz2

WANTLIB +=		GL X11 Xcomposite Xcursor Xdamage Xext
WANTLIB +=		Xfixes Xi Xinerama Xrandr Xrender atk-1.0
WANTLIB +=		bz2 c cairo charset expat fontconfig
WANTLIB +=		freetype gd gdk-x11-2.0 gdk_pixbuf-2.0
WANTLIB +=		gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB +=		gthread-2.0 gtk-x11-2.0 jpeg m magic
WANTLIB +=		miniupnpc natpmp pixman-1 pango-1.0
WANTLIB +=		pangocairo-1.0 pangoft2-1.0 png pthread
WANTLIB +=		pthread-stubs rsvg-2 stdc++ xcb
WANTLIB +=		xcb-render xcb-shm z

CONFIGURE_STYLE =	autoconf no-autoheader
AUTOCONF_DIR =		${WRKSRC}/config
AUTOCONF_VERSION =	2.68
MODGNU_CONFIG_GUESS_DIRS=${WRKSRC}/config

CONFIGURE_ARGS +=	--enable-gui=newgui2 \
			--enable-upnp-natpmp
CONFIGURE_ENV +=	CPPFLAGS='-I${LOCALBASE}/include/libpng \
			-I${LOCALBASE}/include -I${X11BASE}/include' \
			LDFLAGS='-L${LOCALBASE}/lib -L${X11BASE}/lib' \
			ac_cv_prog_RPMBUILD="" \
			ac_cv_prog_WGET=""

USE_GMAKE =	Yes
MODULES =	lang/ocaml devel/gettext
BUILD_DEPENDS =	x11/lablgtk2
LIB_DEPENDS =	archivers/bzip2 \
		devel/libmagic \
		graphics/gd \
		net/miniupnp/libnatpmp \
		net/miniupnp/miniupnpc \
		x11/gnome/librsvg \
		x11/gtk+2

FAKE_FLAGS =	MODOCAML_NATIVE=${MODOCAML_NATIVE}
NO_REGRESS =	Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/mldonkey
	cp -R ${WRKDIST}/distrib ${PREFIX}/share/mldonkey/
	@${strip_binaries}

.include <bsd.port.mk>

.if ${MODOCAML_NATIVE:L} == "yes"
strip_binaries=cd ${PREFIX}/bin && strip mlnet mlgui mlnet+gui
.else
strip_binaries=:
.endif
