# $OpenBSD: Makefile,v 1.42 2012/05/22 12:04:02 espie Exp $

CATEGORIES =		databases
V =			2.2
DISTNAME =		sqlports-$V
DISTFILES =
COMMENT =		sqlite database of ports
COMMENT-main =		${COMMENT}, user version
COMMENT-compact =	${COMMENT}, program version
MAINTAINER =		Marc Espie <espie@openbsd.org>
FULLPKGNAME-compact =	sqlports-compact-$V
FULLPKGNAME-main =	sqlports-$V


PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes
MULTI_PACKAGES =	-main -compact

DBNAME =		${WRKBUILD}/sqlports

do-build:
	@cd ${PORTSDIR} && PORTSDIR=${PORTSDIR} perl ${FILESDIR}/mksqlitedb -v ${DBNAME} -p ${WRKBUILD}/ouch
	@if test -s ${WRKBUILD}/ouch; then \
		cat ${WRKBUILD}/ouch; \
		exit 1; \
	fi

do-install:
	${INSTALL_DATA} ${DBNAME} ${PREFIX}/share
	${INSTALL_DATA} ${DBNAME}-compact ${PREFIX}/share

BUILD_DEPENDS =		databases/p5-DBD-SQLite
NO_REGRESS =		Yes
NO_CHECKSUM =		Yes

.include <bsd.port.mk>
