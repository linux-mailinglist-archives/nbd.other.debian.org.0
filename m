Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 667A0628D02
	for <lists+nbd@lfdr.de>; Tue, 15 Nov 2022 00:03:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 48B9920668; Mon, 14 Nov 2022 23:03:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 23:03:22 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 00AAB20615
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 23:03:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.596 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.515, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id UAPMsjpJgdDo for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 23:03:06 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 26D2C20534
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 23:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668466981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ysXeA7NeWFPSynfblrqbUhWWKU0rHfVoDoo/BboJqno=;
	b=aM8cWHxxm4jZUBuTzttDgn+kcOgX9JeBMPseUaQNob+irMZhxN84O+IuWOdCtBtdEZgnrE
	m8lYGXoc9YpPPgAHuGDL09/5j20zaes2xiyci7xozFyVr3IWmdkEc1VvJJXJKT2jrq+zIe
	DFwhPPScaI/EkRfl5Ll6FIczesbbfeo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-9BpxKyTBOnShZIMt7IMY4A-1; Mon, 14 Nov 2022 17:47:02 -0500
X-MC-Unique: 9BpxKyTBOnShZIMt7IMY4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8FCB101A54E;
	Mon, 14 Nov 2022 22:47:01 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 422CE2028CE4;
	Mon, 14 Nov 2022 22:47:01 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH v2 5/6] spec: Introduce NBD_FLAG_BLOCK_STATUS_PAYLOAD
Date: Mon, 14 Nov 2022 16:46:54 -0600
Message-Id: <20221114224655.2186173-6-eblake@redhat.com>
In-Reply-To: <20221114224655.2186173-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Msyy-GBsO8J.A.mTD.6kscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2278
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114224655.2186173-6-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 23:03:22 +0000 (UTC)

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
index 14af48d..645a736 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -397,17 +397,20 @@ additional bytes of payload are present), or if the flag is absent
 (there is no payload, and *length* instead is an effect length
 describing how much of the image the request operates on).  The
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

@@ -1232,6 +1235,19 @@ The field has the following format:
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

@@ -1915,8 +1931,11 @@ valid may depend on negotiation during the handshake phase.
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

 ##### Structured reply flags

@@ -2464,6 +2483,23 @@ The following request types exist:
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
     represent consecutive portions of the file starting from specified
     *offset*.  If the client used the `NBD_CMD_FLAG_REQ_ONE` flag,
-- 
2.38.1

