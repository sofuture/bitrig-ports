# $OpenBSD: Makefile,v 1.45 2011/11/02 08:46:37 jasper Exp $
# Uses pthreads

COMMENT=	Generic Graphics Library
DISTNAME=	libggi-2.1.0
REVISION =	8
SHARED_LIBS=	ggi	2.1

CATEGORIES=	graphics

HOMEPAGE=	http://www.ggi-project.org/
MAINTAINER=	Todd T. Fries <todd@openbsd.org>

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=	X11 Xext Xxf86dga Xxf86vm c m ncurses pthread \
		xcb gii>=0.9 gg

MASTER_SITES=	http://www.ggi-project.org/ftp/ggi/v2.1/
EXTRACT_SUFX=	.src.tar.bz2

LIB_DEPENDS=	graphics/gii>=0.9

USE_GMAKE=	Yes
USE_LIBTOOL=	Yes
USE_GROFF =	Yes

CFLAGS+=	-pthread
CONFIGURE_STYLE= gnu
CONFIGURE_ARGS+= ${CONFIGURE_SHARED}
CONFIGURE_ARGS+= --enable-static --disable-aa \
		--with-gii="${PREFIX}"

DOCS=	README

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/ggi
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/ggi
	cd ${WRKSRC}; ${INSTALL_DATA} ${DOCS} ${PREFIX}/share/doc/ggi
	${INSTALL_DATA} ${WRKSRC}/libggi.conf \
		${PREFIX}/share/examples/ggi/libggi.conf.example

.include <bsd.port.mk>
