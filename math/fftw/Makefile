# $OpenBSD: Makefile,v 1.15 2011/03/14 09:17:01 sthen Exp $
# $FreeBSD: ports/math/fftw/Makefile,v 1.11 2000/06/16 21:51:38 asami Exp $
# Original from: Lars Koeller <Lars.Koeller@Uni-Bielefeld.DE>

COMMENT=	C routines for computing the Discrete Fourier Transform

DISTNAME=	fftw-2.1.5
REVISION=	2
SHARED_LIBS=	fftw	2.7 \
		rfftw	2.7
CATEGORIES=	math

HOMEPAGE=	http://www.fftw.org/

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=		m

MASTER_SITES=	ftp://ftp.fftw.org/pub/fftw/ \
		ftp://ftp.kusastro.kyoto-u.ac.jp/pub/src/GNU/fftw/ \
		http://fftw.mirror.fr/

USE_LIBTOOL=		Yes

CONFIGURE_STYLE=	gnu

.if ${MACHINE_ARCH} == "i386"
CONFIGURE_ARGS+=	--enable-i386-hacks
PATCH_LIST=		gcc-* patch-*
.endif
CONFIGURE_ARGS+=	${CONFIGURE_SHARED}

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/fftw
	${INSTALL_DATA} ${WRKSRC}/doc/fftw.ps ${PREFIX}/share/doc/fftw

.include <bsd.port.mk>
