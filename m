Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E874628D03
	for <lists+nbd@lfdr.de>; Tue, 15 Nov 2022 00:03:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6349020678; Mon, 14 Nov 2022 23:03:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 23:03:22 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,LONGWORD,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3DD9520534
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 23:03:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.596 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.515, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, LONGWORD=2, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 50JXvBXqKETx for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 23:03:06 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 78FEB20545
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 23:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668466981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cUuI1u+i3cvmWB9fVPbXaz+lkryi7TPySGp8A7zlIVg=;
	b=Ieu2CCg3JOICn8GBrfYP1C4xXH/fKpAE7zs2gL+Sr6CoMwKbyQOMUAVjMt97ssr05IBt27
	4BWtQiJx7oaM7FpbITaTh6DzQtXQOmVVpanMQT4T9Ws+NfFCxHs6+yFTcG3N4/duy7KJjx
	Iw8eRgJc9NijGeq0dqaoeHn/iRNSlEU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-3Xmdd-qCO4yChnr5xGo6sg-1; Mon, 14 Nov 2022 17:47:02 -0500
X-MC-Unique: 3Xmdd-qCO4yChnr5xGo6sg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ADBB101AA79;
	Mon, 14 Nov 2022 22:47:02 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C795C2024CC0;
	Mon, 14 Nov 2022 22:47:01 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH v2 6/6] RFC: spec: Introduce NBD_REPLY_TYPE_OFFSET_HOLE_EXT
Date: Mon, 14 Nov 2022 16:46:55 -0600
Message-Id: <20221114224655.2186173-7-eblake@redhat.com>
In-Reply-To: <20221114224655.2186173-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JwN4lVYCJjG.A.JUD.6kscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2279
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114224655.2186173-7-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 23:03:22 +0000 (UTC)

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
 doc/proto.md | 73 ++++++++++++++++++++++++++++------------------------
 1 file changed, 40 insertions(+), 33 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 645a736..9c04411 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -2008,19 +2008,25 @@ size.
   64 bits: offset (unsigned)  
   32 bits: hole size (unsigned, MUST be nonzero)  

-  At this time, although servers that support extended headers are
-  permitted to accept client requests for `NBD_CMD_READ` with an
-  effect length larger than any advertised maximum block payload size
-  by splitting the reply into multiple chunks, portable clients SHOULD
-  NOT request a read *length* larger than 32 bits (corresponding to
-  the maximum block payload constraint implied by
-  `NBD_INFO_BLOCK_SIZE`), and therefore a 32-bit constraint on the
-  *hole size* does not represent an arbitrary limitation.  Should a
-  future scenario arise where it can be demonstrated that a client and
-  server would benefit from an extension allowing a maximum block
-  payload size to be larger than 32 bits, that extension would also
-  introduce a counterpart reply type that can express a 64-bit *hole
-  size*.
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
+  enforce a maximum block size that is smaller than 32 bits, in which
+  case no valid `NBD_CMD_READ` will have a *length* large enough to
+  require the use of this chunk type.  However, a client using
+  extended headers MUST be prepared for the server to use either the
+  compact or extended chunk type.

 * `NBD_REPLY_TYPE_BLOCK_STATUS` (5)

@@ -2218,26 +2224,27 @@ The following request types exist:
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
-    block payload size by splitting the response across multiple
-    chunks (in particular, if extended headers are not in use, a
-    request for more than 2^32 - 8 bytes containing data rather than
-    holes MUST be split to avoid overflowing the 32-bit
-    `NBD_REPLY_TYPE_OFFSET_DATA` length field); however, the server is
-    also permitted to reject large read requests up front, so a client
-    should be prepared to retry with smaller requests if a large
-    request fails.
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
+    larger than the maximum block payload size by splitting the
+    response across multiple chunks (in particular, if extended
+    headers are not in use, a request for more than 2^32 - 8 bytes
+    containing data rather than holes MUST be split to avoid
+    overflowing the 32-bit `NBD_REPLY_TYPE_OFFSET_DATA` length field);
+    however, the server is also permitted to reject large read
+    requests up front, so a client should be prepared to retry with
+    smaller requests if a large request fails.

     When no error is detected, the server MUST send enough data chunks
     to cover the entire region described by the offset and length of
-- 
2.38.1

