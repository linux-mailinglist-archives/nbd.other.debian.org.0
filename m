Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B245630297
	for <lists+nbd@lfdr.de>; Thu, 30 May 2019 21:08:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5D47B2063F; Thu, 30 May 2019 19:08:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 30 19:08:41 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 432EF20201
	for <lists-other-nbd@bendel.debian.org>; Thu, 30 May 2019 19:08:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id MyQonZxWQQAe for <lists-other-nbd@bendel.debian.org>;
	Thu, 30 May 2019 19:08:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E3B0220249
	for <nbd@other.debian.org>; Thu, 30 May 2019 19:08:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20EC1308124D
	for <nbd@other.debian.org>; Thu, 30 May 2019 19:08:26 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-169.phx2.redhat.com [10.3.116.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D64057E31C
	for <nbd@other.debian.org>; Thu, 30 May 2019 19:08:25 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Subject: [PATCH] docs: Recommend TCP_NODELAY (disabling Nagle)
Date: Thu, 30 May 2019 14:08:25 -0500
Message-Id: <20190530190825.14580-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 30 May 2019 19:08:26 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LM2kYyr_rf.A.sEF.5oC8cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/556
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190530190825.14580-1-eblake@redhat.com
Resent-Date: Thu, 30 May 2019 19:08:41 +0000 (UTC)

This text from https://en.wikipedia.org/wiki/Nagle%27s_algorithm
is telling:

"In any request-response application protocols where request data can
be larger than a packet, this can artificially impose a few hundred
milliseconds latency between the requester and the responder, even if
the requester has properly buffered the request data. Nagle's
algorithm should be disabled by the requester in this case. If the
response data can be larger than a packet, the responder should also
disable Nagle's algorithm so the requester can promptly receive the
whole response."

And we hit it in real life with libnbd/nbdkit - more than an order of
magnitude in slowdown results when trying to saturate a connection
with as many parallel requests as possible when Nagle's algorithm
introduces artificial delay waiting for the ACKs:
https://www.redhat.com/archives/libguestfs/2019-May/msg00237.html

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 doc/proto.md | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/doc/proto.md b/doc/proto.md
index 918e4ea..37156c9 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -64,6 +64,17 @@ client to communicate the options to the kernel which were negotiated
 with the server during the handshake. This document does not describe
 those.

+When handling the client-side transmission phase with the Linux
+kernel, the socket between the client and server can use either Unix
+or TCP sockets. For other implementations, the client and server can
+use any agreeable communication channel (a socket is typical, but it
+is also possible to implement the NBD protocol over a pair of
+uni-directional pipes). If TCP sockets are used, both the client and
+server SHOULD disable Nagle's algorithm (that is, use `setsockopt` to
+set the `TCP_NODELAY` option to non-zero), to eliminate artificial
+delays waiting for ACK response that would otherwise arise when a
+large message payload spans multiple network packets.
+
 ### Handshake

 The handshake is the first phase of the protocol. Its main purpose is to
-- 
2.20.1

