# $OpenBSD: Makefile,v 1.9 2012/04/19 21:30:38 sthen Exp $

COMMENT=	support for PHP archives (.phar)
DISTNAME=	phar-2.0.0
REVISION=	6

# PHP
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MODULES=	lang/php/pecl
CONFIGURE_STYLE= gnu

RUN_DEPENDS=	lang/php/${MODPHP_VERSION},-bz2

.include <bsd.port.mk>
