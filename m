Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8326ED1C6
	for <lists+nbd@lfdr.de>; Mon, 24 Apr 2023 17:54:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4FD802078D; Mon, 24 Apr 2023 15:54:36 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 24 15:54:36 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C6D222076C
	for <lists-other-nbd@bendel.debian.org>; Mon, 24 Apr 2023 15:54:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.082 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HgHSCMptbZUN for <lists-other-nbd@bendel.debian.org>;
	Mon, 24 Apr 2023 15:54:16 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id F2C772075F
	for <nbd@other.debian.org>; Mon, 24 Apr 2023 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682351650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fR5QB/WxcG4E5hkpk8NFHtu2xiL39PiGRV3wmp/LBPY=;
	b=jLN7BBIMNclln3dRAzhNQQcyya0dAq/Nt6j7B+F6t1/BLUHVFRlot59z4wAl9ITnuwNsg4
	N0rC0LU/299LP5qwmHt6Ul1r9yP5LAX88B1tn9fJ6tbwo5S15rUYsMQVWRbs1GlXj4ZwR5
	ePTaqas+uHPXJQHXA8fyrMw/azoqqYE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-VNVCDN7uPAGzeQMfl37bog-1; Mon, 24 Apr 2023 11:54:09 -0400
X-MC-Unique: VNVCDN7uPAGzeQMfl37bog-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AEC6884342
	for <nbd@other.debian.org>; Mon, 24 Apr 2023 15:54:09 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A4392166B29;
	Mon, 24 Apr 2023 15:54:09 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: libguestfs@redhat.com,
	vgoyal@redhat.com
Subject: [PATCH] spec: Document extended headers extension branch
Date: Mon, 24 Apr 2023 10:54:08 -0500
Message-Id: <20230424155408.711365-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <f3XmGnFsDYN.A.T5E.8YqRkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2451
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230424155408.711365-1-eblake@redhat.com
Resent-Date: Mon, 24 Apr 2023 15:54:36 +0000 (UTC)

Branch extension-ext-header now exists to capture the specs reviewed
on list and tentatively implemented in both qemu (server and client)
and libnbd (client) code.  I'm still working on implementing the
extension in nbdkit (server) before promoting the extension branch to
mainline.

Meanwhile, structured replies and block status have been incorporated
into mainline for some time now (see commit 6e896bca in 2018, v3.17);
and while block status is still not implemented in the kernel module
or in nbd-server, we did just recently implement structured replies in
nbd-server.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

Given the review on my v3 spec proposal for extended headers, I've
pushed patch 1 and 2 of that series to mainline along with this patch,
while patches 3-5 of that series are tweaked per review comments and
pushed on the new extension-ext-header branch.  My next step will be
posting v3 patches to qemu and libnbd which rebases my earlier
proof-of-concept patches to those projects to match the spec as now
live (and/or tweak the extension spec if something insurmountable
comes up).

 doc/proto.md | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 460823b..8589e22 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -1137,6 +1137,9 @@ The field has the following format:
   will be faster than a regular write). Clients MUST NOT set the
   `NBD_CMD_FLAG_FAST_ZERO` request flag unless this transmission flag
   is set.
+- bit 12, `NBD_FLAG_BLOCK_STATUS_PAYLOAD`; defined by the experimental
+  `EXTENDED_HEADERS`
+  [extension](https://github.com/NetworkBlockDevice/nbd/blob/extension-ext-header/doc/proto.md).

 Clients SHOULD ignore unknown flags.

@@ -1500,6 +1503,11 @@ of the newstyle negotiation.
     option does not select any metadata context, provided the client
     then does not attempt to issue `NBD_CMD_BLOCK_STATUS` commands.

+* `NBD_OPT_EXTENDED_HEADERS` (11)
+
+    Defined by the experimental `EXTENDED_HEADERS`
+    [extension](https://github.com/NetworkBlockDevice/nbd/blob/extension-ext-header/doc/proto.md).
+
 #### Option reply types

 These values are used in the "reply type" field, sent by the server
@@ -1680,6 +1688,11 @@ case that data is an error message string suitable for display to the user.

     The request or the reply is too large to process.

+* `NBD_REP_ERR_EXT_HEADER_REQD` (2^31 + 10)
+
+    Defined by the experimental `EXTENDED_HEADERS`
+    [extension](https://github.com/NetworkBlockDevice/nbd/blob/extension-ext-header/doc/proto.md).
+
 ### Transmission phase

 #### Flag fields
@@ -1733,6 +1746,9 @@ valid may depend on negotiation during the handshake phase.
   `NBD_CMD_WRITE`, then the server MUST fail quickly with an error of
   `NBD_ENOTSUP`. The client MUST NOT set this unless the server advertised
   `NBD_FLAG_SEND_FAST_ZERO`.
+- bit 5, `NBD_CMD_FLAG_PAYLOAD_LEN`; defined by the experimental
+  `EXTENDED_HEADERS`
+  [extension](https://github.com/NetworkBlockDevice/nbd/blob/extension-ext-header/doc/proto.md).

 ##### Structured reply flags

@@ -1853,6 +1869,11 @@ small amount of fixed-length overhead inherent in the chunk type).
   extent information at the first offset not covered by a
   reduced-length reply.

+* `NBD_REPLY_TYPE_BLOCK_STATUS_EXT` (6)
+
+  Defined by the experimental `EXTENDED_HEADERS`
+  [extension](https://github.com/NetworkBlockDevice/nbd/blob/extension-ext-header/doc/proto.md).
+
 All error chunk types have bit 15 set, and begin with the same
 *error*, *message length*, and optional *message* fields as
 `NBD_REPLY_TYPE_ERROR`.  If nonzero, *message length* indicates
@@ -2336,9 +2357,7 @@ with names starting with the word 'extension'.

 Currently known are:

-* The `STRUCTURED_REPLY` [extension](https://github.com/NetworkBlockDevice/nbd/blob/extension-structured-reply/doc/proto.md).
-
-* The `BLOCK_STATUS` [extension](https://github.com/NetworkBlockDevice/nbd/blob/extension-blockstatus/doc/proto.md) (based on the `STRUCTURED_REPLY` extension).
+* The `EXTENDED_HEADER` [extension](https://github.com/NetworkBlockDevice/nbd/blob/extension-ext-header/doc/proto.md).

 * The `RESIZE` [extension](https://github.com/NetworkBlockDevice/nbd/blob/extension-resize/doc/proto.md).


base-commit: daf3fce989b23cc8c9023f28e0eec2f074c9f1bd
-- 
2.40.0

