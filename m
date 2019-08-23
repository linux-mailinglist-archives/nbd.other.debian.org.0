Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A39E29B241
	for <lists+nbd@lfdr.de>; Fri, 23 Aug 2019 16:38:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 63224204F0; Fri, 23 Aug 2019 14:38:53 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 23 14:38:53 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 50DD820384
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Aug 2019 14:38:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JohefZgj74cB for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Aug 2019 14:38:44 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id AB638204E7
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 14:38:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 821C980F7C;
	Fri, 23 Aug 2019 14:38:40 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 10F3B60A9F;
	Fri, 23 Aug 2019 14:38:40 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH 1/1] api: Add support for FAST_ZERO flag
Date: Fri, 23 Aug 2019 09:38:36 -0500
Message-Id: <20190823143836.27321-2-eblake@redhat.com>
In-Reply-To: <20190823143836.27321-1-eblake@redhat.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143836.27321-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 23 Aug 2019 14:38:40 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <C8qYNJm66HK.A.-oC.9p_XdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/640
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190823143836.27321-2-eblake@redhat.com
Resent-Date: Fri, 23 Aug 2019 14:38:53 +0000 (UTC)

Qemu was able to demonstrate that knowing whether a zero operation is
fast is useful when copying from one image to another: there is a
choice between bulk pre-zeroing and then revisiting the data sections
(fewer transactions, but depends on the zeroing to be fast),
vs. visiting every portion of the disk only once (more transactions,
but no time lost to duplicated I/O due to slow zeroes).  As such, the
NBD protocol is adding an extension to allow clients to request fast
failure when zero is not efficient, from servers that advertise
support for the new flag.

In libnbd, this results in the addition of a new flag, a new functoin
nbd_can_fast_zero, and the ability to use the new flag in nbd_zero
variants.  It also enhances the testsuite to test the flag against
new enough nbdkit, which is being patched at the same time.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 lib/nbd-protocol.h     |  2 ++
 generator/generator    | 29 +++++++++++++++++++++++------
 lib/flags.c            | 12 ++++++++++++
 lib/protocol.c         |  1 +
 lib/rw.c               |  9 ++++++++-
 tests/Makefile.am      | 20 ++++++++++++++++++++
 tests/eflags-plugin.sh |  5 +++++
 7 files changed, 71 insertions(+), 7 deletions(-)

