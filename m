Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9EC6B6014
	for <lists+nbd@lfdr.de>; Sat, 11 Mar 2023 20:15:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DDC552061B; Sat, 11 Mar 2023 19:15:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Mar 11 19:15:16 2023
Old-Return-Path: <pastalian46@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D37E8205FC
	for <lists-other-nbd@bendel.debian.org>; Sat, 11 Mar 2023 18:59:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.829 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4WLbc3rtyMSa for <lists-other-nbd@bendel.debian.org>;
	Sat, 11 Mar 2023 18:59:09 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BC7E6205F8
	for <nbd@other.debian.org>; Sat, 11 Mar 2023 18:59:06 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id mg1so218919pjb.0
        for <nbd@other.debian.org>; Sat, 11 Mar 2023 10:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678561143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4w6kyoFHjJ9jT6IRPIFP/4s3PDuUwePfPS3lSuan710=;
        b=GBNhosVaLt3G44G55jA7D7LIWGCPcWOdTVwHdQHt/7DhfPgUWHPt9EIsC3WK/rn8u3
         bFMwiZp1C5OrK41T4CH0lFKNhL691yjWrtkckyYPHt3P3k2HCIUHN28VlbNBbeJvB1yl
         kfpuw+3WXddkiBTou5hZwq3rrhGwGYjhNIIIz5F19ZcfTNPjOgEEXLb28Vx5xCWPwYpi
         IkRtMstPmR2aIj1JZH80yjvxHZg2Vmrcp5DiJ2izDf4zlUMoIA2/lCKXj2qQ8fWsHcYs
         shFov9FQPOqsjkLBrQIC3gkyC8JwhTtv3t3SNQxABi5QK9jAGZxXJjmICEGpzxIcYokX
         v3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678561143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4w6kyoFHjJ9jT6IRPIFP/4s3PDuUwePfPS3lSuan710=;
        b=EmBlZrZXM7oOXzb8PyB/r4Q7klhg0jeR94DZRnZ87sU4RXBRIu2a0DLkBZQIXlb0yJ
         cRwA/OijurVkjp94n1q9exXJh62qPHxv/+xyxX8OWVU+L3Sb8f6LwB4mayBXVw1J46XD
         SMYqo4GLFEDXBU1LICRF0yHRlWr9qyvYylw7uethlIQ4pOsBA9NSmD/qI+Wue5F2APSm
         4fgmRkdHRfuyIvgBU56go7SbYUKXQGRdbFmEyRlI3conDbv5o4xft8+E8jXJ0RbX/O/A
         5AljkmtP9kDm4ciwQpcStUl6p/mAzJ1KHPu2i4JcCRJljPkM5I/FZxKDa34fGKJIV0Kj
         KA4Q==
X-Gm-Message-State: AO0yUKV/E6kE3u3uCcDRiehhhOXxfIrTcQPAb7KehaTr9QXKsqrQ4nRs
	vQWiaBtGEVsF7yAdFUVgF4Z0Z4ZICKtgiQ==
X-Google-Smtp-Source: AK7set9jse+1Y+V+rZDM6b/TN2jOOjDWVdKfuGqkc95Gnkv7vMLOLgnQ6bd6+V8/RD6WxUiqSPTDVg==
X-Received: by 2002:a17:90b:1988:b0:23a:8d2f:5994 with SMTP id mv8-20020a17090b198800b0023a8d2f5994mr28350404pjb.14.1678561143086;
        Sat, 11 Mar 2023 10:59:03 -0800 (PST)
Received: from localhost.localdomain ([2405:6583:30c0:2d00:2ef0:5dff:fe9e:61e8])
        by smtp.gmail.com with ESMTPSA id b13-20020a17090a550d00b00231227781d5sm1866268pji.2.2023.03.11.10.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 10:59:02 -0800 (PST)
