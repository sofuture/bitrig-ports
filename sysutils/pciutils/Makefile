# $OpenBSD: Makefile,v 1.13 2010/11/20 17:22:41 espie Exp $

NOT_FOR_ARCHS =		sparc m68k m88k vax

COMMENT =		PCI bus configuration register access tools

DISTNAME =		pciutils-3.1.2
REVISION =		1
CATEGORIES =		sysutils

HOMEPAGE =		http://atrey.karlin.mff.cuni.cz/~mj/pciutils.shtml

MAINTAINER =		Matthieu Herrb <matthieu@openbsd.org>

# GPL
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes
WANTLIB =		c z

MASTER_SITES =		ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci/

USE_GMAKE =		Yes
USE_GROFF =		Yes

MAKE_ENV =		CC="${CC}"
FAKE_FLAGS =		PREFIX=${TRUEPREFIX} MANDIR=${TRUEPREFIX}/man

NO_REGRESS =		Yes

INSTALL_TARGET =        install install-lib

.include <bsd.port.mk>
