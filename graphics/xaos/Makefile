# $OpenBSD

COMMENT =		interactive fractal zoomer and morpher

VERSION =		3.5
DISTNAME =		xaos-${VERSION}

CATEGORIES =		graphics

HOMEPAGE =		http://wmi.math.u-szeged.hu/xaos/doku.php

MAINTAINER =		Pascal Stumpf <Pascal.Stumpf@cubes.de>

# GPLv2
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB =		X11 Xext c gsl gslcblas m png z

MASTER_SITES =		${MASTER_SITE_SOURCEFORGE:=xaos/XaoS/${VERSION}/}

MODULES =		devel/gettext

LIB_DEPENDS =		graphics/png \
			devel/gsl

USE_GMAKE =		Yes

NO_REGRESS=		Yes

CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS +=	--with-gsl=yes \
			--with-libiconv-prefix="${LOCALBASE}" \
			--with-libintl-prefix="${LOCALBASE}"
CONFIGURE_ENV =		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"

MAKE_FLAGS =		CPPFLAGS="-I${LOCALBASE}/include/libpng"

pre-configure:
	perl -pi -e 's#/usr(/share/locale)#${PREFIX}\1#g' \
		${WRKSRC}/configure ${WRKSRC}/src/ui/ui.c

.include <bsd.port.mk>
