# $OpenBSD: Makefile,v 1.3 2011/03/07 18:54:50 ajacoutot Exp $

COMMENT=	analyze terminal control sequences

DISTNAME=	teseq-1.0.0
CATEGORIES=	misc
HOMEPAGE=	http://www.gnu.org/software/teseq/

MAINTAINER=	Christian Weisgerber <naddy@openbsd.org>

# GPLv3
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${MASTER_SITE_GNU:=teseq/}

# enable extended regression tests
FLAVORS=	regress
FLAVOR?=

WANTLIB=	c

CONFIGURE_STYLE=gnu
MAKE_FLAGS=	AM_CFLAGS=""
USE_GROFF =	Yes

.if ${FLAVOR:L:Mregress}
BUILD_DEPENDS=	devel/check
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
.endif

.include <bsd.port.mk>
