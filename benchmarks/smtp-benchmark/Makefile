# $OpenBSD: Makefile,v 1.11 2011/06/23 22:50:27 naddy Exp $

COMMENT=	SMTP benchmark to measure throughput of an MTA

DISTNAME=	smtp-benchmark-1.0.4
REVISION=	2

CATEGORIES=    	benchmarks mail

HOMEPAGE=	http://www.etc.msys.ch/software/smtp-benchmark/

SHARED_ONLY=	Yes

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=		c pthread

MASTER_SITES=  	${HOMEPAGE}
EXTRACT_SUFX=	.tgz

FAKE_FLAGS=	BINDIR=${PREFIX}/sbin MANDIR=${PREFIX}/man/man

NO_REGRESS=	Yes

.include <bsd.port.mk>
