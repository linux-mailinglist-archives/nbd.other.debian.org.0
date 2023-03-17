Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC346BF276
	for <lists+nbd@lfdr.de>; Fri, 17 Mar 2023 21:28:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0FA7E2048A; Fri, 17 Mar 2023 20:28:46 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 17 20:28:45 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8A20520454
	for <lists-other-nbd@bendel.debian.org>; Fri, 17 Mar 2023 20:28:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.082 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id FWb4wVE46qCg for <lists-other-nbd@bendel.debian.org>;
	Fri, 17 Mar 2023 20:28:06 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id E95C12045E
	for <nbd@other.debian.org>; Fri, 17 Mar 2023 20:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679084881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0R5I27ov4lNPeGd1XvXpj2Wrky39OKo2yJm6P6Bnges=;
	b=WIgxzbMP5NtZO46Fgux60QACmtocFP5TH3XFHl9uMzsvB6nzVeWpHzSWaRO98zEMWoPpgR
	NXCr10E0CkgCJhLi7nylw1CYQ/+aKsZ8mchW4XXx8OjEFm0VTA550yTKi+K1FMUZ+/2gu8
	AnKrvqjf/qm5JGUTKiEQ9m0I+hqBTZk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-zpc23gJ5NoWr0lHdeCqhig-1; Fri, 17 Mar 2023 16:27:55 -0400
X-MC-Unique: zpc23gJ5NoWr0lHdeCqhig-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1865C3C025C0;
	Fri, 17 Mar 2023 20:27:55 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.99])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 218CD492B00;
	Fri, 17 Mar 2023 20:27:54 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: josef@toxicpanda.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Cc: philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>
Subject: [PATCH v2 1/5] uapi nbd: improve doc links to userspace spec
Date: Fri, 17 Mar 2023 15:27:45 -0500
Message-Id: <20230317202749.419094-2-eblake@redhat.com>
In-Reply-To: <20230317202749.419094-1-eblake@redhat.com>
References: <20230317202749.419094-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <lFJnfQ2rh9D.A.uxG.91MFkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2400
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230317202749.419094-2-eblake@redhat.com
Resent-Date: Fri, 17 Mar 2023 20:28:46 +0000 (UTC)

The uapi <linux/nbd.h> header intentionally documents only the NBD
server features that the kernel module will utilize as a client.  But
while it already had one mention of skipped bits due to userspace
extensions, it did not actually direct the reader to the canonical
source to learn about those extensions.

While touching comments, fix an outdated reference that listed only
READ and WRITE as commands.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Ming Lei <ming.lei@redhat.com>

---
v2: Split change to sourceforge link to separate patch
---
 include/uapi/linux/nbd.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/nbd.h b/include/uapi/linux/nbd.h
index 20d6cc91435d..8797387caaf7 100644
--- a/include/uapi/linux/nbd.h
+++ b/include/uapi/linux/nbd.h
@@ -11,6 +11,8 @@
  *            Cleanup PARANOIA usage & code.
  * 2004/02/19 Paul Clements
  *            Removed PARANOIA, plus various cleanup and comments
+ * 2023 Copyright Red Hat
+ *            Link to userspace extensions.
  */

 #ifndef _UAPILINUX_NBD_H
@@ -30,12 +32,18 @@
 #define NBD_SET_TIMEOUT _IO( 0xab, 9 )
 #define NBD_SET_FLAGS   _IO( 0xab, 10)

+/*
+ * See also https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md
+ * for additional userspace extensions not yet utilized in the kernel module.
+ */
+
 enum {
 	NBD_CMD_READ = 0,
 	NBD_CMD_WRITE = 1,
 	NBD_CMD_DISC = 2,
 	NBD_CMD_FLUSH = 3,
 	NBD_CMD_TRIM = 4
+	/* userspace defines additional extension commands */
 };

 /* values for flags field, these are server interaction specific. */
@@ -64,14 +72,15 @@ enum {
 #define NBD_REQUEST_MAGIC 0x25609513
 #define NBD_REPLY_MAGIC 0x67446698
 /* Do *not* use magics: 0x12560953 0x96744668. */
+/* magic 0x668e33ef for structured reply not supported by kernel yet */

 /*
  * This is the packet used for communication between client and
  * server. All data are in network byte order.
  */
 struct nbd_request {
-	__be32 magic;
-	__be32 type;	/* == READ || == WRITE 	*/
+	__be32 magic;	/* NBD_REQUEST_MAGIC	*/
+	__be32 type;	/* See NBD_CMD_*	*/
 	char handle[8];
 	__be64 from;
 	__be32 len;
@@ -82,7 +91,7 @@ struct nbd_request {
  * it has completed an I/O request (or an error occurs).
  */
 struct nbd_reply {
-	__be32 magic;
+	__be32 magic;		/* NBD_REPLY_MAGIC	*/
 	__be32 error;		/* 0 = ok, else error	*/
 	char handle[8];		/* handle you got from request	*/
 };
-- 
2.39.2

