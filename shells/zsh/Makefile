# $OpenBSD: Makefile,v 1.66 2012/05/10 13:49:56 ajacoutot Exp $

COMMENT=	Z shell, Bourne shell-compatible

V=		4.3.17
DISTNAME=	zsh-$V
CATEGORIES=	shells

MAINTAINER=	Pierre-Emmanuel Andre <pea@openbsd.org>

HOMEPAGE=	http://www.zsh.org/

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=zsh/}

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=	c m pcre ncursesw

MODULES=	converters/libiconv

LIB_DEPENDS=	devel/pcre

AUTOCONF_VERSION=2.68
CONFIGURE_STYLE=autoconf
CONFIGURE_ENV=  CPPFLAGS="-I${LOCALBASE}/include" \
                LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	${CONFIGURE_SHARED:S/shared/dynamic/} \
		--enable-zsh-mem \
		--enable-zsh-secure-free \
		--enable-maildir-support \
		--with-tcsetpgrp \
		--enable-multibyte \
		--enable-pcre \
		--disable-gdbm
USE_GROFF =	Yes

SUBST_VARS=	V

# required for regression tests
PORTHOME=	${WRKDIR}
REGRESS_FLAGS=	INSTALL_PROGRAM="install -c -s -m 555" \
		INSTALL_DATA="install -c -m 444" \
		INSTALL="install -c" \
		TMPPREFIX=${WRKBUILD}/tmp \
		TERM=xterm

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/zsh/$V/scripts/

.include <bsd.port.mk>
