# $OpenBSD: Makefile,v 1.5 2011/09/16 11:13:41 espie Exp $

COMMENT=	python bindings for poppler

DISTNAME=	pypoppler-0.12.1
PKGNAME=        ${DISTNAME:S/^py/py-/}
CATEGORIES=	print

REVISION=	3

MAINTAINER=	Ido Admon <idoadm@gmail.com>

MASTER_SITES=	${HOMEPAGE}/trunk/development/+download/
HOMEPAGE=	http://launchpad.net/poppler-python/

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MODULES=		devel/gettext \
			lang/python

WANTLIB += GL X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender Xxf86vm atk-1.0 cairo drm
WANTLIB += expat ffi fontconfig freetype gdk-x11-2.0 gdk_pixbuf-2.0
WANTLIB += gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 gthread-2.0
WANTLIB += gtk-x11-2.0 jpeg lcms m openjpeg pango-1.0 pangocairo-1.0
WANTLIB += pangoft2-1.0 pcre pixman-1 png poppler>=10 poppler-glib>=8
WANTLIB += pthread-stubs xcb xcb-render xcb-shm xml2 z

LIB_DEPENDS=		devel/libffi \
			print/poppler>=0.16
BUILD_DEPENDS=		${RUN_DEPENDS}
RUN_DEPENDS=		x11/py-gtk2>=2.10

CONFIGURE_STYLE=	gnu
USE_LIBTOOL=		Yes

LIBTOOL_FLAGS+= 	--tag=disable-static

.include <bsd.port.mk>
