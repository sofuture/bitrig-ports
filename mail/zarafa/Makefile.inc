# $OpenBSD: Makefile.inc,v 1.19 2012/05/05 16:56:17 ajacoutot Exp $

# there is no point in building/running this on NO_SHARED_LIBS archs
SHARED_ONLY=	Yes

V?=		7.0.7
BUILD?=		34256
DISTNAME?=	zcp-${V}

CATEGORIES+=	mail/zarafa

HOMEPAGE?=	http://community.zarafa.com/

MAINTAINER?=	Antoine Jacoutot <ajacoutot@openbsd.org>

# zarafa: AGPLv3 (GNU Affero Public License)
# libvmime: GPLv2
PERMIT_PACKAGE_CDROM?=	Yes
PERMIT_PACKAGE_FTP?=	Yes
PERMIT_DISTFILES_CDROM?=Yes
PERMIT_DISTFILES_FTP?=	Yes

DIST_SUBDIR?=		zarafa
MASTER_SITES_ZARAFA=	http://download.zarafa.com/community/final/${V:C/^([0-9]+\.[0-9]+).*/\1/}/${V}-${BUILD}/sourcecode/
MASTER_SITES?=		${MASTER_SITES_ZARAFA}
