Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6784D3FF378
	for <lists+nbd@lfdr.de>; Thu,  2 Sep 2021 20:52:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EEB2820686; Thu,  2 Sep 2021 18:52:38 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep  2 18:52:38 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 24AF920625
	for <lists-other-nbd@bendel.debian.org>; Thu,  2 Sep 2021 18:52:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.528 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.747, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tlJidciQxbls for <lists-other-nbd@bendel.debian.org>;
	Thu,  2 Sep 2021 18:52:24 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 5F1482062F
	for <nbd@other.debian.org>; Thu,  2 Sep 2021 18:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630608738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lO0jMx5w1pWgFi2pDrnyaVQYj3TxU4MrokEAbJ+IgRU=;
	b=JB/12rHx4RgHWo1hYo0AKClh8dnwPP7Gx4YF16xT7EdLQqoW9/wfLhcCjpOyjlkehRMphp
	gyagX+MK/d42CixXPXSAZei5jMhi4D+y74w1LQYT5TQ3GoBC8SCP0UmMRmBzC+DL3F0Wgw
	N4IW1Xr7AiOvyBfXL58G+C/umvjWsC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-aG6Nz5ATPUGAl5gIburVKA-1; Thu, 02 Sep 2021 14:52:08 -0400
X-MC-Unique: aG6Nz5ATPUGAl5gIburVKA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D183B1006C96
	for <nbd@other.debian.org>; Thu,  2 Sep 2021 18:52:07 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9EF7F5C23A
	for <nbd@other.debian.org>; Thu,  2 Sep 2021 18:52:07 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Subject: [PATCH] server: Avoid deprecated g_memdup
Date: Thu,  2 Sep 2021 13:52:07 -0500
Message-Id: <20210902185207.959912-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <1_1HqQrgxOH.A.0yB.21RMhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1361
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210902185207.959912-1-eblake@redhat.com
Resent-Date: Thu,  2 Sep 2021 18:52:38 +0000 (UTC)

glib now recommends that we use g_memdup2() to avoid accidental 32-bit
truncation bugs on platforms where g_size is larger than guint:

https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

and failure to do so causes noisy compilation due to deprecation
warnings with glib 2.68:

nbd-server.c: In function ‘parse_cfile’:
nbd-server.c:1010:25: warning: ‘g_memdup’ is deprecated: Use 'g_memdup2' instead [-Wdeprecated-declarations]
 1010 |                         SERVER *srv = serve_inc_ref(g_memdup(&s, sizeof(SERVER)));
      |                         ^~~~~~
In file included from /usr/include/glib-2.0/glib.h:82,
                 from nbd-server.c:117:
/usr/include/glib-2.0/glib/gstrfuncs.h:257:23: note: declared here
  257 | gpointer              g_memdup         (gconstpointer mem,
      |                       ^~~~~~~~

Of course, we still want to build on platforms with older glib that
lack g_memdup2().  Thankfully, it's easy enough to audit that all our
current uses of g_memdup() do not overflow 32 bits.
---
 configure.ac | 5 +++++
 nbd-server.c | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 48ba507..9504899 100644
--- a/configure.ac
+++ b/configure.ac
@@ -292,7 +292,9 @@ AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h sys/ioctl.h sys/socke
 PKG_CHECK_MODULES(GLIB, [glib-2.0 >= 2.26.0 gthread-2.0 >= 2.26.0], [HAVE_GLIB=yes], AC_MSG_ERROR([Missing glib]))

 my_save_cflags="$CFLAGS"
+my_save_libs="$LIBS"
 CFLAGS="-Wdeprecated-declarations -Werror $GLIB_CFLAGS"
+LIBS="$GLIB_LIBS"
 AC_MSG_CHECKING([if we are using an old glib 2.0 library])
 AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
 	[[#include <glib.h>]],
@@ -306,7 +308,10 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
 		AC_DEFINE(HAVE_OLD_GLIB, 0, [Define to 1 if you have an old glib library])
 	]
 )
+dnl g_memdup2 added in glib-2.68
+AC_CHECK_FUNCS([g_memdup2])
 CFLAGS="$my_save_cflags"
+LIBS="$my_save_libs"

 AC_MSG_CHECKING([whether _BSD_SOURCE needs to be defined for DT_* macros])
 AC_PREPROC_IFELSE(
diff --git a/nbd-server.c b/nbd-server.c
index 0b32bcd..1eff99d 100644
--- a/nbd-server.c
+++ b/nbd-server.c
@@ -154,6 +154,11 @@
 #include <gnutls/x509.h>
 #endif

+#ifndef HAVE_G_MEMDUP2
+/* Our uses of g_memdup2 below are safe from g_memdup's 32-bit overflow */
+#define g_memdup2 g_memdup
+#endif
+
 /** Where our config file actually is */
 gchar* config_file_pos;

@@ -1007,7 +1012,7 @@ GArray* parse_cfile(gchar* f, struct generic_conf *const genconf, bool expect_ge
 		if(i>0 || !expect_generic) {
 			s.servename = groups[i];

-			SERVER *srv = serve_inc_ref(g_memdup(&s, sizeof(SERVER)));
+			SERVER *srv = serve_inc_ref(g_memdup2(&s, sizeof(SERVER)));
 			g_array_append_val(retval, srv);
 		}
 #ifndef WITH_SDP
-- 
2.31.1

