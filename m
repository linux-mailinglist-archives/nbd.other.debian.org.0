Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 532004F88E5
	for <lists+nbd@lfdr.de>; Thu,  7 Apr 2022 23:37:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3A469203AC; Thu,  7 Apr 2022 21:37:49 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr  7 21:37:49 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 31F62203CD
	for <lists-other-nbd@bendel.debian.org>; Thu,  7 Apr 2022 21:37:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.789 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8uCzGQLY1nJT for <lists-other-nbd@bendel.debian.org>;
	Thu,  7 Apr 2022 21:37:30 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id B951520377
	for <nbd@other.debian.org>; Thu,  7 Apr 2022 21:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649367445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cUooFQ+8E7pKcJQMTjASZJ9E2zCnxKtkowaUvEeswRo=;
	b=iHtP1UV4PLoHYZNlTLEqwTFlM/sNDO+2ukWHghTevXoIjQhfTVdQzMFGMCUidvS4zzr3/F
	sXRBEB+29nhhHkE3shlKefKUhD5XnRqoEMh2aTetvPN8yDw+QlKVns0ms6p5jONlzE/sCQ
	gpbHlgTyR5qahH+ex+RzGAPMQGanmmk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-DmF8RbJTOhGS_Cca4gCFQQ-1; Thu, 07 Apr 2022 17:37:22 -0400
X-MC-Unique: DmF8RbJTOhGS_Cca4gCFQQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CB7F1010360;
	Thu,  7 Apr 2022 21:37:22 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 166D0407DEC7;
	Thu,  7 Apr 2022 21:37:22 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: libguestfs@redhat.com,
	qemu-block@nongnu.org,
	v.sementsov-og@mail.ru
Subject: [PATCH 2/2] spec: Tweak description of maximum block size
Date: Thu,  7 Apr 2022 16:37:20 -0500
Message-Id: <20220407213720.250252-3-eblake@redhat.com>
In-Reply-To: <20220407213720.250252-1-eblake@redhat.com>
References: <20220407213720.250252-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nygvrPOi1aF.A.lWD.tm1TiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1922
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220407213720.250252-3-eblake@redhat.com
Resent-Date: Thu,  7 Apr 2022 21:37:49 +0000 (UTC)

Commit 9f30fedb improved the spec to allow non-payload requests that
exceed any advertised maximum block size.  Take this one step further
by permitting the server to use NBD_EOVERFLOW as a hint to the client
when a request is oversize (while permitting NBD_EINVAL for
back-compat), and by rewording the text to explicitly call out that
what is being advertised is the maximum payload length, not maximum
block size.  This becomes more important when we add 64-bit
extensions, where it becomes possible to extend `NBD_CMD_BLOCK_STATUS`
to have both an effect length (how much of the image does the client
want status on) and a payload length (filtering the response to a
subset of negotiated metadata contexts).
---
 doc/proto.md | 70 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 30 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index c3c7cd9..e332e21 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -769,8 +769,8 @@ learn the server's constraints without committing to them.

 If block size constraints have not been advertised or agreed on
 externally, then a server SHOULD support a default minimum block size
