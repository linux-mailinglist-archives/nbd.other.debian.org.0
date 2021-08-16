Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1963EDD41
	for <lists+nbd@lfdr.de>; Mon, 16 Aug 2021 20:41:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CCC0520663; Mon, 16 Aug 2021 18:41:24 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 16 18:41:24 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7C236205BB
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 Aug 2021 18:41:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.255 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Z1s7CbhcJ35v for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 Aug 2021 18:41:11 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id C22942059D
	for <nbd@other.debian.org>; Mon, 16 Aug 2021 18:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629139266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DclsIDM5Qn2Ezv1iawDfOJMPICE4/Tquedzj81vEzOU=;
	b=iBza4AhvX/85al/E9JlIAlD1MNNo7Sl7DXdv4eLuRTP0EYV/afsR5zcMbXJwNuTNiYxlT4
	8rd5TLs9iYdu0UOCnLvPKPgCrpwGs3Gx1AVG5JiHjxX8qslXyrz8iuSNAmvPVkpp744VuX
	RPBuB0z3c+qkZNvWSsvH9FyEm5tiRuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-oF07x34YP4-VYlaNpY-J2w-1; Mon, 16 Aug 2021 14:41:05 -0400
X-MC-Unique: oF07x34YP4-VYlaNpY-J2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5650190A7AD;
	Mon, 16 Aug 2021 18:41:03 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-125.phx2.redhat.com [10.3.113.125])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4E4761095;
	Mon, 16 Aug 2021 18:40:59 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: libguestfs@redhat.com,
	qemu-block@nongnu.org
Subject: [PATCH] spec: Relax NBD_OPT_LIST_META_CONTEXTS
Date: Mon, 16 Aug 2021 13:40:59 -0500
Message-Id: <20210816184059.69709-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8tYwAKvmrGO.A.8mE.UFrGhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1296
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210816184059.69709-1-eblake@redhat.com
Resent-Date: Mon, 16 Aug 2021 18:41:24 +0000 (UTC)

Using OPT_SET_META_CONTEXTS is stateful (it is documented to wipe out
any previously-requested contexts, and we just tightened the spec to
clarify that starting TLS also wipes it out).  But
OPT_LIST_META_CONTEXTS is not stateful; and in fact, with a
SELECTIVETLS server, it can be handy to list the meta contexts
available on an unencrypted export, then enable encryption, and then
further list what contexts are available on encrypted exports (as the
server is permitted to let them differ).  Thus, while a wise client
will renegotiate structured replies after the starttls, there's no
reason to forbid a server from answering a client that uses
list_meta_contexts prior to encryption without also requesting
structured replies.
---
 doc/proto.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 9dd59da..1586d7d 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -1325,9 +1325,9 @@ of the newstyle negotiation.
     Return a list of `NBD_REP_META_CONTEXT` replies, one per context,
     followed by an `NBD_REP_ACK` or an error.

-    This option MUST NOT be requested unless structured replies have
+    This option SHOULD NOT be requested unless structured replies have
     been negotiated first. If a client attempts to do so, a server
-    SHOULD send `NBD_REP_ERR_INVALID`.
+    MAY send `NBD_REP_ERR_INVALID`.

     Data:
     - 32 bits, length of export name.  
-- 
2.31.1

