Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 497A06E171C
	for <lists+nbd@lfdr.de>; Fri, 14 Apr 2023 00:03:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3919A20577; Thu, 13 Apr 2023 22:03:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr 13 22:03:23 2023
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
	by bendel.debian.org (Postfix) with ESMTP id A2CF520549
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Apr 2023 22:03:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.082 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8l5iDu0URriR for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Apr 2023 22:02:52 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 07BF120569
	for <nbd@other.debian.org>; Thu, 13 Apr 2023 22:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681423367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qjUI9qyOvCG0Z3D4tKMonOYtCc6QoaJYTQjMOJaDAJo=;
	b=DVESvL4G1AjfCwGqrMN9Fjp53QgmwhAxThTEiz9MMjuMyo96JzL3Q0YWOAtYYok4DJ2AL8
	SD4rJxdUZetP0ocQcTYBjB3I55iuApFjq2pOUWmux3TIjn9+7lfoUpplUzS0bxVKQojF8R
	h7HnULOIP84AV9/MFnFgYsfRh8V7uXk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-hrBrJHPKPQCthLnfDOeFLQ-1; Thu, 13 Apr 2023 18:02:45 -0400
X-MC-Unique: hrBrJHPKPQCthLnfDOeFLQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C06985C1A7;
	Thu, 13 Apr 2023 22:02:45 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23F832027043;
	Thu, 13 Apr 2023 22:02:45 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH v3 2/6] spec: Change maximum block size to maximum payload size
Date: Thu, 13 Apr 2023 17:02:37 -0500
Message-Id: <20230413220241.1396012-3-eblake@redhat.com>
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
Resent-Message-ID: <V-nrjEiw26H.A.C_F.rwHOkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2424
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230413220241.1396012-3-eblake@redhat.com
Resent-Date: Thu, 13 Apr 2023 22:03:23 +0000 (UTC)

Commit 9f30fedb improved the spec to allow non-payload requests like
NBD_CMD_TRIM that exceed any advertised maximum block size.  Take this
one step further by documenting that the server may use NBD_EOVERFLOW
as a hint to the client when a non-payload request is oversize (while
permitting NBD_EINVAL for back-compat), and by rewording the text to
explicitly call out that what is being advertised is the maximum
payload length, not maximum block size.  Furthermore, favor the term
'maximum payload size' instead of 'maximum block size', as the real
limitation here is how many bytes are sent in one direction as part of
the command (a maximum payload size may be related to maximum block
size, but existing implementations of both servers and clients that
actually implement NBD_INFO_BLOCK_SIZE have generally been advertising
things like a 32M or 64M data cap, and not an underlying block size
constraint).