-of 1, a preferred block size of 2^12 (4,096), and a maximum block size
-that is effectively unlimited (0xffffffff, or the export size if that
+of 1, a preferred block size of 2^12 (4,096), and a maximum block payload
+size that is at least 2^25 (33,554,432) (or the export size if that
 is smaller), while a client desiring maximum interoperability SHOULD
 constrain its requests to a minimum block size of 2^9 (512), and limit
 `NBD_CMD_READ` and `NBD_CMD_WRITE` commands to a maximum block size of
@@ -815,8 +815,8 @@ the preferred block size for that export.  The server MAY advertise an
 export size that is not an integer multiple of the preferred block
 size.

-The maximum block size represents the maximum length that the server
-is willing to handle in one request.  If advertised, it MAY be
+The maximum block size represents the maximum payload length that the
+server is willing to handle in one request.  If advertised, it MAY be
 something other than a power of 2, but MUST be either an integer
 multiple of the minimum block size or the value 0xffffffff for no
 inherent limit, MUST be at least as large as the smaller of the
@@ -825,7 +825,20 @@ preferred block size or export size, and SHOULD be at least 2^20
 MAY advertise a maximum block size that is larger than the export
 size, although in that case, the client MUST treat the export size as
 the effective maximum block size (as further constrained by a nonzero
-offset).
+offset). For commands that require a payload in either direction and
+where the client controls the payload length (`NBD_CMD_WRITE` or
+`NBD_CMD_READ`), the client MUST NOT use a length larger than the
+maximum block size. For replies where the payload length is controlled
+by the server (such as `NBD_CMD_BLOCK_STATUS` without the flag
+`NBD_CMD_FLAG_REQ_ONE`), the server MUST NOT send a reply larger than
+the maximum block size. For commands that do not require a payload
+(such as `NBD_CMD_TRIM`), the client MAY request a length larger than
+the maximum; the server SHOULD NOT disconnect, but MAY reply with an
+`NBD_EOVERFLOW` or `NBD_EINVAL` error if the oversize request would
+require more server resources than the same command operating on only
+the maximum block size (such as some implementations of
+`NBD_CMD_WRITE_ZEROES` without the flag `NBD_CMD_FLAG_FAST_ZERO`, or
+`NBD_CMD_CACHE`).

 Where a transmission request can have a nonzero *offset* and/or
 *length* (such as `NBD_CMD_READ`, `NBD_CMD_WRITE`, or `NBD_CMD_TRIM`),
@@ -833,24 +846,17 @@ the client MUST ensure that *offset* and *length* are integer
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
+*offset*, would exceed the export size.  The server SHOULD report an
+`NBD_EINVAL` error if the client's request is not aligned to advertised
+minimum block size boundaries or would exceed the export size.
+
 Notwithstanding any maximum block size advertised, either the server
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
+or the client MAY initiate a hard disconnect if a payload length of
+either a request or a reply would be large enough to be deemed a
+denial of service attack; however, for maximum portability, any
+*length* less than 2^25 (33,554,432) bytes SHOULD NOT be considered a
+denial of service attack (even if the advertised maximum block size is
+smaller).

 ## Metadata querying

@@ -1592,7 +1598,7 @@ during option haggling in the fixed newstyle negotiation.
       - 16 bits, `NBD_INFO_BLOCK_SIZE`  
       - 32 bits, minimum block size  
       - 32 bits, preferred block size  
-      - 32 bits, maximum block size  
+      - 32 bits, maximum block payload size  

 * `NBD_REP_META_CONTEXT` (4)

@@ -1740,7 +1746,8 @@ Some chunk types can additionally be categorized by role, such as
 *error chunks* or *content chunks*.  Each type determines how to
 interpret the "length" bytes of payload.  If the client receives
 an unknown or unexpected type, other than an *error chunk*, it
-MUST initiate a hard disconnect.
+MUST initiate a hard disconnect.  A server MUST NOT send a chunk
+larger than any advertised maximum block payload size.

 * `NBD_REPLY_TYPE_NONE` (0)

@@ -2111,11 +2118,12 @@ The following request types exist:
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
@@ -2266,7 +2274,9 @@ SHOULD return `NBD_EPERM` if it receives a write or trim request on a
 read-only export.

 The server SHOULD NOT return `NBD_EOVERFLOW` except as documented in
-response to `NBD_CMD_READ` when `NBD_CMD_FLAG_DF` is supported.
+response to `NBD_CMD_READ` when `NBD_CMD_FLAG_DF` is supported, or when
+a command without payload requests a length larger than an advertised
+maximum block payload length.

 The server SHOULD NOT return `NBD_ENOTSUP` except as documented in
 response to `NBD_CMD_WRITE_ZEROES` when `NBD_CMD_FLAG_FAST_ZERO` is
-- 
2.35.1

