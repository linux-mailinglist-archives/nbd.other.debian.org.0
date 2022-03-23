Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D9E4E5827
	for <lists+nbd@lfdr.de>; Wed, 23 Mar 2022 19:09:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6AB5F203A2; Wed, 23 Mar 2022 18:09:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 23 18:09:28 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4805520336
	for <lists-other-nbd@bendel.debian.org>; Wed, 23 Mar 2022 18:09:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.605 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-1.517,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PPTr1zt4oPWW for <lists-other-nbd@bendel.debian.org>;
	Wed, 23 Mar 2022 18:09:09 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id E361520322
	for <nbd@other.debian.org>; Wed, 23 Mar 2022 18:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648058944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XWBN/M2Him9JK18gNEQMeO46KdEqWfuDO6O1P+OXQhk=;
	b=Y49Yggg2sdLIehY1YRPy6lLzlnXh1/bMgEQA5vzoVWAmWk4OizzCR43XYQH764zl/x3wDp
	jMVELPUNZmFvLri9swkzLeQEKkCA1zu04mbxjiaW4nIKdCm62DKhDW1edj21ZSpDDpNMCl
	S3ILO96ajjFlsEFY1t7f8K2DJz9zltA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-qeNCTRajPLy_qdcR15Q4Mg-1; Wed, 23 Mar 2022 14:09:02 -0400
X-MC-Unique: qeNCTRajPLy_qdcR15Q4Mg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72D2C185A7B2
	for <nbd@other.debian.org>; Wed, 23 Mar 2022 18:09:02 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.22.12.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4691A401472
	for <nbd@other.debian.org>; Wed, 23 Mar 2022 18:09:02 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Subject: [PATCH 2/3] docs: Clarify structured reads vs. block size constraints
Date: Wed, 23 Mar 2022 13:09:00 -0500
Message-Id: <20220323180901.783198-3-eblake@redhat.com>
In-Reply-To: <20220323180901.783198-1-eblake@redhat.com>
References: <20220323180901.783198-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_OmzBlcgnTB.A.BYG.YJ2OiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1749
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220323180901.783198-3-eblake@redhat.com
Resent-Date: Wed, 23 Mar 2022 18:09:28 +0000 (UTC)

The text for structured reads mentioned a mandatory split of certain
large reads, without also mentioning that large reads are generally
not possible when block constraints are in play.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 doc/proto.md | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index bfebb5a..8a817d2 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -1911,13 +1911,14 @@ The following request types exist:
     chunks that describe data outside the offset and length of the
     request, but MAY send the content chunks in any order (the client
     MUST reassemble content chunks into the correct order), and MAY
-    send additional content chunks even after reporting an error chunk.
-    Note that a request for more than 2^32 - 8 bytes MUST be split
-    into at least two chunks, so as not to overflow the length field
-    of a reply while still allowing space for the offset of each
-    chunk.  When no error is detected, the server MUST send enough
-    data chunks to cover the entire region described by the offset and
-    length of the client's request.
+    send additional content chunks even after reporting an error
+    chunk.  Note that a request for more than 2^32 - 8 bytes (if
+    permitted by block size constraints) MUST be split into at least
+    two chunks, so as not to overflow the length field of a reply
+    while still allowing space for the offset of each chunk.  When no
+    error is detected, the server MUST send enough data chunks to
+    cover the entire region described by the offset and length of the
+    client's request.

     To minimize traffic, the server MAY use a content or error chunk
     as the final chunk by setting the `NBD_REPLY_FLAG_DONE` flag, but
-- 
2.35.1

