Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB574E582D
	for <lists+nbd@lfdr.de>; Wed, 23 Mar 2022 19:10:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6488B203A6; Wed, 23 Mar 2022 18:10:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 23 18:10:31 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,PHONENUMBER,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B458D203A1
	for <lists-other-nbd@bendel.debian.org>; Wed, 23 Mar 2022 18:10:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.105 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-1.517,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, PHONENUMBER=1.5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 2TXSOJ0JRu4K for <lists-other-nbd@bendel.debian.org>;
	Wed, 23 Mar 2022 18:10:17 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 9D1252039A
	for <nbd@other.debian.org>; Wed, 23 Mar 2022 18:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648059012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rTAkojrUJZMnMoqaD16WwJ6naim3Ba9zHsgZpfsLngA=;
	b=ao5/0n3lhUSZ9SuHsESLS2P6/kmR1XeZIVoym/t74PdZL06o0+s7MjazbcVc+uST0lFKX+
	vNsaAvAB7JCf6A7dFy8djCMNH2hEdX7ZIkim2QFj4tPVwh2mx+wde+ol8FyQSavSI21Q3h
	i7HOJpHYRJkVRhWmI+HehdlkTuqHjO8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-3qj_VdBBNV6mximxtjBUQg-1; Wed, 23 Mar 2022 14:09:03 -0400
X-MC-Unique: 3qj_VdBBNV6mximxtjBUQg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B88C5185A794
	for <nbd@other.debian.org>; Wed, 23 Mar 2022 18:09:02 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.22.12.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C71F401472
	for <nbd@other.debian.org>; Wed, 23 Mar 2022 18:09:02 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Subject: [PATCH 3/3] spec: Clarify BLOCK_STATUS reply details
Date: Wed, 23 Mar 2022 13:09:01 -0500
Message-Id: <20220323180901.783198-4-eblake@redhat.com>
In-Reply-To: <20220323180901.783198-1-eblake@redhat.com>
References: <20220323180901.783198-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zo6NCacezoM.A.6aG.XK2OiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1750
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220323180901.783198-4-eblake@redhat.com
Resent-Date: Wed, 23 Mar 2022 18:10:31 +0000 (UTC)

Our docs were inconsistent on whether a NBD_REPLY_TYPE_BLOCK_STATUS
reply chunk can exceed the client's requested length, and silent on
whether the lengths must be consistent whem multiple contexts were
negotiated.  Clarify this to match existing practice as implemented in
qemu-nbd.  Clean up some nearby grammatical errors while at it.
---
 doc/proto.md | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 8a817d2..4048e61 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -882,15 +882,17 @@ The procedure works as follows:
   server supports.
 - During transmission, a client can then indicate interest in metadata
   for a given region by way of the `NBD_CMD_BLOCK_STATUS` command,
-  where *offset* and *length* indicate the area of interest. The
-  server MUST then respond with the requested information, for all
-  contexts which were selected during negotiation. For every metadata
-  context, the server sends one set of extent chunks, where the sizes
-  of the extents MUST be less than or equal to the length as specified
-  in the request. Each extent comes with a *flags* field, the
-  semantics of which are defined by the metadata context.
-- A server MUST reply to `NBD_CMD_BLOCK_STATUS` with a structured
-  reply of type `NBD_REPLY_TYPE_BLOCK_STATUS`.
+  where *offset* and *length* indicate the area of interest. On
+  success, the server MUST respond with one set of extent chunks per
+  metadata context selected during negotiation, with each set packaged
+  in a structured reply of type `NBD_REPLY_TYPE_BLOCK_STATUS`.
+
+The client's requested *length* is only a hint to the server, so the
+cumulative size of the extents in each set of the server's reply may
+be shorter, or in some cases longer, than the original request, and
+may even differ between sets when more than one metacontext was
+negotiated.  Each extent comes with a *flags* field, the semantics of
+which are defined by the metadata context.

 A client MUST NOT use `NBD_CMD_BLOCK_STATUS` unless it selected a
 nonzero number of metadata contexts during negotiation, and used the
@@ -1778,8 +1780,8 @@ MUST initiate a hard disconnect.
   *length* MUST be 4 + (a positive integer multiple of 8).  This reply
   represents a series of consecutive block descriptors where the sum
   of the length fields within the descriptors is subject to further
-  constraints documented below. This chunk type MUST appear
-  exactly once per metadata ID in a structured reply.
+  constraints documented below.  A successful block status request MUST
+  have exactly one status chunk per negotiated metadata context ID.

   The payload starts with:

@@ -1801,15 +1803,18 @@ MUST initiate a hard disconnect.
   *length* of the final extent MAY result in a sum larger than the
   original requested length, if the server has that information anyway
   as a side effect of reporting the status of the requested region.
+  When multiple metadata contexts are negotiated, the cumulative
+  lengths in each chunk reply need not be identical.

   Even if the client did not use the `NBD_CMD_FLAG_REQ_ONE` flag in
   its request, the server MAY return fewer descriptors in the reply
   than would be required to fully specify the whole range of requested
   information to the client, if looking up the information would be
   too resource-intensive for the server, so long as at least one
-  extent is returned. Servers should however be aware that most
-  clients implementations will then simply ask for the next extent
-  instead.
+  extent is returned.  Servers should however be aware that most
+  client implementations will likely follow up with a request for
+  extent information at the first offset not covered by a
+  reduced-length reply.

 All error chunk types have bit 15 set, and begin with the same
 *error*, *message length*, and optional *message* fields as
-- 
2.35.1