diff --git a/lib/nbd-protocol.h b/lib/nbd-protocol.h
index 3e3fb4e..04e93d3 100644
--- a/lib/nbd-protocol.h
+++ b/lib/nbd-protocol.h
@@ -108,6 +108,7 @@ struct nbd_fixed_new_option_reply {
 #define NBD_FLAG_SEND_DF           (1 << 7)
 #define NBD_FLAG_CAN_MULTI_CONN    (1 << 8)
 #define NBD_FLAG_SEND_CACHE        (1 << 10)
+#define NBD_FLAG_SEND_FAST_ZERO    (1 << 11)

 /* NBD options (new style handshake only). */
 #define NBD_OPT_EXPORT_NAME        1
@@ -250,6 +251,7 @@ struct nbd_structured_reply_error {
 #define NBD_EINVAL     22
 #define NBD_ENOSPC     28
 #define NBD_EOVERFLOW  75
+#define NBD_ENOTSUP    95
 #define NBD_ESHUTDOWN 108

 #endif /* NBD_PROTOCOL_H */
diff --git a/generator/generator b/generator/generator
index c509573..9b1f5d8 100755
--- a/generator/generator
+++ b/generator/generator
@@ -958,10 +958,11 @@ let all_enums = [ tls_enum ]
 let cmd_flags = {
   flag_prefix = "CMD_FLAG";
   flags = [
-    "FUA",     1 lsl 0;
-    "NO_HOLE", 1 lsl 1;
-    "DF",      1 lsl 2;
-    "REQ_ONE", 1 lsl 3;
+    "FUA",       1 lsl 0;
+    "NO_HOLE",   1 lsl 1;
+    "DF",        1 lsl 2;
+    "REQ_ONE",   1 lsl 3;
+    "FAST_ZERO", 1 lsl 4;
   ]
 }
 let all_flags = [ cmd_flags ]
@@ -1389,6 +1390,19 @@ the server does not."
 ^ non_blocking_test_call_description;
   };

+  "can_fast_zero", {
+    default_call with
+    args = []; ret = RBool;
+    permitted_states = [ Connected; Closed ];
+    shortdesc = "does the server support the fast zero flag?";
+    longdesc = "\
+Returns true if the server supports the use of the
+C<LIBNBD_CMD_FLAG_FAST_ZERO> flag to the zero command
+(see C<nbd_zero>, C<nbd_aio_zero>).  Returns false if
+the server does not."
+^ non_blocking_test_call_description;
+  };
+
   "can_df", {
     default_call with
     args = []; ret = RBool;
@@ -1668,9 +1682,12 @@ The C<flags> parameter may be C<0> for no flags, or may contain
 C<LIBNBD_CMD_FLAG_FUA> meaning that the server should not
 return until the data has been committed to permanent storage
 (if that is supported - some servers cannot do this, see
-L<nbd_can_fua(3)>), and/or C<LIBNBD_CMD_FLAG_NO_HOLE> meaning that
+L<nbd_can_fua(3)>), C<LIBNBD_CMD_FLAG_NO_HOLE> meaning that
 the server should favor writing actual allocated zeroes over
-punching a hole.";
+punching a hole, and/or C<LIBNBD_CMD_FLAG_FAST_ZERO> meaning
+that the server must fail quickly if writing zeroes is no
+faster than a normal write (if that is supported - some servers
+cannot do this, see L<nbd_can_fast_zero(3)>).";
   };

   "block_status", {
diff --git a/lib/flags.c b/lib/flags.c
index 2bcacb8..d55d10a 100644
--- a/lib/flags.c
+++ b/lib/flags.c
@@ -47,6 +47,12 @@ nbd_internal_set_size_and_flags (struct nbd_handle *h,
     eflags &= ~NBD_FLAG_SEND_DF;
   }

+  if (eflags & NBD_FLAG_SEND_FAST_ZERO &&
+      !(eflags & NBD_FLAG_SEND_WRITE_ZEROES)) {
+    debug (h, "server lacks write zeroes, ignoring claim of fast zero");
+    eflags &= ~NBD_FLAG_SEND_FAST_ZERO;
+  }
+
   h->exportsize = exportsize;
   h->eflags = eflags;
   return 0;
@@ -100,6 +106,12 @@ nbd_unlocked_can_zero (struct nbd_handle *h)
   return get_flag (h, NBD_FLAG_SEND_WRITE_ZEROES);
 }

+int
+nbd_unlocked_can_fast_zero (struct nbd_handle *h)
+{
+  return get_flag (h, NBD_FLAG_SEND_FAST_ZERO);
+}
+
 int
 nbd_unlocked_can_df (struct nbd_handle *h)
 {
diff --git a/lib/protocol.c b/lib/protocol.c
index 6087887..acee203 100644
--- a/lib/protocol.c
+++ b/lib/protocol.c
@@ -36,6 +36,7 @@ nbd_internal_errno_of_nbd_error (uint32_t error)
   case NBD_EINVAL: return EINVAL;
   case NBD_ENOSPC: return ENOSPC;
   case NBD_EOVERFLOW: return EOVERFLOW;
+  case NBD_ENOTSUP: return ENOTSUP;
   case NBD_ESHUTDOWN: return ESHUTDOWN;
   default: return EINVAL;
   }
