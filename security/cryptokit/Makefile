# $OpenBSD: Makefile,v 1.11 2011/11/04 08:43:32 jasper Exp $

COMMENT=	cryptographic framework for the Objective-ML language
CATEGORIES=	security

DISTNAME=	cryptokit-1.3
PKGNAME=	${DISTNAME}
REVISION =	4
MASTER_SITES=	http://caml.inria.fr/distrib/bazar-ocaml/

MAINTAINER=	Anil Madhavapeddy <avsm@openbsd.org>
HOMEPAGE=	http://pauillac.inria.fr/~xleroy/software.html

# GPL 
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes

WANTLIB=	z

MODULES=	lang/ocaml

OCAML_LIBDIR=	${PREFIX}/lib/ocaml
DOC_DIR=	${PREFIX}/share/doc/cryptokit
MAKE_FLAGS=	CFLAGS="${CFLAGS} -DHAVE_ZLIB"
FAKE_FLAGS=	INSTALLDIR="${DESTDIR}${OCAML_LIBDIR}"

ALL_TARGET=	all ${MODOCAML_NATIVE:S,Yes,allopt,:S,No,,}

REGRESS_TARGET=	test

pre-install:
	${INSTALL_DATA_DIR} ${OCAML_LIBDIR}

post-install:
	${INSTALL_DATA_DIR} ${DOC_DIR}
	${LOCALBASE}/bin/ocamldoc -html -I ${WRKSRC} -d ${DOC_DIR} \
		${WRKSRC}/cryptokit.mli

.include <bsd.port.mk>
