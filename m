Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7976E171B
	for <lists+nbd@lfdr.de>; Fri, 14 Apr 2023 00:03:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B11C32056F; Thu, 13 Apr 2023 22:03:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr 13 22:03:21 2023
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
	by bendel.debian.org (Postfix) with ESMTP id E477D20577
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Apr 2023 22:03:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.082 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uwPq5HqIhExn for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Apr 2023 22:02:51 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 56AEF20549
	for <nbd@other.debian.org>; Thu, 13 Apr 2023 22:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681423366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n0awcObLMHImfAAKLrH0nWjLt09KkgwzH45Z66BRs9I=;
	b=CwyjSGVgB6XZfuXWYZULlHvzI1mm/EDHn6VvHHe7p1LRxgxa7nH8neJzwgktw5ad+RyCXa
	gvCHqyEUiMv7zdMg4kdJdNC1yzOgMX7jeHXR7n2d7LXOiY/WGJO5vCXyyK3zYMarCnXQ6j
	2Hb3ZYOasqWtO5JZShYBOL9EJilrYAk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-T9IZ3ve4PWK3cyr8gADG2A-1; Thu, 13 Apr 2023 18:02:45 -0400
X-MC-Unique: T9IZ3ve4PWK3cyr8gADG2A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05F6B3C0C8B6;
	Thu, 13 Apr 2023 22:02:45 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1316F2027043;
	Thu, 13 Apr 2023 22:02:44 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v3 1/6] spec: Recommend cap on NBD_REPLY_TYPE_BLOCK_STATUS length
Date: Thu, 13 Apr 2023 17:02:36 -0500
Message-Id: <20230413220241.1396012-2-eblake@redhat.com>
In-Reply-To: <20230413220241.1396012-1-eblake@redhat.com>
References: <20230413220241.1396012-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <cTY-QGHgzvK.A.u9F.pwHOkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2423
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230413220241.1396012-2-eblake@redhat.com
Resent-Date: Thu, 13 Apr 2023 22:03:21 +0000 (UTC)

The spec was silent on how many extents a server could reply with.
However, both qemu and nbdkit (the two server implementations known to
have implemented the NBD_CMD_BLOCK_STATUS extension) implement a hard
cap, and will truncate the amount of extents in a reply to avoid
sending a client a reply so large that the client would treat it as a
denial of service attack.  Clients currently have no way during
negotiation to request such a limit of the server, so it is easier to
just document this as a restriction on viable server implementations
than to add yet another round of handshaking.  Also, mentioning
amplification effects is worthwhile.

When qemu first implemented NBD_CMD_BLOCK_STATUS for the
base:allocation context (qemu commit e7b1948d51, Mar 2018), it behaved
as if NBD_CMD_FLAG_REQ_ONE were always passed by the client, and never
responded with more than one extent.  Later, when adding its
qemu:dirty-bitmap:XYZ context extension (qemu commit 3d068aff16, Jun
2018), it added a cap to 128k extents (1M+4 bytes), and that cap was
applied to base:allocation once qemu started sending multiple extents
for that context as well (qemu commit fb7afc797e, Jul 2018).  Qemu
extents are never smaller than 512 bytes (other than an exception at
the end of a file whose size is not aligned to 512), but even so, a
request for just under 4G of block status could produce 8M extents,
resulting in a reply of 64M if it were not capped smaller.

When nbdkit first implemented NBD_CMD_BLOCK_STATUS (nbdkit 4ca66f70a5,
Mar 2019), it did not impose any restriction on the number of extents
in the reply chunk.  But because it allows extents as small as one
byte, it is easy to write a server that can amplify a client's request
of status over 1M of the image into a reply over 8M in size, and it
was very easy to demonstrate that a hard cap was needed to avoid
crashing clients or otherwise killing the connection (a bad server
impacting the client negatively).  So nbdkit enforced a bound of 1M
extents (8M+4 bytes, nbdkit commit 6e0dc839ea, Jun 2019).  [Unrelated
to this patch, but worth noting for history: nbdkit's situation also
has to deal with the fact that it is designed for plugin server
implementations; and not capping the number of extents in a reply also
posed a problem to nbdkit as the server, where a plugin could exhaust
memory and kill the server, unrelated to any size constraints enforced
by a client.]

