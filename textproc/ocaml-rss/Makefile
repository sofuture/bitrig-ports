# $OpenBSD: Makefile,v 1.8 2010/11/20 19:56:49 espie Exp $

COMMENT=	Objective Caml library to parse RSS 2.0
CATEGORIES=	textproc

V=		0.4
DISTNAME=	ocamlrss_${V}
PKGNAME=	ocaml-rss-${V}
REVISION =	2
MASTER_SITES=	http://pauillac.inria.fr/~guesdon/Tools/Tars/

MAINTAINER=	Anil Madhavapeddy <avsm@openbsd.org>
HOMEPAGE=	http://www.nongnu.org/ocamlrss/

# LGPL
PERMIT_PACKAGE_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes

MODULES=	lang/ocaml
WRKDIST=	${WRKDIR}/ocamlrss-${V}
NO_REGRESS= 	Yes
ALL_TARGET=	byte ${MODOCAML_NATIVE:S,Yes,opt,:S,No,,}
USE_GMAKE=	Yes
CONFIGURE_STYLE= gnu
BUILD_DEPENDS=	textproc/ocaml-xml-light

.include <bsd.port.mk>