Document existing practice that structured replies can slightly exceed
payload size (a client requesting a 32M NBD_CMD_READ can get a single
NBD_REPLY_TYPE_OFFSET_DATA of size 32M+8 bytes, rather than the server
splitting it across two chunks); the only hard limit here is that on
client/server pairs that permit larger payloads than 32M, the reply
type still has a 32-bit limit on payload size (no known client or
server actually tries to do an NBD_CMD_READ of 4G-1 bytes, but the
spec shouldn't prevent it).

This becomes more important when we add 64-bit extensions, where it
becomes possible to extend `NBD_CMD_BLOCK_STATUS` to have both an
effect length (how much of the image does the client want status on -
may be larger than 32 bits) and an optional payload length (a way to
filter the response to a subset of negotiated metadata contexts).  In
the shorter term, it means that a server may (but not must) accept a
read request larger than the maximum block size if it can use
structured replies to keep each chunk of the response under the
maximum payload limits.

Signed-off-by: Eric Blake <eblake@redhat.com>

---

v3: Completely drop 'maximum block length', and reword things even
more to emphasize maximum payload.  Clarify that a server's structured
reply CAN exceed the maximum payload by the amount of overhead
required by the reply type.
---
 doc/proto.md | 148 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 87 insertions(+), 61 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 0cb84f2..2651f13 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -747,8 +747,8 @@ text unless the client insists on TLS.

 During transmission phase, several operations are constrained by the
 export size sent by the final `NBD_OPT_EXPORT_NAME` or `NBD_OPT_GO`,
-as well as by three block size constraints defined here (minimum,
-preferred, and maximum).
+as well as by three block size constraints defined here (minimum
+block, preferred block, and maximum payload).

 If a client can honour server block size constraints (as set out below
 and under `NBD_INFO_BLOCK_SIZE`), it SHOULD announce this during the
@@ -774,15 +774,15 @@ learn the server's constraints without committing to them.

 If block size constraints have not been advertised or agreed on
 externally, then a server SHOULD support a default minimum block size
-of 1, a preferred block size of 2^12 (4,096), and a maximum block size
-that is effectively unlimited (0xffffffff, or the export size if that
-is smaller), while a client desiring maximum interoperability SHOULD
-constrain its requests to a minimum block size of 2^9 (512), and limit
-`NBD_CMD_READ` and `NBD_CMD_WRITE` commands to a maximum block size of
-2^25 (33,554,432).  A server that wants to enforce block sizes other
-than the defaults specified here MAY refuse to go into transmission
-phase with a client that uses `NBD_OPT_EXPORT_NAME` (via a hard
-disconnect) or which uses `NBD_OPT_GO` without requesting
+of 1, a preferred block size of 2^12 (4,096), and a maximum
+payload size that is at least 2^25 (33,554,432) (even if the export
+size is smaller); while a client desiring maximum interoperability
+SHOULD constrain its requests to a minimum block size of 2^9 (512),
+and limit `NBD_CMD_READ` and `NBD_CMD_WRITE` commands to a maximum
+payload size of 2^25 (33,554,432).  A server that wants to enforce block
+sizes other than the defaults specified here MAY refuse to go into
+transmission phase with a client that uses `NBD_OPT_EXPORT_NAME` (via
+a hard disconnect) or which uses `NBD_OPT_GO` without requesting
 `NBD_INFO_BLOCK_SIZE` (via an error reply of
 `NBD_REP_ERR_BLOCK_SIZE_REQD`); but servers SHOULD NOT refuse clients
 that do not request sizing information when the server supports
@@ -820,17 +820,45 @@ the preferred block size for that export.  The server MAY advertise an
 export size that is not an integer multiple of the preferred block
 size.

-The maximum block size represents the maximum length that the server
-is willing to handle in one request.  If advertised, it MAY be
-something other than a power of 2, but MUST be either an integer
-multiple of the minimum block size or the value 0xffffffff for no
-inherent limit, MUST be at least as large as the smaller of the
-preferred block size or export size, and SHOULD be at least 2^20
-(1,048,576) if the export is that large.  For convenience, the server
-MAY advertise a maximum block size that is larger than the export
-size, although in that case, the client MUST treat the export size as
-the effective maximum block size (as further constrained by a nonzero
-offset).
+The maximum payload size represents the maximum payload length that
+the server is willing to handle in one request from the client.  If
+advertised, it MAY be something other than a power of 2, but MUST be
+at least as large as the preferred block size, and SHOULD be at least
+2^20 (1,048,576) if the export is that large.  Advertising a maximum
+payload size of 0xffffffff is permitted when the server does not have
+a fixed limit on client request payloads.  Typically, the advertised
+maximum payload length is independent of the export size, even though
+the actual payloads for read and write cannot successfully exceed the
+constraints given by the export size and offset of a request.
+Notwithstanding any maximum payload size advertised, either the server
+or the client MAY initiate a hard disconnect if a payload length of
+either a request or a reply would be large enough to be deemed a
+denial of service attack; however, for maximum portability, any
+payload not exceeding 2^25 (33,554,432) bytes SHOULD NOT be considered
+a denial of service attack, even if that length is larger than the
+advertised maximum payload size.
+
+For commands that require a payload in either direction and where the
+client controls the payload length (`NBD_CMD_WRITE`, or `NBD_CMD_READ`
+with simple replies), the client MUST NOT request a length larger than
+the maximum payload size. For replies where the payload length is
+controlled by the server (`NBD_CMD_BLOCK_STATUS` without the flag
+`NBD_CMD_FLAG_REQ_ONE`, or `NBD_CMD_READ` when structured replies are
+negotiated), the server MAY exceed the maximum payload by the fixed
+amount of overhead required in the structured reply (for example, a
+server that advertises a maximum payload of 2^25 bytes may return
+2^25+8 payload bytes in a single `NBD_REPLY_TYPE_OFFSET_DATA` chunk,
+rather than splitting the reply across two chunks), although it MUST
+honor any additional payload constraints documented for a particular
+command.  For commands that do not require a payload in either
+direction (such as `NBD_CMD_TRIM` or `NBD_CMD_WRITE_ZEROES`), the
+client MAY request an effect length larger than the maximum payload
+size; the server SHOULD NOT disconnect, but MAY reply with an
+`NBD_EOVERFLOW` or `NBD_EINVAL` error if the oversize request would
+require too many server resources when compared to the same command
+with an effect length limited to the maximum payload size (such as an
+implementation of `NBD_CMD_WRITE_ZEROES` that utilizes a scratch
+buffer).

 Where a transmission request can have a nonzero *offset* and/or
 *length* (such as `NBD_CMD_READ`, `NBD_CMD_WRITE`, or `NBD_CMD_TRIM`),
@@ -838,24 +866,9 @@ the client MUST ensure that *offset* and *length* are integer
 multiples of any advertised minimum block size, and SHOULD use integer
 multiples of any advertised preferred block size where possible.  For
 those requests, the client MUST NOT use a *length* which, when added to
-*offset*, would exceed the export size. Also for NBD_CMD_READ,
-NBD_CMD_WRITE, NBD_CMD_CACHE and NBD_CMD_WRITE_ZEROES (except for
-when NBD_CMD_FLAG_FAST_ZERO is set), the client MUST NOT use a *length*
-larger than any advertised maximum block size.
-The server SHOULD report an `NBD_EINVAL` error if
-the client's request is not aligned to advertised minimum block size
-boundaries, or is larger than the advertised maximum block size.
-Notwithstanding any maximum block size advertised, either the server
-or the client MAY initiate a hard disconnect if the payload of an
-`NBD_CMD_WRITE` request or `NBD_CMD_READ` reply would be large enough
-to be deemed a denial of service attack; however, for maximum
-portability, any *length* less than 2^25 (33,554,432) bytes SHOULD NOT
-be considered a denial of service attack (even if the advertised
-maximum block size is smaller).  For all other commands, where the
-*length* is not reflected in the payload (such as `NBD_CMD_TRIM` or
-`NBD_CMD_WRITE_ZEROES`), a server SHOULD merely fail the command with
-an `NBD_EINVAL` error for a client that exceeds the maximum block size,
-rather than initiating a hard disconnect.
+*offset*, would exceed the export size.  The server SHOULD report an
+`NBD_EINVAL` error if the client's request is not aligned to advertised
+minimum block size boundaries or would exceed the export size.

 ## Metadata querying

@@ -1597,7 +1610,7 @@ during option haggling in the fixed newstyle negotiation.
       - 16 bits, `NBD_INFO_BLOCK_SIZE`  
       - 32 bits, minimum block size  
       - 32 bits, preferred block size  
-      - 32 bits, maximum block size  
+      - 32 bits, maximum payload size  

 * `NBD_REP_META_CONTEXT` (4)

@@ -1740,12 +1753,15 @@ unrecognized flags.

 #### Structured reply types

-These values are used in the "type" field of a structured reply.
-Some chunk types can additionally be categorized by role, such as
-*error chunks* or *content chunks*.  Each type determines how to
-interpret the "length" bytes of payload.  If the client receives
-an unknown or unexpected type, other than an *error chunk*, it
-MUST initiate a hard disconnect.
+These values are used in the "type" field of a structured reply.  Some
+chunk types can additionally be categorized by role, such as *error
+chunks* or *content chunks*.  Each type determines how to interpret
+the "length" bytes of payload.  If the client receives an unknown or
+unexpected type, other than an *error chunk*, it MUST initiate a hard
+disconnect.  A server MUST NOT send a chunk where any variable-length
+portion of the chunk is larger than any advertised maximum payload
+size (however, the overall chunk may exceed the maximum payload by the
+small amount of fixed-length overhead inherent in the chunk type).

 * `NBD_REPLY_TYPE_NONE` (0)

@@ -1908,7 +1924,9 @@ The following request types exist:
     If structured replies were not negotiated, then a read request
     MUST always be answered by a simple reply, as documented above
     (using magic 0x67446698 `NBD_SIMPLE_REPLY_MAGIC`, and containing
-    length bytes of data according to the client's request).
+    length bytes of data according to the client's request), which in
+    turn means any client request with a length larger than the
+    maximum payload size will fail.

     If an error occurs, the server SHOULD set the appropriate error code
     in the error field. The server MAY then initiate a hard disconnect.
@@ -1938,13 +1956,18 @@ The following request types exist:
     request, but MAY send the content chunks in any order (the client
     MUST reassemble content chunks into the correct order), and MAY
     send additional content chunks even after reporting an error
-    chunk.  Note that a request for more than 2^32 - 8 bytes (if
-    permitted by block size constraints) MUST be split into at least
-    two chunks, so as not to overflow the length field of a reply
-    while still allowing space for the offset of each chunk.  When no
-    error is detected, the server MUST send enough data chunks to
-    cover the entire region described by the offset and length of the
-    client's request.
+    chunk.  A server MAY support read requests larger than the maximum
+    payload size by splitting the response across multiple chunks (in
+    particular, a request for more than 2^32 - 8 bytes containing data
+    rather than holes MUST be split to avoid overflowing the 32-bit
+    `NBD_REPLY_TYPE_OFFSET_DATA` length field); however, the server is
+    also permitted to reject large read requests up front, so a client
+    should be prepared to retry with smaller requests if a large
+    request fails.
+
+    When no error is detected, the server MUST send enough data chunks
+    to cover the entire region described by the offset and length of
+    the client's request.

     To minimize traffic, the server MAY use a content or error chunk
     as the final chunk by setting the `NBD_REPLY_FLAG_DONE` flag, but
@@ -2117,11 +2140,12 @@ The following request types exist:
     If the server advertised `NBD_FLAG_SEND_FAST_ZERO` but
     `NBD_CMD_FLAG_FAST_ZERO` is not set, then the server MUST NOT fail
     with `NBD_ENOTSUP`, even if the operation is no faster than a
-    corresponding `NBD_CMD_WRITE`. Conversely, if
-    `NBD_CMD_FLAG_FAST_ZERO` is set, the server MUST fail quickly with
-    `NBD_ENOTSUP` unless the request can be serviced in less time than
-    a corresponding `NBD_CMD_WRITE`, and SHOULD NOT alter the contents
-    of the export when returning this failure. The server's
+    corresponding `NBD_CMD_WRITE`. Conversely, if `NBD_CMD_FLAG_FAST_ZERO`
+    is set, the server SHOULD NOT fail with `NBD_EOVERFLOW` regardless of
+    the client length, MUST fail quickly with `NBD_ENOTSUP` unless the
+    request can be serviced in less time than a corresponding
+    `NBD_CMD_WRITE`, and SHOULD NOT alter the contents of the export when
+    returning an `NBD_ENOTSUP` failure. The server's
     determination on whether to fail a fast request MAY depend on a
     number of factors, such as whether the request was suitably
     aligned, on whether the `NBD_CMD_FLAG_NO_HOLE` flag was present,
@@ -2274,7 +2298,9 @@ SHOULD return `NBD_EPERM` if it receives a write or trim request on a
 read-only export.

 The server SHOULD NOT return `NBD_EOVERFLOW` except as documented in
-response to `NBD_CMD_READ` when `NBD_CMD_FLAG_DF` is supported.
+response to `NBD_CMD_READ` when `NBD_CMD_FLAG_DF` is supported, or when
+a command without payload requests a length larger than an advertised
+maximum payload length.

 The server SHOULD NOT return `NBD_ENOTSUP` except as documented in
 response to `NBD_CMD_WRITE_ZEROES` when `NBD_CMD_FLAG_FAST_ZERO` is
-- 
2.39.2

