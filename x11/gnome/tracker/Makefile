# $OpenBSD: Makefile,v 1.104 2012/05/04 09:16:04 ajacoutot Exp $

# XXX Binary files patch-src_tracker-control_tracker-control-general_c
# and patch-src_tracker-control_tracker-control-general_c.new differ
DIFF_ARGS=	-a

SHARED_ONLY=	Yes

COMMENT-main=		powerful desktop search tool and indexer
COMMENT-evolution=	(meta-)tracker indexer plugin for evolution
COMMENT-nautilus=	(meta-)tracker tagging plugin for nautilus

GNOME_PROJECT=	tracker
GNOME_VERSION=	0.14.1

# there is already audio/tracker, so this port has to live
# as meta-tracker.
PKGNAME=	meta-tracker-${VERSION}

PKGNAME-main=		meta-tracker-${VERSION}
PKGNAME-evolution=	evolution-meta-tracker-${VERSION}
PKGNAME-nautilus=	nautilus-meta-tracker-${VERSION}

REVISION-evolution=	0

# Only get the first x.y which is needed in the PLIST.
# NOTE: when MAJ_V changes, increment TRACKER_VERSION accordingly and bump:
# net/telepathy/folks
# x11/gnome/grilo-plugins
MAJ_V=		${GNOME_VERSION:C/^([0-9]+\.[0-9]+).*/\1/}

EVO_VERSION=	3.4
SUBST_VARS=	MAJ_V EVO_VERSION

SHARED_LIBS +=  tracker-common       2.0      # 1400.0
SHARED_LIBS +=  tracker-data         2.0      # 1400.0
SHARED_LIBS +=  tracker-sparql-0.14  0.0      # 1400.0
SHARED_LIBS +=  tracker-extract-0.14 0.0      # 1400.0
SHARED_LIBS +=  tracker-miner-0.14   0.0      # 1400.0

HOMEPAGE=	http://tracker-project.org/

# GPLv2+
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MODULES=	devel/gettext \
		x11/gnome \
		devel/dconf \
		lang/python

MULTI_PACKAGES=	-main -evolution -nautilus

WANTLIB += GL X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender Xxf86vm drm expat ffi fontconfig
WANTLIB += freetype gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 gthread-2.0
WANTLIB += kvm m pcre pixman-1 pthread-stubs xcb xcb-render xcb-shm
WANTLIB += z

WANTLIB-main += ${WANTLIB}
WANTLIB-main += archive atk-1.0 bz2 c cairo cairo-gobject
WANTLIB-main += dbus-1 dbus-glib-1 e2fs-uuid enca exempi exif gconf-2
WANTLIB-main += gcrypt gdk-3 gdk_pixbuf-2.0 gee gif gmime-2.6
WANTLIB-main += gnome-keyring gpg-error gsf-1 gtk-3 icudata
WANTLIB-main += icui18n icuuc jpeg lcms lzma openjpeg panel-applet-4 cue
WANTLIB-main += pango-1.0 pangocairo-1.0 pangoft2-1.0 png poppler poppler-glib
WANTLIB-main += pthread rest-0.7 soup-2.4 soup-gnome-2.4 sqlite3 stdc++
WANTLIB-main += tag tag_c tiff totem-plparser upower-glib xml2
WANTLIB-main += gstbase-0.10 gstpbutils-0.10 gstreamer-0.10 gsttag-0.10
WANTLIB-main += crypto curl idn lua quvi ssl

