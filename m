Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB076BF272
	for <lists+nbd@lfdr.de>; Fri, 17 Mar 2023 21:28:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 22C3B2047D; Fri, 17 Mar 2023 20:28:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 17 20:28:23 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 41B4020467
	for <lists-other-nbd@bendel.debian.org>; Fri, 17 Mar 2023 20:28:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9GDlNw6v-pqA for <lists-other-nbd@bendel.debian.org>;
	Fri, 17 Mar 2023 20:28:06 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 09D632045F
	for <nbd@other.debian.org>; Fri, 17 Mar 2023 20:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679084881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GsYNbSh5zaQpqPToVrw2INmBUKfltsbn27ZhrwN66l0=;
	b=DzjYkx/YAXKowOuAN9U0ubhs7VGh8s26A3mqkZkvPpdFlXvuY+rqxPIgG+OFC4KdRXLGUF
	2g2jRptl42F71QZnpPZLeOQ1L/skt53GQMsPN1rfaNUWdLCd5xtK26jqo7jMQAFbH3HQa8
	8dlxnRJ2eXOKxDG8Hbo6chkcWwlAbfM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-BMu_1d4VN-CdyMOrQPqmSw-1; Fri, 17 Mar 2023 16:27:57 -0400
X-MC-Unique: BMu_1d4VN-CdyMOrQPqmSw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C41153806737;
	Fri, 17 Mar 2023 20:27:56 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.99])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12E05492B00;
	Fri, 17 Mar 2023 20:27:56 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: josef@toxicpanda.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Cc: philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] uapi nbd: add cookie alias to handle
Date: Fri, 17 Mar 2023 15:27:47 -0500
Message-Id: <20230317202749.419094-4-eblake@redhat.com>
In-Reply-To: <20230317202749.419094-1-eblake@redhat.com>
References: <20230317202749.419094-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <29STstOuXVG.A.RrG.n1MFkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2396
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230317202749.419094-4-eblake@redhat.com
Resent-Date: Fri, 17 Mar 2023 20:28:23 +0000 (UTC)

The uapi <linux/nbd.h> header declares a 'char handle[8]' per request;
which is overloaded in English (are you referring to "handle" the
verb, such as handling a signal or writing a callback handler, or
"handle" the noun, the value used in a lookup table to correlate a
response back to the request).  Many client-side NBD implementations
(both servers and clients) have instead used 'uint64_t cookie' or
similar, as it is easier to directly assign an integer than to futz
around with memcpy.  In fact, upstream documentation is now
encouraging this shift in terminology:
https://lists.debian.org/nbd/2023/03/msg00031.html

Accomplish this by use of an anonymous union to provide the alias for
anyone getting the definition from the uapi; this does not break
existing clients, while exposing the nicer name for those who prefer
it.  Note that block/nbd.c still uses the term handle (in fact, it
actually combines a 32-bit cookie and a 32-bit tag into the 64-bit
handle), but that internal usage is not changed the public uapi, since
no compliant NBD server has any reason to inspect or alter the 64
bits sent over the socket.

Signed-off-by: Eric Blake <eblake@redhat.com>

---
v2: swap order of anonymous union and add comments to list favored name
---
 include/uapi/linux/nbd.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/nbd.h b/include/uapi/linux/nbd.h
index 8797387caaf7..80ce0ef43afd 100644
--- a/include/uapi/linux/nbd.h
+++ b/include/uapi/linux/nbd.h
@@ -12,7 +12,7 @@
  * 2004/02/19 Paul Clements
  *            Removed PARANOIA, plus various cleanup and comments
  * 2023 Copyright Red Hat
- *            Link to userspace extensions.
+ *            Link to userspace extensions, favor cookie over handle.
  */

 #ifndef _UAPILINUX_NBD_H
@@ -81,7 +81,10 @@ enum {
 struct nbd_request {
 	__be32 magic;	/* NBD_REQUEST_MAGIC	*/
 	__be32 type;	/* See NBD_CMD_*	*/
-	char handle[8];
+	union {
+		__be64 cookie;	/* Opaque identifier for request	*/
+		char handle[8];	/* older spelling of cookie		*/
+	};
 	__be64 from;
 	__be32 len;
 } __attribute__((packed));
@@ -93,6 +96,9 @@ struct nbd_request {
 struct nbd_reply {
 	__be32 magic;		/* NBD_REPLY_MAGIC	*/
 	__be32 error;		/* 0 = ok, else error	*/
-	char handle[8];		/* handle you got from request	*/
+	union {
+		__be64 cookie;	/* Opaque identifier from request	*/
+		char handle[8];	/* older spelling of cookie		*/
+	};
 };
 #endif /* _UAPILINUX_NBD_H */
-- 
2.39.2

