# $OpenBSD: Makefile,v 1.51 2012/04/30 09:39:26 ajacoutot Exp $

COMMENT=		flexible communications framework, xmpp component

DISTNAME=		telepathy-gabble-0.16.0
REVISION=		2

MASTER_SITES=		${MASTER_SITES_TP:=telepathy-gabble/}

WANTLIB += c dbus-1 dbus-glib-1 e2fs-uuid ffi gio-2.0 glib-2.0
WANTLIB += gmodule-2.0 gmp gnutls gobject-2.0 gssdp-1.0 gthread-2.0
WANTLIB += gupnp-1.0 gupnp-igd-1.0 hogweed m nettle nice p11-kit
WANTLIB += pcre pthread soup-2.4 sqlite3 tasn1 telepathy-glib
WANTLIB += xml2 z

MODULES=		devel/gettext \
			lang/python

BUILD_DEPENDS=		textproc/libxslt

LIB_DEPENDS=		devel/libsoup \
			net/libnice>=0.1.2 \
			net/telepathy/telepathy-glib>=0.18.0

# needed for the tests
BUILD_DEPENDS +=	devel/py-twisted/words \
			x11/dbus-python

# bin/telepathy-gabble-xmpp-console
RUN_DEPENDS +=		devel/py-gobject3

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS=		--with-ca-certificates=/etc/ssl/cert.pem \
			--disable-gtk-doc \
			--disable-Werror \
			--enable-plugins

MODGNU_CONFIG_GUESS_DIRS= ${WRKSRC} ${WRKSRC}/lib/ext/wocky

.include <bsd.port.mk>
