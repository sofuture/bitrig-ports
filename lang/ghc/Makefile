# $OpenBSD: Makefile,v 1.67 2012/05/02 22:58:31 kili Exp $

COMMENT-main =		compiler for the functional language Haskell
COMMENT-doc =		documentation for GHC

DISTNAME =		ghc-${MODGHC_VER}
PKGNAME-main =		ghc-${MODGHC_VER}
REVISION-main =		7
PKGNAME-doc =		ghc-doc-${MODGHC_VER}
REVISION-doc =		0
CATEGORIES =		lang devel
HOMEPAGE =		http://www.haskell.org/ghc/

# Version of the precompiled binaries
BIN_VER =		7.0.4.20111023

# xhtml replacement version (for meta/haskell-platform)
XHTML_VER =		3000.2.0.4

SUBST_VARS +=		XHTML_VER

# Pull in lang/ghc to get MODGHC_VER and ONLY_FOR_ARCHS, which is maintained
# in ghc.port.mk. lang/python needed for regress.
MODULES =		lang/ghc lang/python converters/libiconv

MULTI_PACKAGES =	-main -doc

# BSD w/o advertising clause.
# Distfile is bundled with other stuff like libffi, libgmp, mingw
# binaries, with BSD, GPLv2 and Perl artistic license.
PERMIT_PACKAGE_CDROM =		Yes
PERMIT_PACKAGE_FTP =		Yes
PERMIT_DISTFILES_CDROM =	Yes
PERMIT_DISTFILES_FTP =		Yes

PKG_ARCH-doc =		*
BUILD_DEPENDS =		textproc/dblatex \
			textproc/docbook>=4.5 \
			textproc/docbook-xsl \
			textproc/libxslt
LIB_DEPENDS-doc =
LIB_DEPENDS-main =	${LIB_DEPENDS} devel/gmp
RUN_DEPENDS-doc =
RUN_DEPENDS-main =

WANTLIB-main =		${WANTLIB} c gmp m ncursesw pthread util

WANTLIB-doc =

MASTER_SITES =		${HOMEPAGE}dist/${MODGHC_VER}/ \
			${HOMEPAGE}dist/stable/dist/
MASTER_SITES0 =		http://openbsd.dead-parrot.de/distfiles/
MASTER_SITES1 =		http://hackage.haskell.org/packages/archive/xhtml/${XHTML_VER}/

DIST_SUBDIR =		ghc

VMEM_WARNING =		Yes

BINDISTFILE =		${BINDISTFILE-${MACHINE_ARCH}}

DISTFILES =		ghc-${MODGHC_VER}-src.tar.bz2 \
			testsuite-${MODGHC_VER}.tar.bz2 \
			xhtml-${XHTML_VER}.tar.gz:1 \
			${BINDISTFILE}

.for m in amd64 i386
BINDISTFILE-$m =	ghc-${BIN_VER}-$m-unknown-openbsd.tar.bz2:0
SUPDISTFILES +=		${BINDISTFILE-$m}
.endfor

USE_GMAKE =		Yes
USE_GROFF =		Yes

CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS +=	--with-gmp-includes=${LOCALBASE}/include \
			--with-gmp-libraries=${LOCALBASE}/lib \
			--with-iconv-includes=${LOCALBASE}/include \
			--with-iconv-libraries=${LOCALBASE}/lib

MAKE_FLAGS +=		StripLibraries=YES \
			INSTALL_BIN_OPTS=-s \
			GhcThreaded=NO \
			HSCOLOUR_SRCS=NO

# Thank god that they're only building compilers and no nuclear
# power plants.
FAKE_FLAGS +=		CREATE_DATA="${INSTALL_DATA} /dev/null " \
			CREATE_SCRIPT="${INSTALL_SCRIPT} /dev/null " \
			INSTALL_DATA="${INSTALL_DATA} \$$1 \$$2 \$$3" \
			INSTALL_DIR="${INSTALL_DATA_DIR} \$$1" \
			INSTALL_DOC="${INSTALL_DATA} \$$1 \$$2 \$$3" \
			INSTALL_HEADER="${INSTALL_DATA} \$$1 \$$2 \$$3" \
			INSTALL_MAN="${INSTALL_MAN} \$$1 \$$2 \$$3" \
			INSTALL_PROGRAM="${INSTALL_PROGRAM} \$$1 \$$2 \$$3" \
			INSTALL_SCRIPT="${INSTALL_SCRIPT} \$$1 \$$2 \$$3" \
			INSTALL_SHLIB="${INSTALL} ${INSTALL_COPY} -S -o ${LIBOWN} -g ${LIBGRP} -m ${LIBMODE} \$$1 \$$2 \$$3"

# For mktexpk (via dvips when building the PostScript documentation):
PORTHOME =		${WRKDIR}

BUILD_DEPENDS +=	devel/haddock,no_deps:patch

REGRESS_DEPENDS =	print/ghostscript/gnu \
			shells/bash

post-extract:
# - Install a precompiled binary.
	cd ${WRKDIR}/ghc-${BIN_VER} && \
	./configure --prefix=${WRKDIR} && \
	${MAKE_PROGRAM} install
	rm -rf ${WRKDIR}/ghc-${BIN_VER}
# - Replace utils/haddock by the version from the ports tree.
	mv ${WRKSRC}/utils/haddock{,-ghcdist}
	mv ${WRKDIR}/devel/haddock/haddock-* ${WRKSRC}/utils/haddock
