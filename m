Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C03D6628CFA
	for <lists+nbd@lfdr.de>; Tue, 15 Nov 2022 00:02:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A27292066B; Mon, 14 Nov 2022 23:02:49 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 23:02:49 2022
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
	by bendel.debian.org (Postfix) with ESMTP id F0D2F20545
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 23:02:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.596 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xEaNzd0QxQbQ for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 23:02:27 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 54BEA20534
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 23:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668466942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uuaSAbLULdKS6n+Mze1ExTD67+B/CL/4oJ/FeniV1kM=;
	b=DCY2VPrcYcIW89tRR1z25A92cGac4liP/mgg+wn6XV6yt2qMr25gn1vFw9WqgqioEt81KV
	qzLZQgKS7LmxrCLiU+qC4R3Nl6wQoKOuymfEJxoB2TxE09l89Z2DRxbsthALr8EyLTiWBJ
	5tkOaahWiO/bK6tbay3Z9xdf3GpRNNQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-dgxc94uaPS2864B-M07Ixw-1; Mon, 14 Nov 2022 17:47:01 -0500
X-MC-Unique: dgxc94uaPS2864B-M07Ixw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23FBD811E84;
	Mon, 14 Nov 2022 22:47:01 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B1DA12024CC0;
	Mon, 14 Nov 2022 22:47:00 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH v2 4/6] spec: Allow 64-bit block status results
Date: Mon, 14 Nov 2022 16:46:53 -0600
Message-Id: <20221114224655.2186173-5-eblake@redhat.com>
In-Reply-To: <20221114224655.2186173-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <1TKJrQz4v9D.A.COD.ZkscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2276
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114224655.2186173-5-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 23:02:49 +0000 (UTC)