From: Takuya Wakazono <pastalian46@gmail.com>
To: nbd@other.debian.org
Cc: pastalian <pastalian46@gmail.com>
Subject: [PATCH] nbd-server: raise glib version requirement
Date: Sun, 12 Mar 2023 03:58:20 +0900
Message-Id: <20230311185820.29639-1-pastalian46@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UnCRlPpsMQL.A.HOG.ENNDkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2382
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230311185820.29639-1-pastalian46@gmail.com
Resent-Date: Sat, 11 Mar 2023 19:15:16 +0000 (UTC)

From: pastalian <pastalian46@gmail.com>

g_array_set_clear_func is only available since glib 2.32, so nbd-server
cannot be compiled with lower versions of glib.
This bump also makes previous workaround for old glib (dace3ad)
unnecessary.

Signed-off-by: Takuya Wakazono <pastalian46@gmail.com>
---
 configure.ac | 15 +--------------
 nbd-server.c |  7 -------
 2 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/configure.ac b/configure.ac
index 62e56f4..8d72e46 100644
--- a/configure.ac
+++ b/configure.ac
@@ -286,7 +286,7 @@ AC_CHECK_HEADERS([sys/mount.h],,,
 [[#include <sys/param.h>
 ]])
 AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h sys/ioctl.h sys/socket.h syslog.h linux/types.h sys/dirent.h sys/uio.h])
-PKG_CHECK_MODULES(GLIB, [glib-2.0 >= 2.26.0 gthread-2.0 >= 2.26.0], [HAVE_GLIB=yes], AC_MSG_ERROR([Missing glib]))
+PKG_CHECK_MODULES(GLIB, [glib-2.0 >= 2.32.0 gthread-2.0 >= 2.32.0], [HAVE_GLIB=yes], AC_MSG_ERROR([Missing glib]))
 PKG_CHECK_MODULES(SW, [socket_wrapper], [HAVE_SW=yes], [HAVE_SW=no])
 PKG_CHECK_MODULES(NW, [nss_wrapper], [HAVE_NW=yes], [HAVE_NW=no])
 AM_CONDITIONAL(CWRAP, test "$HAVE_SW" = "yes" -a "$HAVE_NW" = "yes")
@@ -295,19 +295,6 @@ my_save_cflags="$CFLAGS"
 my_save_libs="$LIBS"
 CFLAGS="-Wdeprecated-declarations -Werror $GLIB_CFLAGS"
 LIBS="$GLIB_LIBS"
-AC_MSG_CHECKING([if we are using an old glib 2.0 library])
-AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
-	[[#include <glib.h>]],
-	[[g_thread_init(NULL);]])],
-	[
-		AC_MSG_RESULT(yes)
-		AC_DEFINE(HAVE_OLD_GLIB, 1, [Define to 1 if you have an old glib library])
-	],
-	[
-		AC_MSG_RESULT(no)
-		AC_DEFINE(HAVE_OLD_GLIB, 0, [Define to 1 if you have an old glib library])
-	]
-)
 dnl g_memdup2 added in glib-2.68
 AC_CHECK_FUNCS([g_memdup2])
 CFLAGS="$my_save_cflags"
diff --git a/nbd-server.c b/nbd-server.c
index 5787ddc..f942044 100644
--- a/nbd-server.c
+++ b/nbd-server.c
@@ -116,10 +116,6 @@
 
 #include <glib.h>
 
-#if HAVE_OLD_GLIB
-#include <pthread.h>
-#endif
-
 /* used in cliserv.h, so must come first */
 #define MY_NAME "nbd_server"
 #include "cliserv.h"
@@ -3708,9 +3704,6 @@ int main(int argc, char *argv[]) {
 	}
 	if (!nodaemon)
 		daemonize();
-#if HAVE_OLD_GLIB
-	g_thread_init(NULL);
-#endif
 	tpool = g_thread_pool_new(handle_request, NULL, genconf.threads, FALSE, NULL);
 
 	setup_servers(servers, genconf.modernaddr, genconf.modernport,
-- 
2.39.2

