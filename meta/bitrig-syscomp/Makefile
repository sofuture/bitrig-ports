COMMENT=	System Compiler Meta Package

PKGNAME=	bitrig-syscomp-1.0
REVISION=	13

MAINTAINER=	Marco Peereboom <marco@bitrig.org>

BUILD_DEPENDS=	bitrig/bitrig-binutils \
		bitrig/bitrig-gcc,-gcclibs \
		bitrig/bitrig-gcc,-main \
		bitrig/bitrig-llvm \
		devel/git \
		sysutils/cdrtools

RUN_DEPENDS = ${BUILD_DEPENDS}

.include <bsd.port.mk>
