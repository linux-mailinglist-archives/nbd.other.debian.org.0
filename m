Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CEF6E171F
	for <lists+nbd@lfdr.de>; Fri, 14 Apr 2023 00:03:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 68ECB20577; Thu, 13 Apr 2023 22:03:44 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr 13 22:03:44 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,LONGWORD,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 031802056B
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Apr 2023 22:03:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.082 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5, LONGWORD=2,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Z4JF-Ee-4SD1 for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Apr 2023 22:02:56 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id E8F3720529
	for <nbd@other.debian.org>; Thu, 13 Apr 2023 22:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681423371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dyM/oL9CfANAJvmD+3vCRdfGvEyaUcyZ+xrz+Mqkd0Y=;
	b=XQbwpSELrOjyR2tdl8vFfrhYl9Dz8/dJACXJu2a2GjXP13GVufiAUQ5U633hPt7BBS2hPh
	8/wbIZkWuXz9qOhoYnWr7mV8t3B3DfxLzrs9gFaavU5BtETZu6H9FsEi0w0/+N8LlWZU4I
	kQsBTlwjfdJkpsQeHEmTyTtBkY25bVk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-4W1nedacPDy65C3HiKmXHg-1; Thu, 13 Apr 2023 18:02:47 -0400
X-MC-Unique: 4W1nedacPDy65C3HiKmXHg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BD721C0432D;
	Thu, 13 Apr 2023 22:02:47 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 33B812027043;
	Thu, 13 Apr 2023 22:02:47 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH v3 6/6] RFC: spec: Introduce NBD_REPLY_TYPE_OFFSET_HOLE_EXT
Date: Thu, 13 Apr 2023 17:02:41 -0500
Message-Id: <20230413220241.1396012-7-eblake@redhat.com>
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
Resent-Message-ID: <nCb4j5B3gqN.A.FEG.AxHOkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2427
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230413220241.1396012-7-eblake@redhat.com
Resent-Date: Thu, 13 Apr 2023 22:03:44 +0000 (UTC)

Rather than requiring all servers and clients to have a 32-bit limit
on maximum NBD_CMD_READ/WRITE sizes, we can choose to standardize
support for a 64-bit single I/O transaction now.
NBD_REPLY_TYPE_OFFSET_DATA can already handle a large reply, but
NBD_REPLY_TYPE_OFFSET_HOLE needs a 64-bit counterpart.

By standardizing this, all clients must be prepared to support both
types of hole type replies, even though most server implementations of
extended replies are likely to only send one hole type.

---

As this may mean a corner-case that gets less testing, I have
separated it into a separate optional patch.  I implemented it in my
proof-of-concept, but am happy to drop this patch for what actually
goes upstream.

In particular, if we foresee clients and servers that WANT to support
a payload larger than 4G, it may be worth introducing an NBD_INFO_*
that supplies 64-bit block sizing information, rather than our current
inherent 32-bit limit of NBD_INFO_BLOCK_SIZE, at the same time as we
introduce this reply type.
---
 doc/proto.md | 73 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 42 insertions(+), 31 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index ddf0a89..9fa471a 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -2024,18 +2024,27 @@ small amount of fixed-length overhead inherent in the chunk type).
   64 bits: offset (unsigned)  
   32 bits: hole size (unsigned, MUST be nonzero)  

