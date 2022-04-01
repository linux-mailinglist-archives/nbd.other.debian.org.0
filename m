Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A434EFC00
	for <lists+nbd@lfdr.de>; Fri,  1 Apr 2022 23:08:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9B8872131A; Fri,  1 Apr 2022 21:08:39 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Apr  1 21:08:39 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,PHONENUMBER,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A937B20B4F
	for <lists-other-nbd@bendel.debian.org>; Fri,  1 Apr 2022 21:08:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.289 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, PHONENUMBER=1.5, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Y5eca1P6hzk2 for <lists-other-nbd@bendel.debian.org>;
	Fri,  1 Apr 2022 21:08:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-124.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 8560E21241
	for <nbd@other.debian.org>; Fri,  1 Apr 2022 21:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648847297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=soqSgOAjTRIerUHmjQxZ+5XiFE0q3oOf6Ukm2gsWyoE=;
	b=PVhIbyESxbrhrZXTdiUe8EkwS3AJA6VoDyJijFnEqN+r38GxYz1/NCTflKKYSRdunacyh7
	15bjkH5+FR3Tbvh2xSV8h3clMdCQTfobHeQorxAAponPbjKwzqczEf1IOutn0kEiNdbj0F
	YQ6wgsJbDhcy7hUCxtH/vpNnfoAnwSA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-Q9HqyfnEMIGrhbC7vazz4A-1; Fri, 01 Apr 2022 17:08:12 -0400
X-MC-Unique: Q9HqyfnEMIGrhbC7vazz4A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED8081C05AE9;
	Fri,  1 Apr 2022 21:08:11 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.185])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC1CD111CD48;
	Fri,  1 Apr 2022 21:08:07 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: libguestfs@redhat.com,
	qemu-block@nongnu.org,
	v.sementsov-og@mail.ru,
	rjones@redhat.com
Subject: [PATCH v3] spec: Clarify BLOCK_STATUS reply details
Date: Fri,  1 Apr 2022 16:08:07 -0500
Message-Id: <20220401210807.1515492-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xw6yYCRFZkH.A.F2G.Xn2RiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1844
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220401210807.1515492-1-eblake@redhat.com
Resent-Date: Fri,  1 Apr 2022 21:08:39 +0000 (UTC)

Our docs were inconsistent on whether a NBD_REPLY_TYPE_BLOCK_STATUS
reply chunk can exceed the client's requested length, and silent on
whether the lengths must be consistent when multiple contexts were
negotiated.  Clarify this to match existing practice as implemented in
qemu-nbd.  Clean up some nearby grammatical errors while at it.
---

Another round of rewording attempts, based on feedback from Rich on
v2.  I went ahead and pushed patch 1 and 2 of the v2 series, as they
were less controversial.

 doc/proto.md | 42 ++++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 8a817d2..bacccfa 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -882,15 +882,25 @@ The procedure works as follows:
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
+  success, the server MUST respond with one structured reply chunk of
+  type `NBD_REPLY_TYPE_BLOCK_STATUS` per metadata context selected
+  during negotiation, where each reply chunk is a list of one or more
+  consecutive extents for that context.  Each extent comes with a
+  *flags* field, the semantics of which are defined by the metadata
+  context.
+
+The client's requested *length* is only a hint to the server, so the
+cumulative extent length contained in a chunk of the server's reply
+may be shorter or longer the original request.  When more than one
+metadata context was negotiated, the reply chunks for the different
+contexts of a single block status request need not have the same
+number of extents or cumulative extent length.
+
+In the request, the client may use the `NBD_CMD_FLAG_REQ_ONE` command
+flag to further constrain the server's reply so that each chunk
+contains exactly one extent whose length does not exceed the client's
+original *length*.

 A client MUST NOT use `NBD_CMD_BLOCK_STATUS` unless it selected a
 nonzero number of metadata contexts during negotiation, and used the
@@ -1778,8 +1788,8 @@ MUST initiate a hard disconnect.
   *length* MUST be 4 + (a positive integer multiple of 8).  This reply
   represents a series of consecutive block descriptors where the sum
   of the length fields within the descriptors is subject to further
-  constraints documented below. This chunk type MUST appear
-  exactly once per metadata ID in a structured reply.
+  constraints documented below.  A successful block status request MUST
+  have exactly one status chunk per negotiated metadata context ID.

   The payload starts with:

@@ -1801,15 +1811,19 @@ MUST initiate a hard disconnect.
   *length* of the final extent MAY result in a sum larger than the
   original requested length, if the server has that information anyway
   as a side effect of reporting the status of the requested region.
+  When multiple metadata contexts are negotiated, the reply chunks for
+  the different contexts need not have the same number of extents or
+  cumulative extent length.

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

