# $OpenBSD: Makefile.inc,v 1.10 2012/05/17 11:05:40 sthen Exp $

V ?= 1.7.0

CATEGORIES+=	net net/icinga

HOMEPAGE?=	http://www.icinga.org/

MAINTAINER?=	Stuart Henderson <sthen@openbsd.org>

# GPLv2 only
PERMIT_PACKAGE_CDROM?=	Yes
PERMIT_PACKAGE_FTP?=	Yes
PERMIT_DISTFILES_CDROM?=Yes
PERMIT_DISTFILES_FTP?=	Yes

MASTER_SITES?=	${MASTER_SITE_SOURCEFORGE:=icinga/}
