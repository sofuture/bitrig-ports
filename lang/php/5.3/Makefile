# $OpenBSD: Makefile,v 1.32 2012/06/12 09:23:10 landry Exp $

BROKEN-hppa =	no __sync_bool_compare_and_swap support nor asm fallback

PV=		5.3
V=		${PV}.13
SUHOSIN_PHPV=	5.3.9
SUHOSIN_P_V=	0.9.10

INI_TEMPLATES=	development production

# fpm
PKGNAME-fpm?=		php-fpm-${V}
REVISION-fpm=		0
MULTI_PACKAGES+=        -fpm
COMMENT-fpm=		stand-alone FPM version of PHP
CONFIGURE_ARGS+=	--enable-fpm \
			--with-fpm-user=www \
			--with-fpm-group=www
LIB_DEPENDS-fpm=	${LIB_DEPENDS-main}
WANTLIB-fpm=		${WANTLIB-main}
RUN_DEPENDS-fpm=	${RUN_DEPENDS-main} \
			php-${V}:lang/php/${PV}

# pcntl
PKGNAME-pcntl?=		php-pcntl-${V}
MULTI_PACKAGES+=	-pcntl
COMMENT-pcntl=		PCNTL extensions for php5
CONFIGURE_ARGS+=	--enable-pcntl=shared
LIB_DEPENDS-pcntl=
WANTLIB-pcntl=

.include <bsd.port.mk>