Since the limit chosen by these two implementations is different, and
since nbdkit has versions that were not limited, add this as a SHOULD
NOT instead of MUST NOT constraint on servers implementing block
status.  It does not matter that qemu picked a smaller limit that it
truncates to, since we have already documented that the server may
truncate for other reasons (such as it being inefficient to collect
that many extents in the first place).  But documenting the limit now
becomes even more important in the face of a future addition of 64-bit
requests, where a client's request is no longer bounded to 4G and
could thereby produce even more than 8M extents for the corner case
when every 512 bytes is a new extent, if it were not for this
recommendation.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

---
v2: Add wording about amplification effect
v3: Add R-b.
---
 doc/proto.md | 51 +++++++++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 060deba..0cb84f2 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -1820,6 +1820,12 @@ MUST initiate a hard disconnect.
   the different contexts need not have the same number of extents or
   cumulative extent length.

+  Servers SHOULD NOT send more than 2^20 extents in a single reply
+  chunk; in other words, the size of
+  `NBD_REPLY_TYPE_BLOCK_STATUS` should not be more than 4 + 8*2^20
+  (8,388,612 bytes), even if this requires that the server truncate
+  the response in relation to the *length* requested by the client.
+
   Even if the client did not use the `NBD_CMD_FLAG_REQ_ONE` flag in
   its request, the server MAY return fewer descriptors in the reply
   than would be required to fully specify the whole range of requested
@@ -2182,26 +2188,31 @@ The following request types exist:
     `NBD_REPLY_TYPE_BLOCK_STATUS` chunk represent consecutive portions
     of the export starting from specified *offset*.  If the client used
     the `NBD_CMD_FLAG_REQ_ONE` flag, each chunk contains exactly one
-    descriptor where the *length* of the descriptor MUST NOT be greater
-    than the *length* of the request; otherwise, a chunk MAY contain
-    multiple descriptors, and the final descriptor MAY extend beyond
-    the original requested size if the server can determine a larger
-    length without additional effort.  On the other hand, the server MAY
-    return less data than requested. However the server MUST return at
-    least one status descriptor (and since each status descriptor has
-    a non-zero length, a client can always make progress on a
-    successful return).  The server SHOULD use different *status*
-    values between consecutive descriptors where feasible, although
-    the client SHOULD be prepared to handle consecutive descriptors
-    with the same *status* value.  The server SHOULD use descriptor
-    lengths that are an integer multiple of 512 bytes where possible
-    (the first and last descriptor of an unaligned query being the
-    most obvious places for an exception), and MUST use descriptor
-    lengths that are an integer multiple of any advertised minimum
-    block size. The status flags are intentionally defined so that a
-    server MAY always safely report a status of 0 for any block,
-    although the server SHOULD return additional status values when
-    they can be easily detected.
+    descriptor where the *length* of the descriptor MUST NOT be
+    greater than the *length* of the request; otherwise, a chunk MAY
+    contain multiple descriptors, and the final descriptor MAY extend
+    beyond the original requested size if the server can determine a
+    larger length without additional effort.  On the other hand, the
+    server MAY return less data than requested.  In particular, a
+    server SHOULD NOT send more than 2^20 status descriptors in a
+    single chunk.  However the server MUST return at least one status
+    descriptor, and since each status descriptor has a non-zero
+    length, a client can always make progress on a successful return.
+
+    The server SHOULD use different *status* values between
+    consecutive descriptors where feasible, although the client SHOULD
+    be prepared to handle consecutive descriptors with the same
+    *status* value.  The server SHOULD use descriptor lengths that are
+    an integer multiple of 512 bytes where possible (the first and
+    last descriptor of an unaligned query being the most obvious
+    places for an exception), in part to avoid an amplification effect
+    where a series of smaller descriptors can cause the server's reply
+    to occupy more bytes than the *length* of the client's request.
+    The server MUST use descriptor lengths that are an integer
+    multiple of any advertised minimum block size. The status flags
+    are intentionally defined so that a server MAY always safely
+    report a status of 0 for any block, although the server SHOULD
+    return additional status values when they can be easily detected.

     If an error occurs, the server SHOULD set the appropriate error
     code in the error field of an error chunk. However, if the error
-- 
2.39.2

