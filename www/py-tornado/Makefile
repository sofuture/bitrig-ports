# $OpenBSD: Makefile,v 1.3 2012/04/25 15:08:20 rpointel Exp $

COMMENT =		scalable, non-blocking web server

MODPY_EGG_VERSION =	2.2.1
DISTNAME =		tornado-${MODPY_EGG_VERSION}
PKGNAME =		py-${DISTNAME}

CATEGORIES =		www

HOMEPAGE =		http://www.tornadoweb.org/

# Apache v2
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MASTER_SITES =		http://cloud.github.com/downloads/facebook/tornado/

MODULES =		lang/python

do-regress:
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} PYTHONPATH=.\
		${MODPY_BIN} ./tornado/test/runtests.py

.include <bsd.port.mk>