There are some potential extension metadata contexts that would
benefit from a 64-bit status value.  For example, Zoned Block Devices
(see https://zonedstorage.io/docs/linux/zbd-api) may want to return
the relative offset of where the next write will occur within the
zone, where a zone may be larger than 4G; creating a metacontext
"zbd:offset" that returns a 64-bit offset seems nicer than creating
two metacontexts "zbd:offset_lo" and "zbd:offset_hi" that each return
only 32 bits of the answer.

While the addition of extended headers superficially justified leaving
room in NBD_REPLY_TYPE_BLOCK_STATUS_EXT for the purpose of alignment,
it also has the nice benefit of being useful to allow extension
metadata contexts that can actually take advantage of the padding (and
remembering that since network byte order is big-endian, the padding
is in the correct location).  To ensure maximum backwards
compatibility, require that all contexts in the "base:" namespace (so
far, just "base:allocation") will only utilize 32-bit status.
---
 doc/proto.md | 62 +++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 49 insertions(+), 13 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index fde1e70..14af48d 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -987,7 +987,10 @@ The procedure works as follows:
   during transmission, the client MUST select one or more metadata
   contexts with the `NBD_OPT_SET_META_CONTEXT` command. If needed, the
   client can use `NBD_OPT_LIST_META_CONTEXT` to list contexts that the
-  server supports.
+  server supports.  Most metadata contexts expose no more than 32 bits
+  of information, but some metadata contexts have associated data that
+  is 64 bits in length; using such contexts requires the client to
+  first negotiate extended headers with `NBD_OPT_EXTENDED_HEADERS`.
 - During transmission, a client can then indicate interest in metadata
   for a given region by way of the `NBD_CMD_BLOCK_STATUS` command,
   where *offset* and *length* indicate the area of interest. On
@@ -1045,7 +1048,7 @@ third-party namespaces are currently registered:
 Save in respect of the `base:` namespace described below, this specification
 requires no specific semantics of metadata contexts, except that all the
 information they provide MUST be representable within the flags field as
-defined for `NBD_REPLY_TYPE_BLOCK_STATUS`. Likewise, save in respect of
+defined for `NBD_REPLY_TYPE_BLOCK_STATUS_EXT`. Likewise, save in respect of
 the `base:` namespace, the syntax of query strings is not specified by this
 document, other than the recommendation that the empty leaf-name makes
 sense as a wildcard for a client query during `NBD_OPT_LIST_META_CONTEXT`,
@@ -1112,7 +1115,9 @@ should make no assumption as to its contents or stability.

 For the `base:allocation` context, the remainder of the flags field is
 reserved. Servers SHOULD set it to all-zero; clients MUST ignore
-unknown flags.
+unknown flags.  Because fewer than 32 flags are defined, this metadata
+context does not require the use of `NBD_OPT_EXTENDED_HEADERS`, and a
+server can use `NBD_REPLY_TYPE_BLOCK_STATUS` to return results.

 ## Values

@@ -1480,6 +1485,18 @@ of the newstyle negotiation.
     to do so, a server MAY send `NBD_REP_ERR_INVALID` or
     `NBD_REP_ERR_EXT_HEADER_REQD`.

+    A server MAY support extension contexts that produce status values
+    that require more than 32 bits.  The server MAY advertise such
+    contexts even if the client has not yet negotiated extended
+    headers, although it SHOULD then conclude the overall response
+    with the `NBD_REP_ERR_EXT_HEADER_REQD` error to inform the client
+    that extended headers are required to make full use of all
+    contexts advertised.  However, since none of the contexts defined
+    in the "base:" namespace provide more than 32 bits of status, a
+    server MUST NOT use this failure mode when the response is limited
+    to the "base:" namespace; nor may the server use this failure mode
+    when the client has already negotiated extended headers.
+
     Data:
     - 32 bits, length of export name.  
     - String, name of export for which we wish to list metadata
@@ -1565,6 +1582,13 @@ of the newstyle negotiation.
     to do so, a server SHOULD send `NBD_REP_ERR_INVALID` or
     `NBD_REP_ERR_EXT_HEADER_REQD`.

+    If a client requests a metadata context that utilizes 64-bit
+    status, but has not yet negotiated extended headers, the server
+    MUST either omit that context from its successful reply, or else
+    fail the request with `NBD_REP_ERR_EXT_HEADER_REQD`.  The server
+    MUST NOT use this failure for a client request that is limited to
+    contexts in the "base:" namespace.
+
     A client MUST NOT send `NBD_CMD_BLOCK_STATUS` unless within the
     negotiation phase it sent `NBD_OPT_SET_META_CONTEXT` at least
     once, and where the final time it was sent, it referred to the
@@ -2028,16 +2052,23 @@ size.
   extent information at the first offset not covered by a
   reduced-length reply.

+  For an extension metadata context that documents that the status
+  value may potentially occupy 64 bits, a server MUST NOT use this
+  reply type unless the most-significant 32 bits of all *status*
+  values included in this reply are all zeroes.  Note that if the
+  client did not negotiate extended headers, then the server already
+  guaranteed during the handshake phase that no metadata contexts
+  utilizing a 64-bit status value were negotiated.
+
 * `NBD_REPLY_TYPE_BLOCK_STATUS_EXT` (6)

   This chunk type is in the status chunk category.  *length* MUST be
   8 + (a positive multiple of 16).  The semantics of this chunk mirror
   those of `NBD_REPLY_TYPE_BLOCK_STATUS`, other than the use of a
-  larger *extent length* field, added padding in each descriptor to
-  ease alignment, and the addition of a *descriptor count* field that
-  can be used for easier client processing.  This chunk type MUST NOT
-  be used unless extended headers were negotiated with
-  `NBD_OPT_EXTENDED_HEADERS`.
+  larger *extent length* field and a 64-bit *status* field, and the
+  addition of a *descriptor count* field that can be used for easier
+  client processing.  This chunk type MUST NOT be used unless extended
+  headers were negotiated with `NBD_OPT_EXTENDED_HEADERS`.

   If the *descriptor count* field contains 0, the number of subsequent
   descriptors is determined solely by the *length* field of the reply
@@ -2056,14 +2087,19 @@ size.

   64 bits, length of the extent to which the status below
      applies (unsigned, MUST be nonzero)  
-  32 bits, padding (MUST be zero)  
-  32 bits, status flags  
+  64 bits, status flags  

   Note that even when extended headers are in use, the client MUST be
   prepared for the server to use either the compact or extended chunk
-  type, regardless of whether the client's hinted effect length was
-  more or less than 32 bits; but the server MUST use exactly one of
-  the two chunk types per negotiated metacontext ID.
+  type for metadata contexts, regardless of whether the client's
+  hinted effect length was more or less than 32 bits; but the server
+  MUST use exactly one of the two chunk types per negotiated
+  metacontext ID.  However, the server MUST use the extended chunk
+  type when responding to an extension metadata context that utilizes
+  a 64-bit status code where the resulting *status* value is not
+  representable in 32 bits.  For metadata contexts that only return a
+  32-bit status (including all contexts in the "base:" namespace), the
+  most-significant 32 bits of *status* MUST be all zeroes.

 All error chunk types have bit 15 set, and begin with the same
 *error*, *message length*, and optional *message* fields as
-- 
2.38.1