diff --git a/lib/rw.c b/lib/rw.c
index d427681..adb6bc2 100644
--- a/lib/rw.c
+++ b/lib/rw.c
@@ -426,7 +426,8 @@ nbd_unlocked_aio_zero (struct nbd_handle *h,
     return -1;
   }

-  if ((flags & ~(LIBNBD_CMD_FLAG_FUA | LIBNBD_CMD_FLAG_NO_HOLE)) != 0) {
+  if ((flags & ~(LIBNBD_CMD_FLAG_FUA | LIBNBD_CMD_FLAG_NO_HOLE |
+                 LIBNBD_CMD_FLAG_FAST_ZERO)) != 0) {
     set_error (EINVAL, "invalid flag: %" PRIu32, flags);
     return -1;
   }
@@ -437,6 +438,12 @@ nbd_unlocked_aio_zero (struct nbd_handle *h,
     return -1;
   }

+  if ((flags & LIBNBD_CMD_FLAG_FAST_ZERO) != 0 &&
+      nbd_unlocked_can_fast_zero (h) != 1) {
+    set_error (EINVAL, "server does not support the fast zero flag");
+    return -1;
+  }
+
   if (count == 0) {             /* NBD protocol forbids this. */
     set_error (EINVAL, "count cannot be 0");
     return -1;
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 2b4ea93..a7bc1b5 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -145,6 +145,8 @@ check_PROGRAMS += \
 	can-not-trim-flag \
 	can-zero-flag \
 	can-not-zero-flag \
+	can-fast-zero-flag \
+	can-not-fast-zero-flag \
 	can-multi-conn-flag \
 	can-not-multi-conn-flag \
 	can-cache-flag \
@@ -177,6 +179,8 @@ TESTS += \
 	can-not-trim-flag \
 	can-zero-flag \
 	can-not-zero-flag \
+	can-fast-zero-flag \
+	can-not-fast-zero-flag \
 	can-multi-conn-flag \
 	can-not-multi-conn-flag \
 	can-cache-flag \
@@ -289,6 +293,22 @@ can_not_zero_flag_CPPFLAGS = \
 can_not_zero_flag_CFLAGS = $(WARNINGS_CFLAGS)
 can_not_zero_flag_LDADD = $(top_builddir)/lib/libnbd.la

+can_fast_zero_flag_SOURCES = eflags.c
+can_fast_zero_flag_CPPFLAGS = \
+	-I$(top_srcdir)/include -Dflag=can_fast_zero \
+	-Drequire='"has_can_fast_zero=1"' \
+	$(NULL)
+can_fast_zero_flag_CFLAGS = $(WARNINGS_CFLAGS)
+can_fast_zero_flag_LDADD = $(top_builddir)/lib/libnbd.la
+
+can_not_fast_zero_flag_SOURCES = eflags.c
+can_not_fast_zero_flag_CPPFLAGS = \
+	-I$(top_srcdir)/include -Dflag=can_fast_zero -Dvalue=false \
+	-Drequire='"has_can_fast_zero=1"' \
+	$(NULL)
+can_not_fast_zero_flag_CFLAGS = $(WARNINGS_CFLAGS)
+can_not_fast_zero_flag_LDADD = $(top_builddir)/lib/libnbd.la
+
 can_multi_conn_flag_SOURCES = eflags.c
 can_multi_conn_flag_CPPFLAGS = \
 	-I$(top_srcdir)/include -Dflag=can_multi_conn \
diff --git a/tests/eflags-plugin.sh b/tests/eflags-plugin.sh
index 8fccff8..3c4cc65 100755
--- a/tests/eflags-plugin.sh
+++ b/tests/eflags-plugin.sh
@@ -52,6 +52,11 @@ case "$1" in
         # be read-only and methods like can_trim will never be called.
         exit 0
         ;;
+    can_zero)
+	# We have to default to answering this with true before
+	# can_fast_zero has an effect.
+	exit 0
+	;;
     *)
         exit 2
         ;;
-- 
2.21.0

