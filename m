Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CC69B23A
	for <lists+nbd@lfdr.de>; Fri, 23 Aug 2019 16:38:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C751120425; Fri, 23 Aug 2019 14:38:01 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 23 14:38:01 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0F6E8204F3
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Aug 2019 14:37:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QFUOkzUERwcV for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Aug 2019 14:37:41 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E933F204EF
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 14:37:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B74E106E289;
	Fri, 23 Aug 2019 14:37:37 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 079B16CE5B;
	Fri, 23 Aug 2019 14:37:36 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: nbd@other.debian.org,
	libguestfs@redhat.com,
	qemu-block@nongnu.org (open list:Network Block Dev...)
Subject: [PATCH 5/5] nbd: Tolerate more errors to structured reply request
Date: Fri, 23 Aug 2019 09:37:26 -0500
Message-Id: <20190823143726.27062-6-eblake@redhat.com>
In-Reply-To: <20190823143726.27062-1-eblake@redhat.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Fri, 23 Aug 2019 14:37:37 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <c-SHPwjNEZG.A.LkC.Jp_XdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/638
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190823143726.27062-6-eblake@redhat.com
Resent-Date: Fri, 23 Aug 2019 14:38:01 +0000 (UTC)

A server may have a reason to reject a request for structured replies,
beyond just not recognizing them as a valid request.  It doesn't hurt
us to continue talking to such a server; otherwise 'qemu-nbd --list'
of such a server fails to display all possible details about the
export.

Encountered when temporarily tweaking nbdkit to reply with
NBD_REP_ERR_POLICY.  Present since structured reply support was first
added (commit d795299b reused starttls handling, but starttls has to
reject all errors).

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/client.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/nbd/client.c b/nbd/client.c
index 49bf9906f94b..92444f5e9a62 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -1,5 +1,5 @@
 /*
- *  Copyright (C) 2016-2018 Red Hat, Inc.
+ *  Copyright (C) 2016-2019 Red Hat, Inc.
  *  Copyright (C) 2005  Anthony Liguori <anthony@codemonkey.ws>
  *
  *  Network Block Device Client Side
@@ -142,17 +142,19 @@ static int nbd_receive_option_reply(QIOChannel *ioc, uint32_t opt,
     return 0;
 }

-/* If reply represents success, return 1 without further action.
- * If reply represents an error, consume the optional payload of
- * the packet on ioc.  Then return 0 for unsupported (so the client
- * can fall back to other approaches), or -1 with errp set for other
- * errors.
+/*
+ * If reply represents success, return 1 without further action.  If
+ * reply represents an error, consume the optional payload of the
+ * packet on ioc.  Then return 0 for unsupported (so the client can
+ * fall back to other approaches), where @strict determines if only
+ * ERR_UNSUP or all errors fit that category, or -1 with errp set for
+ * other errors.
  */
 static int nbd_handle_reply_err(QIOChannel *ioc, NBDOptionReply *reply,
-                                Error **errp)
+                                bool strict, Error **errp)
 {
     char *msg = NULL;
-    int result = -1;
+    int result = strict ? -1 : 0;

     if (!(reply->type & (1 << 31))) {
         return 1;
@@ -163,6 +165,7 @@ static int nbd_handle_reply_err(QIOChannel *ioc, NBDOptionReply *reply,
             error_setg(errp, "server error %" PRIu32
                        " (%s) message is too long",
                        reply->type, nbd_rep_lookup(reply->type));
+            result = -1;
             goto cleanup;
         }
         msg = g_malloc(reply->length + 1);
@@ -170,6 +173,7 @@ static int nbd_handle_reply_err(QIOChannel *ioc, NBDOptionReply *reply,
             error_prepend(errp, "Failed to read option error %" PRIu32
                           " (%s) message: ",
                           reply->type, nbd_rep_lookup(reply->type));
+            result = -1;
             goto cleanup;
         }
         msg[reply->length] = '\0';
@@ -258,7 +262,7 @@ static int nbd_receive_list(QIOChannel *ioc, char **name, char **description,
     if (nbd_receive_option_reply(ioc, NBD_OPT_LIST, &reply, errp) < 0) {
         return -1;
     }
-    error = nbd_handle_reply_err(ioc, &reply, errp);
+    error = nbd_handle_reply_err(ioc, &reply, true, errp);
     if (error <= 0) {
         return error;
     }
@@ -371,7 +375,7 @@ static int nbd_opt_info_or_go(QIOChannel *ioc, uint32_t opt,
         if (nbd_receive_option_reply(ioc, opt, &reply, errp) < 0) {
             return -1;
         }
-        error = nbd_handle_reply_err(ioc, &reply, errp);
+        error = nbd_handle_reply_err(ioc, &reply, true, errp);
         if (error <= 0) {
             return error;
         }
@@ -546,12 +550,15 @@ static int nbd_receive_query_exports(QIOChannel *ioc,
     }
 }

-/* nbd_request_simple_option: Send an option request, and parse the reply
+/*
+ * nbd_request_simple_option: Send an option request, and parse the reply.
+ * @strict controls whether ERR_UNSUP or all errors produce 0 status.
  * return 1 for successful negotiation,
  *        0 if operation is unsupported,
  *        -1 with errp set for any other error
  */
-static int nbd_request_simple_option(QIOChannel *ioc, int opt, Error **errp)
+static int nbd_request_simple_option(QIOChannel *ioc, int opt, bool strict,
+                                     Error **errp)
 {
     NBDOptionReply reply;
     int error;
@@ -563,7 +570,7 @@ static int nbd_request_simple_option(QIOChannel *ioc, int opt, Error **errp)
     if (nbd_receive_option_reply(ioc, opt, &reply, errp) < 0) {
         return -1;
     }
-    error = nbd_handle_reply_err(ioc, &reply, errp);
+    error = nbd_handle_reply_err(ioc, &reply, strict, errp);
     if (error <= 0) {
         return error;
     }
@@ -595,7 +602,7 @@ static QIOChannel *nbd_receive_starttls(QIOChannel *ioc,
     QIOChannelTLS *tioc;
     struct NBDTLSHandshakeData data = { 0 };

-    ret = nbd_request_simple_option(ioc, NBD_OPT_STARTTLS, errp);
+    ret = nbd_request_simple_option(ioc, NBD_OPT_STARTTLS, true, errp);
     if (ret <= 0) {
         if (ret == 0) {
             error_setg(errp, "Server don't support STARTTLS option");
@@ -695,7 +702,7 @@ static int nbd_receive_one_meta_context(QIOChannel *ioc,
         return -1;
     }

-    ret = nbd_handle_reply_err(ioc, &reply, errp);
+    ret = nbd_handle_reply_err(ioc, &reply, true, errp);
     if (ret <= 0) {
         return ret;
     }
@@ -951,7 +958,7 @@ static int nbd_start_negotiate(AioContext *aio_context, QIOChannel *ioc,
             if (structured_reply) {
                 result = nbd_request_simple_option(ioc,
                                                    NBD_OPT_STRUCTURED_REPLY,
-                                                   errp);
+                                                   false, errp);
                 if (result < 0) {
                     return -EINVAL;
                 }
-- 
2.21.0

