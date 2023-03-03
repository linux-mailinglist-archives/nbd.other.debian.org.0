Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E636AA4C3
	for <lists+nbd@lfdr.de>; Fri,  3 Mar 2023 23:47:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 403272088A; Fri,  3 Mar 2023 22:47:39 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar  3 22:47:39 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 483E2208C6
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Mar 2023 22:47:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.082 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id dIW4jYuCE9QG for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Mar 2023 22:47:20 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 7E8AB208A1
	for <nbd@other.debian.org>; Fri,  3 Mar 2023 22:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677883635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XK8t/e7YVPL5RHN8HJ9JoLH1ncLNXR2xNgH4IC4L32s=;
	b=eTqi/DI+zV7S3cUov67J2My1U92TsukFARTodFuoHvEKfiNc8ABBzTJXj/Gr+910ZZp8Np
	XpZHi0bF8wFVg3o5WICMJC6BuT2wG7TlnL+ZQIkVc/RDNjSH+FsOak/kXzMvJFYKZBEQpf
	2d0rRWtKpWLiM/H+fxQXp/2wcI/C13M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-PUcuTUaOMwelH3Cyj2-mWg-1; Fri, 03 Mar 2023 17:15:08 -0500
X-MC-Unique: PUcuTUaOMwelH3Cyj2-mWg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B307D3C0DDCA;
	Fri,  3 Mar 2023 22:15:07 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.108])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 428C92026D4B;
	Fri,  3 Mar 2023 22:15:07 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com,
	"Richard W . M . Jones" <rjones@redhat.com>
Subject: [PATCH] docs: Prefer 'cookie' over 'handle'
Date: Fri,  3 Mar 2023 16:15:03 -0600
Message-Id: <20230303221503.1769410-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hsLlJJSsoQM.A.TpH.LknAkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2344
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230303221503.1769410-1-eblake@redhat.com
Resent-Date: Fri,  3 Mar 2023 22:47:39 +0000 (UTC)

In libnbd, we quickly learned that distinguishing between 'handle'
(verb for acting on an object) and 'handle' (noun describing which
object to act on) could get confusing; we solved it by renaming the
latter to 'cookie'.  Copy that approach into the NBD spec, and make it
obvious that a cookie is opaque data from the point of view of the
server.  Makes no difference to implementations (other than older code
still using 'handle' may be slightly harder to tie back to the spec).

Suggested-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 doc/proto.md | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 3a96703..abb23e8 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -301,11 +301,11 @@ may be handled by the server asynchronously), and structured reply
 chunks from one request may be interleaved with reply messages from
 other requests; however, there may be constraints that prevent
 arbitrary reordering of structured reply chunks within a given reply.
-Clients SHOULD use a handle that is distinct from all other currently
-pending transactions, but MAY reuse handles that are no longer in
-flight; handles need not be consecutive.  In each reply message
+Clients SHOULD use a cookie that is distinct from all other currently
+pending transactions, but MAY reuse cookies that are no longer in
+flight; cookies need not be consecutive.  In each reply message
 (whether simple or structured), the server MUST use the same value for
-handle as was sent by the client in the corresponding request.  In
+cookie as was sent by the client in the corresponding request.  In
 this way, the client can correlate which request is receiving a
 response.

@@ -349,7 +349,7 @@ The request message, sent by the client, looks as follows:
 C: 32 bits, 0x25609513, magic (`NBD_REQUEST_MAGIC`)  
 C: 16 bits, command flags  
 C: 16 bits, type  
-C: 64 bits, handle  
+C: 64 bits, cookie  
 C: 64 bits, offset (unsigned)  
 C: 32 bits, length (unsigned)  
 C: (*length* bytes of data if the request is of type `NBD_CMD_WRITE`)  
@@ -366,7 +366,7 @@ follows:
 S: 32 bits, 0x67446698, magic (`NBD_SIMPLE_REPLY_MAGIC`; used to be
    `NBD_REPLY_MAGIC`)  
 S: 32 bits, error (MAY be zero)  
-S: 64 bits, handle  
+S: 64 bits, cookie  
 S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
     *error* is zero)  

@@ -381,7 +381,7 @@ server must initiate a hard disconnect).  Second, there is no way to
 efficiently skip over portions of a sparse file that are known to
 contain all zeroes.  Finally, it is not possible to reliably decode
 the server traffic without also having context of what pending read
-requests were sent by the client, to see which *handle* values will
+requests were sent by the client, to see which *cookie* values will
 have accompanying payload on success.  Therefore structured replies
 are also permitted if negotiated.

@@ -398,7 +398,7 @@ sending errors via a structured reply, as the error can then be
 accompanied by a string payload to present to a human user.

 A structured reply MAY occupy multiple structured chunk messages
-(all with the same value for "handle"), and the
+(all with the same value for "cookie"), and the
 `NBD_REPLY_FLAG_DONE` reply flag is used to identify the final
 chunk.  Unless further documented by individual requests below,
 the chunks MAY be sent in any order, except that the chunk with
@@ -418,7 +418,7 @@ A structured reply chunk message looks as follows:
 S: 32 bits, 0x668e33ef, magic (`NBD_STRUCTURED_REPLY_MAGIC`)  
 S: 16 bits, flags  
 S: 16 bits, type  
-S: 64 bits, handle  
+S: 64 bits, cookie  
 S: 32 bits, length of payload (unsigned)  
 S: *length* bytes of payload data (if *length* is nonzero)  

-- 
2.39.2

