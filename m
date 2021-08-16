Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A06493EDD16
	for <lists+nbd@lfdr.de>; Mon, 16 Aug 2021 20:30:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7455620685; Mon, 16 Aug 2021 18:30:44 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 16 18:30:44 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E2FE92066B
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 Aug 2021 18:30:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.255 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-1.474,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pJOD0aIaI9pM for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 Aug 2021 18:30:32 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 5D13F20469
	for <nbd@other.debian.org>; Mon, 16 Aug 2021 18:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629138627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5Vl0m9Qb+e+WnprnVgtMGvEFh4/oYBVycp/0y+SST3M=;
	b=JMr6YD5TpWr4qk9bO9LSYEnO7F5UdiruSsGzYmnNMyT3W3kpMbCtK/6+Zs0FMCWC5z5FaL
	S+Kj8LfvxSzm6B0ZToLbjvQcv64MDZMP62LN+LQsQgitqkygue+YMVimDNJteT6uvYAm0A
	xtQ87QAchBmaZUM8cSwlTaSUhH9I/oM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-6TbUa-CtOM6qdHMllR0_ZA-1; Mon, 16 Aug 2021 14:30:26 -0400
X-MC-Unique: 6TbUa-CtOM6qdHMllR0_ZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 572398042EF
	for <nbd@other.debian.org>; Mon, 16 Aug 2021 18:30:25 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-125.phx2.redhat.com [10.3.113.125])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E071692BA;
	Mon, 16 Aug 2021 18:30:21 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: libguestfs@redhat.com
Subject: [PATCH] spec: Clarify STARTTLS vs. STRUCTURED_REPLY
Date: Mon, 16 Aug 2021 13:30:20 -0500
Message-Id: <20210816183020.34614-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oKefCV-PWNG.A.mGD.U7qGhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1295
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210816183020.34614-1-eblake@redhat.com
Resent-Date: Mon, 16 Aug 2021 18:30:44 +0000 (UTC)

Consider a SELECTIVETLS server and a MitM attacker, under the
following NBD_OPT_ handshake scenario:

 client:                  mitm:                    server:
 > _STARTTLS
                          > _STRUCTURED_REPLY
                                                   < _REP_ACK
                          > _STARTTLS
                                                   < _REP_ACK
                          < _REP_ACK
 > _GO
                          > _GO
                                                   < _REP_ACK
                          < _REP_ACK
 > NBD_CMD_READ

In this scenario, the client is NOT expecting structured replies from
the server, but if the server feels obligated to send them based on
the plaintext negotiation, it may confuse the client.  The MitM
attacker was thus able to corrupt the connection, even without having
any encryption keys.  The only sane approach is to forbid ALL stateful
negotiations from having any effect post-encryption (the MitM's
injected packet is effectively ignored, and the client proceeds
without structured replies).

Unfortunately, nbdkit 1.26.0 is buggy in this regards - a CVE will be
opened against that product.  nbd-server does not yet understand
NBD_OPT_STRUCTURED_REPLY, and qemu as server does not use SELECTIVETLS
mode, so they are immune.
---
 doc/proto.md | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index de4a7d7..9dd59da 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -1166,12 +1166,11 @@ of the newstyle negotiation.
     the client included data).

     When this command succeeds, the server MUST NOT preserve any
-    per-export state (such as metadata contexts from
-    `NBD_OPT_SET_META_CONTEXT`) issued before this command.  The
-    server MAY preserve global state such as a client request for
-    `NBD_OPT_STRUCTURED_REPLY`; however, a client SHOULD defer
-    stateful option requests until after it determines whether
-    encryption is available.
+    negotiation state (such as a request for
+    `NBD_OPT_STRUCTURED_REPLY`, or metadata contexts from
+    `NBD_OPT_SET_META_CONTEXT`) issued before this command.  A client
+    SHOULD defer all stateful option requests until after it
+    determines whether encryption is available.

     See the section on TLS above for further details.

@@ -1317,6 +1316,10 @@ of the newstyle negotiation.
     client MUST NOT make use of those extensions without first
     enabling the `NBD_OPT_STRUCTURED_REPLY` extension.

+    If the client requests `NBD_OPT_STARTTLS` after this option, it
+    MUST renegotiate structured replies and any other dependent
+    extensions that it desires to use.
+
 * `NBD_OPT_LIST_META_CONTEXT` (9)

     Return a list of `NBD_REP_META_CONTEXT` replies, one per context,
-- 
2.31.1

