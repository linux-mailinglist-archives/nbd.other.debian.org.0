Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 010106B5198
	for <lists+nbd@lfdr.de>; Fri, 10 Mar 2023 21:16:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C5C5320777; Fri, 10 Mar 2023 20:16:07 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 10 20:16:07 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 32F9820779
	for <lists-other-nbd@bendel.debian.org>; Fri, 10 Mar 2023 20:15:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eVbeBJzTZu05 for <lists-other-nbd@bendel.debian.org>;
	Fri, 10 Mar 2023 20:15:40 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 1C55B20775
	for <nbd@other.debian.org>; Fri, 10 Mar 2023 20:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678479335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppIa7KL6T1jyviPGvoaICUIPVqm/wSOFkhdUqjpubIE=;
	b=PS3HEZINz/+oCrlnHfUKjFr1ajwqRdbu3LX0xEmfTqCox433PxBzaGYRQTYG265BIDhYMN
	326pC850f868rfWPdm6M+mf5fRi7PXnFSvqKB/LRH5iImy7LoM0MbrQ2TQCYIDG+imhBnQ
	YYRZmttnYUONFaJ6q5nJHW1MktcYRp8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-lbKHM_LDMR6GQI_jhdVRew-1; Fri, 10 Mar 2023 15:15:29 -0500
X-MC-Unique: lbKHM_LDMR6GQI_jhdVRew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1B9285CBE0;
	Fri, 10 Mar 2023 20:15:28 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.147])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0A004014CF3;
	Fri, 10 Mar 2023 20:15:27 +0000 (UTC)
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
Subject: [PATCH 2/3] uapi nbd: add cookie alias to handle
Date: Fri, 10 Mar 2023 14:15:24 -0600
Message-Id: <20230310201525.2615385-3-eblake@redhat.com>
In-Reply-To: <20230310201525.2615385-1-eblake@redhat.com>
References: <20230310201525.2615385-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <piszcJkrjtC.A.w3B.HA5CkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2372
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230310201525.2615385-3-eblake@redhat.com
Resent-Date: Fri, 10 Mar 2023 20:16:07 +0000 (UTC)

The uapi <linux/nbd.h> header declares a 'char handle[8]' per request;
which is overloaded in English (are you referring to "handle" the
verb, such as handling a signal or writing a callback handler, or
"handle" the noun, the value used in a lookup table to correlate a
response back to the request).  Many client-side NBD implementations
(both servers and clients) have instead used 'u64 cookie' or similar,
as it is easier to directly assign an integer than to futz around with
memcpy.  In fact, upstream documentation is now encouraging this shift
in terminology: https://lists.debian.org/nbd/2023/03/msg00031.html

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
 include/uapi/linux/nbd.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/nbd.h b/include/uapi/linux/nbd.h
index 8797387caaf7..f58f2043f62e 100644
--- a/include/uapi/linux/nbd.h
+++ b/include/uapi/linux/nbd.h
@@ -81,7 +81,10 @@ enum {
 struct nbd_request {
 	__be32 magic;	/* NBD_REQUEST_MAGIC	*/
 	__be32 type;	/* See NBD_CMD_*	*/
-	char handle[8];
+	union {
+		char handle[8];
+		__be64 cookie;
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
+		char handle[8];	/* handle you got from request	*/
+		__be64 cookie;
+	};
 };
 #endif /* _UAPILINUX_NBD_H */
-- 
2.39.2