WANTLIB-evolution += ${WANTLIB}
WANTLIB-evolution += asn1 atk-1.0 cairo cairo-gobject camel-1.2
WANTLIB-evolution += com_err crypto dbus-1 e2fs-uuid
WANTLIB-evolution += ebook-1.2 ecal-1.2 edataserver-1.2 edataserverui-3.0
WANTLIB-evolution += enchant gailutil-3 gconf-2 gcrypt gdk-3 gdk_pixbuf-2.0
WANTLIB-evolution += gnome-keyring gpg-error gssapi gtk-3
WANTLIB-evolution += gtkhtml-4.0 gtkhtml-editor-4.0 ical icalss icalvcal
WANTLIB-evolution += icui18n icuuc krb5 nspr4 nss3 nssutil3 pango-1.0 pangocairo-1.0
WANTLIB-evolution += pangoft2-1.0 plc4 plds4 png smime3 softokn3 soup-2.4
WANTLIB-evolution += sqlite3 ssl3 stdc++ tracker-miner-0.14 tracker-sparql-0.14
WANTLIB-evolution += xml2 dbus-glib-1 ICE SM db ebackend-1.2 gnome-desktop-3
WANTLIB-evolution += lib/tracker-${MAJ_V}/tracker-common
WANTLIB-evolution += lib/tracker-${MAJ_V}/tracker-data
WANTLIB-evolution += lib/evolution/${EVO_VERSION}/emiscwidgets
WANTLIB-evolution += lib/evolution/${EVO_VERSION}/email-engine
WANTLIB-evolution += lib/evolution/${EVO_VERSION}/email-utils
WANTLIB-evolution += lib/evolution/${EVO_VERSION}/eshell
WANTLIB-evolution += lib/evolution/${EVO_VERSION}/etable
WANTLIB-evolution += lib/evolution/${EVO_VERSION}/etext
WANTLIB-evolution += lib/evolution/${EVO_VERSION}/eutil
WANTLIB-evolution += lib/evolution/${EVO_VERSION}/evolution-a11y
WANTLIB-evolution += lib/evolution/${EVO_VERSION}/filter
WANTLIB-evolution += lib/evolution/${EVO_VERSION}/gnomecanvas
WANTLIB-evolution += lib/evolution/${EVO_VERSION}/menus

WANTLIB-nautilus += ${WANTLIB}
WANTLIB-nautilus += atk-1.0 cairo cairo-gobject e2fs-uuid gdk-3 gdk_pixbuf-2.0
WANTLIB-nautilus += gtk-3 icui18n icuuc nautilus-extension pango-1.0 pangocairo-1.0
WANTLIB-nautilus += pangoft2-1.0 png sqlite3 tracker-sparql-0.14 stdc++
WANTLIB-nautilus += lib/tracker-${MAJ_V}/tracker-common
WANTLIB-nautilus += lib/tracker-${MAJ_V}/tracker-data

LIB_DEPENDS-main=	${LIB_DEPENDS} \
			x11/gnome/panel \
			x11/gnome/totem-pl-parser \
			print/poppler \
			devel/libgsf \
			devel/libgee06 \
			net/librest \
			sysutils/upower \
			textproc/exempi \
			sysutils/e2fsprogs \
			graphics/libexif \
			graphics/libungif \
			audio/libcue

RUN_DEPENDS-evolution=	${MODGETTEXT_RUN_DEPENDS}
LIB_DEPENDS-evolution=	${LIB_DEPENDS} \
			x11/gnome/tracker,-main \
			mail/evolution,-main>=3.4.0

RUN_DEPENDS-nautilus=	${MODGETTEXT_RUN_DEPENDS}
LIB_DEPENDS-nautilus=	${LIB_DEPENDS} \
			x11/gnome/tracker,-main \
			x11/gnome/nautilus>=3.0.0

LIBTOOL_FLAGS=	--tag=disable-static

MODGNOME_TOOLS= 	goi vala
MODGNOME_DESKTOP_FILE=	Yes
MODGNOME_ICON_CACHE=	Yes
MODPY_BUILDDEP=		No
MODPY_RUNDEP=		No

MODPY_ADJ_FILES=	tests/tracker-writeback/01-writeback.py

CONFIGURE_ARGS=	--disable-static \
		--disable-functional-tests \
		--disable-miner-thunderbird \
		--disable-miner-firefox \
		--disable-network-manager \
		--disable-qt

# needs libgrss
CONFIGURE_ARGS += --disable-miner-rss

# needs libiptcdata
CONFIGURE_ARGS += --disable-libiptcdata

MODGNOME_LDFLAGS=	-Wl,-rpath,${TRUEPREFIX}/lib/tracker-${MAJ_V}

FAKE_FLAGS=	sysconfdir=${PREFIX}/share/examples/meta-tracker/

pre-configure:
	${SUBST_CMD} ${WRKSRC}/src/tracker-needle/tracker-utils.vala

.include <bsd.port.mk>
