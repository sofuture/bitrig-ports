# $OpenBSD: java.port.mk,v 1.9 2006/11/20 19:28:18 espie Exp $

# Set MODJAVA_VER to x.y or x.y+ based on the version
# of the jdk needed for the port. x.y  means any x.y jdk.
# x.y+ means any x.y jdk or higher version. Valid values
# for x.y are 1.3, 1.4 or 1.5.

MODJAVA_VER?=

# Set MODJAVA_JRERUN=yes if the port can run with just
# the jre. This will add the jre's to the RUN_DEPENDS
# based on how MODJAVA_VER is set.

MODJAVA_JRERUN?=no

# Based on the MODJAVA_VER, MODJAVA_JRERUN, NO_BUILD
# and MACHINE_ARCH, the following things will be setup:
#   ONLY_FOR_ARCHS if not already set.
#   BUILD_DEPENDS on a jdk (native preferred).
#   JAVA_HOME to pass on to the port build.
#   RUN_DEPENDS for all jdk's and jre's that can run
#   the port.

.if ${MACHINE_ARCH} == "amd64" && (${MODJAVA_VER} == "1.3+" || ${MODJAVA_VER} == "1.4+")
# this is a special case for amd64. since amd64 doesn't have 1.3 or 1.4,
# but 1.5 can run any 1.3+ or 1.4+ port, so special case them to run
# on 1.5+ for amd64. Also add in jamvm and kaffe since they likely can
# run these too. 
   ONLY_FOR_ARCHS?= amd64
   JAVA_HOME= ${LOCALBASE}/jdk-1.5.0
.  if ${NO_BUILD:L} != "yes"
     BUILD_DEPENDS+= :jdk-1.5.0:devel/jdk/1.5
.  endif
.  if ${MODJAVA_JRERUN:L} == "yes"
     MODJAVA_RUN_DEPENDS= :jdk->=1.5.0|jre->=1.5.0|kaffe-*|jamvm-*:devel/jdk/1.5
.  else
     MODJAVA_RUN_DEPENDS= :jdk->=1.5.0|kaffe-*:devel/jdk/1.5
.  endif
.elif ${MODJAVA_VER:S/+//} == "1.3"
   ONLY_FOR_ARCHS?= arm i386 powerpc sparc
   JAVA_HOME= ${LOCALBASE}/jdk-1.3.1
.  if ${NO_BUILD:L} != "yes"
     BUILD_DEPENDS+= :jdk-1.3.1:devel/jdk/1.3
.  endif
.  if ${MODJAVA_JRERUN:L} == "yes"
.    if ${MODJAVA_VER} == "1.3+"
       _MODJAVA_RUNDEP= jdk-1.3.1*|jre-1.3.1*|jdk->=1.4.2p9|jre->=1.4.2p9|kaffe-*|jamvm-*
.    else
       _MODJAVA_RUNDEP= jdk-1.3.1|jre-1.3.1
.    endif
.  else
.    if ${MODJAVA_VER} == "1.3+"
       _MODJAVA_RUNDEP= jdk-1.3.1*|jdk->=1.4.2p9|kaffe-*
.    else
       _MODJAVA_RUNDEP= jdk-1.3.1
.    endif
.  endif
.  if ${MACHINE_ARCH} == "i386"
     MODJAVA_RUN_DEPENDS= :${_MODJAVA_RUNDEP}|jdk-linux-1.3.1*:devel/jdk/1.3
.  else
     MODJAVA_RUN_DEPENDS= :${_MODJAVA_RUNDEP}:devel/jdk/1.3
.  endif
.elif ${MODJAVA_VER:S/+//} == "1.4"
   ONLY_FOR_ARCHS?= i386
   JAVA_HOME= ${LOCALBASE}/jdk-1.4.2
.  if ${NO_BUILD:L} != "yes"
     BUILD_DEPENDS+= :jdk-1.4.2:devel/jdk/1.4
.  endif
.  if ${MODJAVA_JRERUN:L} == "yes"
.    if ${MODJAVA_VER} == "1.4+"
       MODJAVA_RUN_DEPENDS= :jdk->=1.4.2p9|jre->=1.4.2p9|kaffe-*|jamvm-*:devel/jdk/1.4
.    else
       MODJAVA_RUN_DEPENDS= :jdk->=1.4.2p9,<1.5|jre->=1.4.2p9,<1.5|kaffe-*|jamvm-*:devel/jdk/1.4
.    endif
.  else
.    if ${MODJAVA_VER} == "1.4+"
       MODJAVA_RUN_DEPENDS= :jdk->=1.4.2p9|kaffe-*:devel/jdk/1.4
.    else
       MODJAVA_RUN_DEPENDS= :jdk->=1.4.2p9,<1.5|kaffe-*:devel/jdk/1.4
.    endif
.  endif
.elif ${MODJAVA_VER:S/+//} == "1.5"
   ONLY_FOR_ARCHS?= i386 amd64
   JAVA_HOME= ${LOCALBASE}/jdk-1.5.0
.  if ${NO_BUILD:L} != "yes"
     BUILD_DEPENDS+= :jdk-1.5.0:devel/jdk/1.5
.  endif
.  if ${MODJAVA_JRERUN:L} == "yes"
     _MODJAVA_RUNDEP= jdk-1.5.0|jre-1.5.0
.  else
     _MODJAVA_RUNDEP= jdk-1.5.0
.  endif
.  if ${MODJAVA_VER} == "1.5+"
     MODJAVA_RUN_DEPENDS= :${_MODJAVA_RUNDEP:S/-/->=/g}:devel/jdk/1.5
.  else
     MODJAVA_RUN_DEPENDS= :${_MODJAVA_RUNDEP}:devel/jdk/1.5
.  endif
.else
   ERRORS+="Fatal: MODJAVA_VER must be set to a valid value."
.endif

RUN_DEPENDS+= ${MODJAVA_RUN_DEPENDS}
