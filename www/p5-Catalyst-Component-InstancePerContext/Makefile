# $OpenBSD: Makefile,v 1.4 2010/12/03 11:46:51 ajacoutot Exp $

COMMENT =	return a new component instance per request

MODULES =	cpan
DISTNAME =	Catalyst-Component-InstancePerContext-0.001001
REVISION =	0
CATEGORIES =	www
USE_GROFF =	Yes

MAINTAINER =	Simon Bertrang <simon@openbsd.org>

# Perl
PERMIT_PACKAGE_CDROM =		Yes
PERMIT_PACKAGE_FTP =		Yes
PERMIT_DISTFILES_CDROM =	Yes
PERMIT_DISTFILES_FTP =		Yes

RUN_DEPENDS =		devel/p5-Moose \
			www/p5-Catalyst-Runtime

CONFIGURE_ARGS +=	--skipdeps

.include <bsd.port.mk>
