# $OpenBSD: Makefile,v 1.26 2011/01/05 17:09:26 stu Exp $

COMMENT=	mail user agent for X in C with a Tcl/Tk frontend

DISTNAME=	tkrat-2.1.2
REVISION =	2
CATEGORIES=	mail x11

HOMEPAGE=	http://www.tkrat.org/

MAINTAINER=	Kevin Lo <kevlo@openbsd.org>

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MODULES=	x11/tk
MODTCL_VERSION=	8.4
MODTK_VERSION=	8.4

WANTLIB=	crypto ssl

MASTER_SITES=	ftp://ftp.tkrat.org/pub/tkrat/

RUN_DEPENDS=	${MODTK_RUN_DEPENDS}
BUILD_DEPENDS=	${RUN_DEPENDS}

USE_GROFF =	Yes
CONFIGURE_STYLE= gnu dest
CONFIGURE_ARGS=	--with-tcl-bin="${LOCALBASE}/bin" \
		--with-tcl-include="${MODTCL_INCDIR}" \
		--with-tkconfig="${MODTK_LIBDIR}"

NO_REGRESS=	Yes

DOCS=	CONFIGURATION doc/interface doc/userproc.example doc/userprocs

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/lib/tkrat
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/tkrat
	${INSTALL_DATA} ${WRKSRC}/lib/pkgIndex.tcl ${PREFIX}/lib/tkrat
	cd ${WRKSRC}; ${INSTALL_DATA} ${DOCS} ${PREFIX}/share/doc/tkrat

.include <bsd.port.mk>
