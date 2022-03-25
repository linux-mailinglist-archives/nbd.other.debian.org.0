Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 969BE4E73AB
	for <lists+nbd@lfdr.de>; Fri, 25 Mar 2022 13:41:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 68FC52041B; Fri, 25 Mar 2022 12:41:36 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 25 12:41:36 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D759E20411
	for <lists-other-nbd@bendel.debian.org>; Fri, 25 Mar 2022 12:41:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.605 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.517, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id GcwZqQI1h_pl for <lists-other-nbd@bendel.debian.org>;
	Fri, 25 Mar 2022 12:41:18 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 17FE22041A
	for <nbd@other.debian.org>; Fri, 25 Mar 2022 12:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648212073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d1sgZtHxdrzAh7fhVSJ0VmO15Kwl18UFOZSV4W8SLSs=;
	b=iBb50kDHX6oei1HPnyLwEaNUCH4XWr6HZbQJG1ctOCLRmhkwTDCpssf0aG1MrQ9+7Py5nL
	6itYTvEyRG8/eK9+t6rNNbOKrr+j7KWc5AFu1cunN1vAWR7YvjSMgxoTsGTy3C2iRlZ7KM
	wW/mN0am7nbOg+TXGMebleYnhyYKmBo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-RIOmFSHVMJ6NDfJulQbSMQ-1; Fri, 25 Mar 2022 08:41:12 -0400
X-MC-Unique: RIOmFSHVMJ6NDfJulQbSMQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51F3D1C01515;
	Fri, 25 Mar 2022 12:41:06 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.192])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DDCA0401053;
	Fri, 25 Mar 2022 12:41:04 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: v.sementsov-og@mail.ru,
	qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH v2 1/3] docs: Clarify NBD_REPLY_TYPE_ERROR lengths
Date: Fri, 25 Mar 2022 07:41:00 -0500
Message-Id: <20220325124102.921017-2-eblake@redhat.com>
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
Resent-Message-ID: <06CY6z3p-LN.A.HFG.AibPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1805
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220325124102.921017-2-eblake@redhat.com
Resent-Date: Fri, 25 Mar 2022 12:41:36 +0000 (UTC)

Add explicit mention that human-readable error message strings must
comply with the overall NBD string limits.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 doc/proto.md | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/doc/proto.md b/doc/proto.md
index 81ac755..bfebb5a 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -1824,7 +1824,9 @@ remaining structured fields at the end.
   be at least 6.  This chunk represents that an error occurred,
   and the client MAY NOT make any assumptions about partial
   success. This type SHOULD NOT be used more than once in a
-  structured reply.  Valid as a reply to any request.
+  structured reply.  Valid as a reply to any request.  Note that
+  *message length* MUST NOT exceed the 4096 bytes string length
+  limit.

   The payload is structured as:

-- 
2.35.1