. for f in ghc.mk doc/ghc.mk haddock.wrapper
	cp -p ${WRKSRC}/utils/haddock{-ghcdist,}/$f
. endfor
# - Replace libraries/xhtml.
	cp ${WRKSRC}/libraries/xhtml/ghc.mk ${WRKDIR}/xhtml-${XHTML_VER} 
	cp ${WRKSRC}/libraries/xhtml/GNUmakefile ${WRKDIR}/xhtml-${XHTML_VER} 
	mv ${WRKSRC}/libraries/xhtml{,-ghcdist}
	mv ${WRKDIR}/xhtml-${XHTML_VER} ${WRKSRC}/libraries/xhtml

post-patch:
	${SUBST_CMD} ${WRKSRC}/docs/index.html \
		${WRKSRC}/libraries/process/tests/process007.hs

post-install:
	cd ${PREFIX}/lib/ghc && \
	GHC_PKG="./ghc-pkg --global-conf ./package.conf.d" && \
	${INSTALL_SCRIPT} /dev/null register.sh && \
	exec > register.sh && \
	echo '#!/bin/sh' && \
	echo 'exec > /dev/null 2>&1' && \
	echo 'p="$${0%/*}/ghc-pkg --global-conf $${0%/*}/package.conf.d"' && \
	for p in $$($$GHC_PKG list --simple); do \
		echo \$$p register --force - \<\< \'EOF\' && \
		$$GHC_PKG describe $$p | sed '/^pkgpath:$$/s@$$@ ${PKGPATH}@' && \
		echo EOF; \
	done && \
	${INSTALL_SCRIPT} /dev/null unregister.sh && \
	exec > unregister.sh && \
	echo '#!/bin/sh' && \
	echo 'exec > /dev/null 2>&1' && \
	echo 'p="$${0%/*}/ghc-pkg --global-conf $${0%/*}/package.conf.d"' && \
	for p in $$($$GHC_PKG list --simple); do \
		echo \$$p unregister --force $$p; \
	done && \
	rm package.conf.d/* && \
	$$GHC_PKG recache

do-regress:
	ulimit -c 0 && \
	cd ${WRKSRC}/testsuite/tests/ghc-regress && \
	exec ${SETENV} ${MAKE_ENV} HS_ENCODING=utf-8 \
		${MAKE_PROGRAM} ${MAKE_FLAGS} \
		PYTHON="${MODPY_BIN}"



# It doesn't matter wether this is the actual date of the bootstrapper
# build. It's just used to get different distfiles whenever new
# bootstrappers have to be built.
BOOTSTRAP_DATE =	20111023

# Create a bootstrapper. This compiles a stripped-down version of
# ghc and creates a `bindist', i.e. a tarball with binaries that
# can be used for bootstrapping.
# You have to install gtar in order to run this target!
bootstrap: patch
	@if [ ! -x ${LOCALBASE}/bin/gtar ]; then \
		echo Please pkg_add gtar.; \
		false; \
	fi
	cd ${WRKDIR} && rm -rf bin

	echo HSCOLOUR_SRCS=NO > ${WRKSRC}/mk/build.mk
	echo GhcLibHcOpts=-O -fgenerics -fasm >> ${WRKSRC}/mk/build.mk
	echo GhcStage1HcOpts=-O -fasm >> ${WRKSRC}/mk/build.mk
	echo GhcStage2HcOpts=-O -fasm >> ${WRKSRC}/mk/build.mk
	echo SplitObjs=NO >> ${WRKSRC}/mk/build.mk
	echo GhcLibWays=v >> ${WRKSRC}/mk/build.mk
	echo GhcRTSWays= >> ${WRKSRC}/mk/build.mk
	echo GhcWithInterpreter=NO >> ${WRKSRC}/mk/build.mk
	echo INTEGER_LIBRARY=integer-simple >> ${WRKSRC}/mk/build.mk
	echo SRC_CC_OPTS+=-g -O0 >> ${WRKSRC}/mk/build.mk
	echo HADDOCK_DOCS=NO >> ${WRKSRC}/mk/build.mk
	echo LATEX_DOCS=NO >> ${WRKSRC}/mk/build.mk
	echo BUILD_DOCBOOK_HTML=NO >> ${WRKSRC}/mk/build.mk
	echo BUILD_DOCBOOK_PDF=NO >> ${WRKSRC}/mk/build.mk
	echo BUILD_DOCBOOK_PS=NO >> ${WRKSRC}/mk/build.mk
	echo GhcWithSMP=NO >> ${WRKSRC}/mk/build.mk
	echo INSTALL_BIN_OPTS=-s >> ${WRKSRC}/mk/build.mk

	echo ${BOOTSTRAP_DATE} > ${WRKSRC}/VERSION_DATE

	env CONFIGURE_ENV=RELEASE=NO ${MAKE} configure

	env MAKE_ENV="AUTOCONF_VERSION=2.61 AUTOMAKE_VERSION=1.4" \
	${MAKE} build ALL_TARGET="all binary-dist" \

	cd ${WRKSRC} && \
	pre=ghc-${MODGHC_VER}.$$(cat VERSION_DATE) && \
	suf=unknown-openbsd.tar.bz2 && \
	mv "$$pre-x86_64-$$suf" "$$pre-amd64-$$suf" || true

.include <bsd.port.mk>
