Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD533EA76E
	for <lists+nbd@lfdr.de>; Thu, 12 Aug 2021 17:21:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 392212039D; Thu, 12 Aug 2021 15:21:01 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 12 15:21:01 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 2492C20390
	for <lists-other-nbd@bendel.debian.org>; Thu, 12 Aug 2021 15:20:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.255 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-1.474,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3JzGzN4mC-lm for <lists-other-nbd@bendel.debian.org>;
	Thu, 12 Aug 2021 15:20:50 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 21529202E2
	for <nbd@other.debian.org>; Thu, 12 Aug 2021 15:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628781645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JiEJDVkwtok/Rd/ETi0KeYqQrgfSaq09DuERkRJwdjk=;
	b=DPaYdL2VoAbP4CY451IKuQiYdSSEfbwAhSoJ2ZCYUtyDQudSsWeR6w5CBjC8XTSbHUyTCO
	hxq1z8aT8FfPHVd67G3CUCbIQKRmaHPe0uTpVtxL08oVBpMqxP5Dhd59TlrNZ38RgzYxQE
	fsyidO69IMTEXjiIPk6AdiiZNdmJf08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-JB2fFCvxO4G0bIEW9L-vGw-1; Thu, 12 Aug 2021 11:20:41 -0400
X-MC-Unique: JB2fFCvxO4G0bIEW9L-vGw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5D56801AC5;
	Thu, 12 Aug 2021 15:20:40 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D1CD5D6D5;
	Thu, 12 Aug 2021 15:20:40 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH] spec: Clarify STARTTLS vs. SET_META_CONTEXT interaction
Date: Thu, 12 Aug 2021 10:20:40 -0500
Message-Id: <20210812152040.2752184-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oaTyAp2wlBC.A.tUB.dxTFhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1277
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210812152040.2752184-1-eblake@redhat.com
Resent-Date: Thu, 12 Aug 2021 15:21:01 +0000 (UTC)

Consider a SELECTIVETLS server and a MitM attacker, under the
following NBD_OPT_ handshake scenario:

 client:                  mitm:                    server:
 > _STARTTLS
                          > _SET_META_CONTEXT("A")
                                                   < _REP_META_CONTEXT
                                                   < _REP_ACK
                          > _STARTTLS
                                                   < _REP_ACK
                          < _REP_ACK
 > _SET_META_CONTEXT("B")
                          < _REP_META_CONTEXT
                          < _REP_ACK
 > _GO
                          > _GO
                                                   < _REP_ACK
                          < _REP_ACK
 > NBD_CMD_BLOCK_STATUS

While this scenario requires the MitM to be able to use encryption to
speak to the client (and thus a less likely scenario than a true
protocol downgrade or plaintext buffering attack), it results in a
situation where the client is asking for information on context "B",
but where the server only saw a request for context "A", which may
result in the client interpreting the results of BLOCK_STATUS
incorrectly even though it is coming over an encrypted connection.

The safest fix to this is to require that a server cannot use any meta
context requests from prior to enabling encryption with any successful
NBD_OPT_GO after encryption.  At this point, the spec already states
that the server should then return an error (the client is asking for
block status without proper negotiation), which is better than letting
the client blindly misinterpret a response sent for a different meta
context.

To date, the only known server that has implemented TLS with
SELECTIVETLS mode as well as support for NBD_OPT_SET_META_CONTEXT is
nbdkit (qemu-nbd only has FORCEDTLS mode, and nbd-server lacks meta
context support); thankfully, that implementation is in already line
with this stricter requirement.
---
 doc/proto.md | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 61d57b5..7155b42 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -1165,6 +1165,14 @@ of the newstyle negotiation.
     permitted by this document (for example, `NBD_REP_ERR_INVALID` if
     the client included data).

+    When this command succeeds, the server MUST NOT preserve any
+    per-export state (such as metadata contexts from
+    `NBD_OPT_SET_META_CONTEXT`) issued before this command.  The
+    server MAY preserve global state such as a client request for
+    `NBD_OPT_STRUCTURED_REPLY`; however, a client SHOULD defer other
+    stateful option requests until after it determines whether
+    encryption is available.
+
     See the section on TLS above for further details.

 * `NBD_OPT_INFO` (6) and `NBD_OPT_GO` (7)
@@ -1406,8 +1414,8 @@ of the newstyle negotiation.
     negotiation phase it sent `NBD_OPT_SET_META_CONTEXT` at least
     once, and where the final time it was sent, it referred to the
     same export name that was ultimately selected for transmission
-    phase, and where the server responded by returning least one
-    metadata context without error.
+    phase with no intervening `NBD_OPT_STARTTLS`, and where the server
+    responded by returning least one metadata context without error.

     Data:
     - 32 bits, length of export name.  
-- 
2.31.1

