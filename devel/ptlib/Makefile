# $OpenBSD: Makefile,v 1.14 2012/03/02 09:03:52 ajacoutot Exp $

SHARED_ONLY=	Yes

COMMENT=	portable tools library

DISTNAME=	ptlib-2.10.4

SHARED_LIBS=	pt	4.0	# 2.10.3

EXTRACT_SUFX=	.tar.bz2

CATEGORIES=	devel telephony

HOMEPAGE=	http://www.opalvoip.org/

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# MPL 1.0
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += SDL c crypto expat lber ldap ldap_r m sasl2 sndio ssl
WANTLIB += stdc++

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=opalvoip/}

BUILD_DEPENDS=	devel/bison \
		${MODGNU_AUTOCONF_DEPENDS} \
		${MODGNU_AUTOMAKE_DEPENDS}
LIB_DEPENDS=	databases/openldap \
		devel/sdl

ALL_TARGET=	default

.include <bsd.own.mk>
.if !${COMPILER_VERSION:L:Mgcc4}
PATCH_LIST = patch-* gcc3-patch-*
.endif

CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	${CONFIGURE_SHARED} \
		--with-plugin-installdir=ptlib \
		--enable-plugins \
		--enable-bsdvideo \
		--enable-sasl \
		--enable-openldap \
		--enable-audio \
		--enable-video \
		--enable-vidfile \
		--enable-shmvideo \
		--enable-v4l2 \
		--enable-sndio \
		--enable-openssl \
		--disable-lua \
		--disable-oss \
		--disable-alsa \
		--disable-avc \
		--disable-dc \
		--disable-odbc \
		--disable-pulse

# XXX needs /proc/net/if_inet6
CONFIGURE_ARGS+=--disable-ipv6

CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		OPENSSL_CFLAGS="-I/usr/include" \
		OPENSSL_LIBS="-lssl -lcrypto -lm"

# should be 2.66
AUTOCONF_VERSION=	2.67
AUTOMAKE_VERSION=	1.10
MODGNU_CONFIG_GUESS_DIRS= ${WRKSRC} ${WRKSRC}/plugins

MAKE_FLAGS=	MAJOR_VERSION=${LIBpt_VERSION:R} \
		MINOR_VERSION=${LIBpt_VERSION:E} \
		LIB_SONAME=libpt.so.${LIBpt_VERSION} \
		DEBUG_SONAME=libpt_d.so.${LIBpt_VERSION}

USE_GMAKE=	Yes
NO_REGRESS=	Yes

post-extract:
	@mkdir ${WRKSRC}/plugins/sound_sndio
	@cp ${FILESDIR}/{Makefile,sound_sndio.*} ${WRKSRC}/plugins/sound_sndio

pre-configure:
	${SUBST_CMD} ${WRKSRC}/make/common.mak \
		${WRKSRC}/make/unix.mak \
		${WRKSRC}/src/ptlib/common/pluginmgr.cxx
	cd ${WRKSRC} && env AUTOCONF_VERSION=${AUTOCONF_VERSION} \
		AUTOMAKE_VERSION=${AUTOMAKE_VERSION} aclocal
	cd ${WRKSRC} && env AUTOCONF_VERSION=${AUTOCONF_VERSION} \
		AUTOMAKE_VERSION=${AUTOMAKE_VERSION} autoconf
	cd ${WRKSRC}/plugins && env AUTOCONF_VERSION=${AUTOCONF_VERSION} \
		AUTOMAKE_VERSION=${AUTOMAKE_VERSION} autoconf

post-install:
	${INSTALL_DATA} ${WRKSRC}/version.h ${PREFIX}/share/ptlib

.include <bsd.port.mk>
