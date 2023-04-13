Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF6D6E171D
	for <lists+nbd@lfdr.de>; Fri, 14 Apr 2023 00:03:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0016D2056D; Thu, 13 Apr 2023 22:03:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr 13 22:03:32 2023
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
	by bendel.debian.org (Postfix) with ESMTP id CCB2E20569
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Apr 2023 22:03:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.082 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id t8kfDZj7lOcW for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Apr 2023 22:02:53 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 7EA602056A
	for <nbd@other.debian.org>; Thu, 13 Apr 2023 22:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681423368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zypMYYVStpIE9s2s/wJFrlHA36AXbFaBluH4kj7A5UM=;
	b=GMWbeRrj3RgBx43abKJlUlmMU1htdHJc326+sjCCt27hYa9vRfWw8NgeBGZarlYdE9xRxw
	FcEkYqLQTjRCjKnzqToVquYNMQszwojDid6oyn0pOLUXQUDOxCNn1K7v4YbRtEGuTob4+9
	YKxn1D2hTAGYfrxRY10u2RkW9s1DHvA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-NYfXm8HXMpG-OQvjX-OftQ-1; Thu, 13 Apr 2023 18:02:47 -0400
X-MC-Unique: NYfXm8HXMpG-OQvjX-OftQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 160513C0C8B9;
	Thu, 13 Apr 2023 22:02:47 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B194A2027043;
	Thu, 13 Apr 2023 22:02:46 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH v3 5/6] spec: Introduce NBD_FLAG_BLOCK_STATUS_PAYLOAD
Date: Thu, 13 Apr 2023 17:02:40 -0500
Message-Id: <20230413220241.1396012-6-eblake@redhat.com>
In-Reply-To: <20230413220241.1396012-1-eblake@redhat.com>
References: <20230413220241.1396012-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <O9nKDc5eiJH.A.0AG.0wHOkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2425
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230413220241.1396012-6-eblake@redhat.com
Resent-Date: Thu, 13 Apr 2023 22:03:32 +0000 (UTC)

NBD_CMD_BLOCK_STATUS currently forces the server to reply to all
metacontext ids that the client negotiated via
NBD_OPT_SET_META_CONTEXT.  But since extended headers make it easy for
the client to pass command payloads, we can allow for a client to
negotiate multiple metacontexts up front but express dynamic interest
in varying subsets of those contexts over the life of the connection,
for less wasted effort in responding to NBD_CMD_BLOCK_STATUS.  This
works by having the command payload supply an effect length and a list
of ids the client is currently interested in.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 doc/proto.md | 62 +++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 49 insertions(+), 13 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index ab1b066..ddf0a89 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -399,17 +399,20 @@ additional bytes of payload are present), or if the flag is absent
 (there is no payload, and *length* instead is an effect length
 describing how much of the export the request operates on).  The
 command `NBD_CMD_WRITE` MUST use the flag `NBD_CMD_FLAG_PAYLOAD_LEN`
-in this mode; while other commands SHOULD avoid the flag if the
-server has not indicated extension suppport for payloads on that
-command.  A server SHOULD initiate hard disconnect if a client sets
-the `NBD_CMD_FLAG_PAYLOAD_LEN` flag and uses a *length* larger than
-a server's advertised or default maximum payload length (capped at
-32 bits by the constraints of `NBD_INFO_BLOCK_SIZE`); in all other
-cases, a server SHOULD gracefully consume *length* bytes of payload
-(even if it then replies with an `NBD_EINVAL` failure because the
-particular command was not expecting a payload), and proceed with
-the next client command.  Thus, only when *length* is used as an
-effective length will it utilize a full 64-bit value.
+in this mode; most other commands omit it, although some like
+`NBD_CMD_BLOCK_STATUS` optionally support the flag in order to allow
+the client to pass additional information in the payload (where the
+command documents what the payload will contain, including the
+possibility of a separate effect length).  A server SHOULD initiate
+hard disconnect if a client sets the `NBD_CMD_FLAG_PAYLOAD_LEN` flag
+and uses a *length* larger than a server's advertised or default
+maximum payload length (capped at 32 bits by the constraints of
+`NBD_INFO_BLOCK_SIZE`); in all other cases, a server SHOULD gracefully
+consume *length* bytes of payload (even if it then replies with an
+`NBD_EINVAL` failure because the particular command was not expecting
+a payload), and proceed with the next client command.  Thus, only when
+*length* is used as an effective length will it utilize a full 64-bit
+value.

 #### Simple reply message

