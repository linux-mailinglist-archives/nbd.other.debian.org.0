Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A21334E73AA
	for <lists+nbd@lfdr.de>; Fri, 25 Mar 2022 13:41:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 626242041B; Fri, 25 Mar 2022 12:41:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 25 12:41:28 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9C334202C6
	for <lists-other-nbd@bendel.debian.org>; Fri, 25 Mar 2022 12:41:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.605 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-1.517,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id FP_5m6Yv8I1F for <lists-other-nbd@bendel.debian.org>;
	Fri, 25 Mar 2022 12:41:14 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 8CE3A20312
	for <nbd@other.debian.org>; Fri, 25 Mar 2022 12:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648212069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XWBN/M2Him9JK18gNEQMeO46KdEqWfuDO6O1P+OXQhk=;
	b=T5+aQ/9jGlnuepBFpTgcR0JGJI3RKdXFZW6MIydJ17J2Yk+0uSfG9uauTY/IXj5W7OyrIl
	wtRX45p8Y69jHrTKT3ioViiMa/zVHnBUAnxoTUO4wHDQ9bSRVQEfdUVPEad+69PYNGCAU6
	hzeaov8k5HuYtRM7Z84+tJwLJch2JFs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-RM30sf8dMXuKJIY8pBLqWw-1; Fri, 25 Mar 2022 08:41:08 -0400
X-MC-Unique: RM30sf8dMXuKJIY8pBLqWw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F0B4185A7BA;
	Fri, 25 Mar 2022 12:41:07 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.192])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1FF29401E96;
	Fri, 25 Mar 2022 12:41:05 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: v.sementsov-og@mail.ru,
	qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH v2 2/3] docs: Clarify structured reads vs. block size constraints
Date: Fri, 25 Mar 2022 07:41:01 -0500
Message-Id: <20220325124102.921017-3-eblake@redhat.com>
In-Reply-To: <20220325124102.921017-1-eblake@redhat.com>
References: <20220325124102.921017-1-eblake@redhat.com>
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
Resent-Message-ID: <0qD_lq09huG.A.ADG.4hbPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1804
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220325124102.921017-3-eblake@redhat.com
Resent-Date: Fri, 25 Mar 2022 12:41:28 +0000 (UTC)

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

