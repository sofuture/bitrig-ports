# $OpenBSD: Makefile,v 1.20 2010/12/03 11:46:52 ajacoutot Exp $

SHARED_ONLY=	Yes

COMMENT=	perl interface to the GNOME GHTTP library

MODULES=	cpan
DISTNAME=	HTTP-GHTTP-1.07
REVISION=	3
CATEGORIES=	www
USE_GROFF =	Yes

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += ghttp>=1

LIB_DEPENDS=	www/libghttp

.include <bsd.port.mk>
