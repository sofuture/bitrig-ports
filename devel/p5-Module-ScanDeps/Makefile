# $OpenBSD: Makefile,v 1.14 2010/12/03 11:44:33 ajacoutot Exp $

COMMENT=	recursively scan Perl code for dependencies

MODULES=	cpan
DISTNAME=	Module-ScanDeps-0.89
REVISION=	0
CATEGORIES=	devel
USE_GROFF =	Yes

MAINTAINER=	Simon Bertrang <simon@openbsd.org>

# perl
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MAKE_ENV=	TEST_POD=Yes

.include <bsd.port.mk>
