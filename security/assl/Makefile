# $OpenBSD: Makefile,v 1.21 2012/04/28 09:26:50 ajacoutot Exp $

COMMENT=		hide awful SSL API in a sane interface

DISTNAME=		assl-1.0.0
EPOCH=			0
CATEGORIES=		security devel
SHARED_LIBS=		assl	4.0

HOMEPAGE=		http://opensource.conformal.com/wiki/Assl
MASTER_SITES=		http://opensource.conformal.com/snapshots/assl/

MAINTAINER=		David Hill <dhill@mindcry.org>

# ISC
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

BUILD_DEPENDS=		devel/libevent2

FAKE_FLAGS=		MANDIR=${PREFIX}/man/man

NO_REGRESS=		Yes
EG_DIR=			${PREFIX}/share/examples/assl

.if ${MACHINE_ARCH:Mmips64*}
EXTRA_CFLAGS=   -D__BUILTIN_HACK
.endif

do-configure:
	printf "major=${LIBassl_VERSION:R}\nminor=${LIBassl_VERSION:E}\n" \
	    > ${WRKSRC}/shlib_version

post-install:
	${INSTALL_DATA_DIR} ${EG_DIR}
	cd ${WRKSRC}/examples && \
		find . -type d \
			-exec ${INSTALL_DATA_DIR} ${EG_DIR}/{} \; && \
		find . ! -type d \
			-exec ${INSTALL_DATA} -m 644 {} ${EG_DIR}/{} \;

.include <bsd.port.mk>
