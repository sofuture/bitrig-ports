# $OpenBSD: Makefile,v 1.18 2011/06/23 22:50:28 naddy Exp $

COMMENT=	yet another dump utility

DISTNAME=	xd-8087
REVISION=	1
CATEGORIES=	misc

# BSD 
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=		c

FAKE_FLAGS=	CC="${CC}" BINDIR=${PREFIX}/bin MANDIR=${PREFIX}/man/man

.include <bsd.port.mk>
