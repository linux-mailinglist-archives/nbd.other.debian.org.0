Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FBCAC9BA8
	for <lists+nbd@lfdr.de>; Sat, 31 May 2025 18:13:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 546D1207F3; Sat, 31 May 2025 16:13:02 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat May 31 16:13:02 2025
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 59518207EC
	for <lists-other-nbd@bendel.debian.org>; Sat, 31 May 2025 16:12:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.003 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-2.907, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xZTllKZwLRJH for <lists-other-nbd@bendel.debian.org>;
	Sat, 31 May 2025 16:12:48 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id DB032207E6
	for <nbd@other.debian.org>; Sat, 31 May 2025 16:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748707962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Yoq5AAa4T3bNssdXbuSvIYSt/XY7/tAFc4Zveor+x88=;
	b=i0i8jD9CKqc9nn0J9RqoeSTOuFAzc+Cx1rL81wQ1hAK0BhzeIE7FkP1gAR/ZYkcCyIGFT3
	m9ahCPYSgh0Rr0mIp3iZRK9TuG8O9ftDQIx1RIyrxHbALpTRYXPZXirjYAmkCS5/6YoVeN
	GVAl4Gcdqct3rPgJUtaTbqX9mAModCc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-n0a55BP_PHuKAAvl8wGtVQ-1; Sat,
 31 May 2025 11:41:49 -0400
X-MC-Unique: n0a55BP_PHuKAAvl8wGtVQ-1
X-Mimecast-MFC-AGG-ID: n0a55BP_PHuKAAvl8wGtVQ_1748706108
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C432619560AE
	for <nbd@other.debian.org>; Sat, 31 May 2025 15:41:48 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.48])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2D4F21956066
	for <nbd@other.debian.org>; Sat, 31 May 2025 15:41:47 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Subject: [RFC PATCH] spec: Relax block status alignment to match existing servers
Date: Sat, 31 May 2025 10:38:42 -0500
Message-ID: <20250531154146.855670-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 35tqmNJA8zxJqo-MDLDwgZ4UKG8zmLAxrJTysxVzFRk_1748706108
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ypt5gxAvHGE.A.qKjC.OqyOoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3380
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250531154146.855670-1-eblake@redhat.com
Resent-Date: Sat, 31 May 2025 16:13:02 +0000 (UTC)

At least nbdkit 1.42 has several scenarios where it can advertise a
minimum block size, but where block status results are not aligned to
that size.  While most of those instances are bugs fixed in the
upcoming 1.44, we have to consider the case when a server advertises
an image size which is not a multiple of the minimum block size.  The
spec is already clear that a server SHOULD advertise aligned sizes,
but when it doesn't, the requirement that block status results be
aligned is impossible to meet.  Relaxing the standard from MUST to
SHOULD warns clients to be prepared for weaknesses in the server, as
well as making it less troublesome to try and collect block status
even for an unaligned tail of an image.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

I'm not sure if I want to apply this patch as-is, or if we should come
up with a better wording.  Of note: we already use SHOULD and not MUST
on structured replies to NBD_CMD_READ splitting a response into
multiple chunks when reading holes is encountered.  The biggest reason
for this patch is to inform clients that not all servers are always
compliant (in particular, nbdkit 1.42 has several issues, and while
I'm patching most of them for 1.44, nbdkit still takes the approach
that it has no problem with a plugin advertising unaligned sizes, at
which point an unaligned block status request and response are the
only way to learn about that unaligned tail).

 doc/proto.md | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 565fbebc..b403bae1 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -2267,8 +2267,10 @@ The following request types exist:
     places for an exception), in part to avoid an amplification effect
     where a series of smaller descriptors can cause the server's reply
     to occupy more bytes than the *length* of the client's request.
-    The server MUST use descriptor lengths that are an integer
-    multiple of any advertised minimum block size. The status flags
+    The server SHOULD use descriptor lengths that are an integer
+    multiple of any advertised minimum block size, with an obvious
+    exception at the end of the image if the image size itself is
+    unaligned. The status flags
     are intentionally defined so that a server MAY always safely
     report a status of 0 for any block, although the server SHOULD
     return additional status values when they can be easily detected.
-- 
2.49.0

