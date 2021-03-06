# $OpenBSD: Makefile,v 1.15 2012/01/13 00:55:14 naddy Exp $

.include <bsd.own.mk>

SYSV=			4.6.2

NOT_FOR_ARCHS =		${GCC2_ARCHS}

V =			3.3.5
PKGNAME =		g77-$V
REVISION =		4
EPOCH =			0
DISTFILES = 		g77-openbsd.tgz

.if ${MACHINE_ARCH:Mamd64}
CONFIG_A = 		x86_64-unknown-bitrig${OSREV}
.else
CONFIG_A = 		${MACHINE_ARCH}-unknown-bitrig${OSREV}
.endif

CONFIG_B =		${MACHINE_ARCH}-unknown-bitrig${OSREV}

SUBST_VARS += 		CONFIG_A CONFIG_B V

COMMENT =		GNU fortran 77 compiler
CATEGORIES =		lang math
MASTER_SITES =		http://spacehopper.org/mirrors/

PERMIT_DISTFILES_CDROM = Yes
PERMIT_PACKAGE_CDROM = 	Yes
PERMIT_DISTFILES_FTP =	Yes
PERMIT_PACKAGE_FTP =	Yes

WRKDIST =		${WRKDIR}/g77
.if ${COMPILER_VERSION:L:Mgcc4*}
PATCH_LIST=		gcc4-* patch-*
.endif
CONFIGURE_SCRIPT =	${WRKDIST}/gcc/configure

SEPARATE_BUILD = 	Yes
LIBIBERTY_INCLUDES =	${WRKDIST}/libiberty/include

GNUCFLAGS =		${CFLAGS} ${COPTS} -DOPENBSD_NATIVE \
			-I${LIBIBERTY_INCLUDES}

VAXHOST_CFLAGS =	-DIN_GCC -DOPENBSD_NATIVE -DHAVE_CONFIG_H -O0
CONFIGURE_STYLE = 	gnu

MAKE_FLAGS = 		CFLAGS="${GNUCFLAGS}" \
			CC="${CC}" LDFLAGS="${LDSTATIC}" \
			DEMANGLER_PROG= \
			DEMANGLE_H= \
			LIBIBERTY_INCLUDES=${LIBIBERTY_INCLUDES} \
			LIBGCC2_INCLUDES=-I${LIBIBERTY_INCLUDES} \
			BUILD_LIBIBERTY=-liberty \
			LIBIBERTY=-liberty \
			HOST_LIBDEPS= \
			LIBDEPS= \
			build_infodir=. \
			INSTALL_LIBGCC= LIBGCC= \
			COMPILERS=f771 \
			USE_COLLECT2= \
			LANGUAGES=f77

CONFIGURE_ENV = INSTALL_PROGRAM="${INSTALL} ${INSTALL_COPY} ${INSTALL_STRIP}" \
			CPPFLAGS=-I${LIBIBERTY_INCLUDES}

CONFIGURE_ARGS = 	--with-gnu-as --with-gnu-ld \
			--with-local-prefix=${PREFIX} ${CF} \
			--with-gxx-include-dir=dummy \
			-enable-languages='f77' \
			--disable-cpp --disable-nls \
			--enable-__cxa_atexit \

ALL_TARGET = 		all doc
INSTALL_TARGET = 	install-common f77.install-info f77.install-normal

post-install:
	ln -sf /usr/lib/gcc/${CONFIG_A}/${SYSV}/libgcc.a ${PREFIX}/lib/gcc-lib/${CONFIG_B}/$V/libgcc.a
	ln -s /usr/lib/gcc/${CONFIG_A}/${SYSV}/cc1 ${PREFIX}/lib/gcc-lib/${CONFIG_B}/$V/cc1
	${INSTALL_MAN} ${WRKBUILD}/f/g77.1 ${PREFIX}/man/man1/g77.1
	cd ${PREFIX}/man/man1 && ln -f g77.1 f77.1
	cd ${PREFIX}/bin && ln -f g77 f77

WANTLIB =		c iberty

.include <bsd.port.mk>