@@ -1240,6 +1243,19 @@ The field has the following format:
   will be faster than a regular write). Clients MUST NOT set the
   `NBD_CMD_FLAG_FAST_ZERO` request flag unless this transmission flag
   is set.
+- bit 12, `NBD_FLAG_BLOCK_STATUS_PAYLOAD`: Indicates that the server
+  understands the use of the `NBD_CMD_FLAG_PAYLOAD_LEN` flag to
+  `NBD_CMD_BLOCK_STATUS` to allow the client to request that the
+  server filters its response to a specific subset of negotiated
+  metacontext ids passed in via a client payload, rather than the
+  default of replying to all metacontext ids. Servers MUST NOT
+  advertise this bit unless the client successfully negotiates
+  extended headers via `NBD_OPT_EXTENDED_HEADERS`, and SHOULD NOT
+  advertise this bit in response to `NBD_OPT_EXPORT_NAME` or
+  `NBD_OPT_GO` if the client does not negotiate metacontexts with
+  `NBD_OPT_SET_META_CONTEXT`; clients SHOULD NOT set the
+  `NBD_CMD_FLAG_PAYLOAD_LEN` flag for `NBD_CMD_BLOCK_STATUS` unless
+  this transmission flag is set.

 Clients SHOULD ignore unknown flags.

@@ -1930,8 +1946,11 @@ valid may depend on negotiation during the handshake phase.
   header.  With extended headers, the flag MUST be set for
   `NBD_CMD_WRITE` (as the write command always sends a payload of the
   bytes to be written); for other commands, the flag will trigger an
-  `NBD_EINVAL` error unless the server has advertised support for an
-  extension payload form for the command.
+  `NBD_EINVAL` error unless the command documents an optional payload
+  form for the command and the server has implemented that form (an
+  example being `NBD_CMD_BLOCK_STATUS` providing a payload form for
+  restricting the response to a particular metacontext id, when the
+  server advertises `NBD_FLAG_BLOCK_STATUS_PAYLOAD`).

 ##### Structured and extended header reply flags

@@ -2478,6 +2497,23 @@ The following request types exist:
     The server MAY send chunks in a different order than the context
     ids were assigned in reply to `NBD_OPT_SET_META_CONTEXT`.

+    If extended headers were negotiated, a server MAY optionally
+    advertise, via the transmission flag
+    `NBD_FLAG_BLOCK_STATUS_PAYLOAD`, that it supports an alternative
+    request form where the client sets `NBD_CMD_FLAG_PAYLOAD_LEN` in
+    order to pass a payload that informs the server to limit its
+    replies to the metacontext id(s) in the client's request payload,
+    rather than giving an answer on all possible metacontext ids.  If
+    the server does not support the payload form, or detects duplicate
+    or unknown metacontext ids in the client's payload, the server
+    MUST gracefully consume the client's payload before failing with
+    `NBD_EINVAL`.  The payload form MUST occupy 8 + n*4 bytes, where n
+    is the number of metacontext ids the client is interested in (as
+    implied by the payload length), laid out as:
+
+    64 bits, effect length  
+    n * 32 bits, list of metacontext ids to use  
+
     The list of block status descriptors within a given status chunk
     represent consecutive portions of the export starting from
     specified *offset*.  If the client used the `NBD_CMD_FLAG_REQ_ONE`
-- 
2.39.2

