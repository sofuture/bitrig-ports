# $OpenBSD: Makefile,v 1.22 2011/11/09 00:17:37 jeremy Exp $

COMMENT=	access a MySQL database from Ruby

DISTNAME=	mysql-2.8.1
REVISION=	9
CATEGORIES=	databases

HOMEPAGE=	http://tmtm.org/mysql/ruby/

# Ruby License
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MODULES=	lang/ruby

WANTLIB=	mysqlclient crypto ssl z

LIB_DEPENDS=	databases/mysql

CONFIGURE_STYLE=ruby gem ext

REGRESS_DEPENDS=databases/mysql,-server

# A running mysqld is required to run the regression tests.
REGRESS_IS_INTERACTIVE = Yes

do-regress:
	@cd ${WRKBUILD} && ${RUBY} test.rb

.include <bsd.port.mk>