-  At this time, although servers that support extended headers are
-  permitted to accept client requests for `NBD_CMD_READ` with an
-  effect length larger than any advertised maximum payload size by
-  splitting the reply into multiple chunks, portable clients SHOULD
-  NOT request a read *length* larger than 32 bits (corresponding to
-  the maximum payload constraint implied by `NBD_INFO_BLOCK_SIZE`),
-  and therefore a 32-bit constraint on the *hole size* does not
-  represent an arbitrary limitation.  Should a future scenario arise
-  where it can be demonstrated that a client and server would benefit
-  from an extension allowing a maximum payload size to be larger than
-  32 bits, that extension would also introduce a counterpart reply
-  type that can express a 64-bit *hole size*.
+* `NBD_REPLY_TYPE_OFFSET_HOLE_EXT` (3)
+
+  This chunk type is in the content chunk category.  *length* MUST be
+  exactly 16.  The semantics of this chunk mirror those of
+  `NBD_REPLY_TYPE_OFFSET_HOLE`, other than the use of a larger *hole
+  size* field.  This chunk type MUST NOT be used unless extended
+  headers were negotiated with `NBD_OPT_EXTENDED_HEADERS`.
+
+  The payload is structured as:
+
+  64 bits: offset (unsigned)  
+  64 bits: hole size (unsigned, MUST be nonzero)  
+
+  Note that even though extended headers are in use, a server may
+  enforce a maximum effect length on `NBD_CMD_READ` comparable to an
+  advertised maximum payload length (rather than having to split a
+  large effect length over multiple chunks); in this case, no valid
+  `NBD_CMD_READ` will have an effect *length* large enough to require
+  the use of this chunk type.  However, a client using extended
+  headers MUST be prepared for the server to use either the compact or
+  extended chunk type.

 * `NBD_REPLY_TYPE_BLOCK_STATUS` (5)

@@ -2233,25 +2242,27 @@ The following request types exist:
     the following additional constraints.

     The server MAY split the reply into any number of content chunks
-    (`NBD_REPLY_TYPE_OFFSET_DATA` and `NBD_REPLY_TYPE_OFFSET_HOLE`);
-    each chunk MUST describe at least one byte, although to minimize
-    overhead, the server SHOULD use chunks with lengths and offsets as
-    an integer multiple of 512 bytes, where possible (the first and
-    last chunk of an unaligned read being the most obvious places for
-    an exception).  The server MUST NOT send content chunks that
-    overlap with any earlier content or error chunk, and MUST NOT send
-    chunks that describe data outside the offset and length of the
-    request, but MAY send the content chunks in any order (the client
-    MUST reassemble content chunks into the correct order), and MAY
-    send additional content chunks even after reporting an error
-    chunk.  A server MAY support read requests larger than the maximum
-    payload size by splitting the response across multiple chunks (in
-    particular, if extended headers are not in use, a request for more
-    than 2^32 - 8 bytes containing data rather than holes MUST be
-    split to avoid overflowing the `NBD_REPLY_TYPE_OFFSET_DATA` length
-    field); however, the server is also permitted to reject large read
-    requests up front, so a client should be prepared to retry with
-    smaller requests if a large request fails.
+    (`NBD_REPLY_TYPE_OFFSET_DATA` and `NBD_REPLY_TYPE_OFFSET_HOLE` for
+    structured replies, additionally `NBD_REPLY_TYPE_OFFSET_HOLE_EXT`
+    for extended headers); each chunk MUST describe at least one byte,
+    although to minimize overhead, the server SHOULD use chunks with
+    lengths and offsets as an integer multiple of 512 bytes, where
+    possible (the first and last chunk of an unaligned read being the
+    most obvious places for an exception).  The server MUST NOT send
+    content chunks that overlap with any earlier content or error
+    chunk, and MUST NOT send chunks that describe data outside the
+    offset and length of the request, but MAY send the content chunks
+    in any order (the client MUST reassemble content chunks into the
+    correct order), and MAY send additional content chunks even after
+    reporting an error chunk.  A server MAY support read requests
+    larger than the maximum payload size by splitting the response
+    across multiple chunks (in particular, if extended headers are not
+    in use, a request for more than 2^32 - 8 bytes containing data
+    rather than holes MUST be split to avoid overflowing the 32-bit
+    `NBD_REPLY_TYPE_OFFSET_DATA` length field); however, the server is
+    also permitted to reject large read requests up front, so a client
+    should be prepared to retry with smaller requests if a large
+    request fails.

     When no error is detected, the server MUST send enough data chunks
     to cover the entire region described by the offset and length of
-- 
2.39.2

