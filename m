Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 994F81535E9
	for <lists+nbd@lfdr.de>; Wed,  5 Feb 2020 18:06:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8174021144; Wed,  5 Feb 2020 17:06:36 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb  5 17:06:36 2020
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E9A0A2092D
	for <lists-other-nbd@bendel.debian.org>; Wed,  5 Feb 2020 16:50:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id RtL0J6nm9tlZ for <lists-other-nbd@bendel.debian.org>;
	Wed,  5 Feb 2020 16:50:40 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -3.5
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8483A20C5D
	for <nbd@other.debian.org>; Wed,  5 Feb 2020 16:44:12 +0000 (UTC)
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1izNmR-0000ZH-LB; Wed, 05 Feb 2020 19:43:59 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: nbd@other.debian.org
Cc: qemu-block@nongnu.org,
	eblake@redhat.com,
	w@uter.be,
	nsoffer@redhat.com,
	den@openvz.org,
	vsementsov@virtuozzo.com
Subject: [PATCH 1/2] nbd/proto: introduce structured request
Date: Wed,  5 Feb 2020 19:43:51 +0300
Message-Id: <20200205164352.16673-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200205164352.16673-1-vsementsov@virtuozzo.com>
References: <20200205164352.16673-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <RGPg1-dSPNM.A.zeD.cYvOeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/795
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200205164352.16673-2-vsementsov@virtuozzo.com
Resent-Date: Wed,  5 Feb 2020 17:06:36 +0000 (UTC)

Idea: reuse structured replies as requests too. For this:

Rename structured reply "structure" to structured message. And,
correspondingly structured reply chunk to structured message chunk.

Keep name "structured reply" for structured messages sent by server,
and name "structured request" a structured message sent by client.

Share almost all semantics around structured messages for client and
server except for chunk type (as reply types and request types are
orthogonal things). Still, share none-type chunk for both server and
client.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 doc/proto.md | 104 +++++++++++++++++++++++++++++++++++----------------
 1 file changed, 72 insertions(+), 32 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 4b067f5..cb0ac56 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -279,12 +279,13 @@ a soft disconnect.
 
 ### Transmission
 
-There are three message types in the transmission phase: the request,
-the simple reply, and the structured reply chunk.  The
+There are three message types in the transmission phase: the simple request,
+the simple reply, and the structured message chunk.  The
 transmission phase consists of a series of transactions, where the
-client submits requests and the server sends corresponding replies
-with either a single simple reply or a series of one or more
-structured reply chunks per request.  The phase continues until
+client submits simple requests or structured requests, and the server sends corresponding replies
+with either a single simple reply or a structured reply.  Both structured
+request and structured reply are represented by structured message,
+which in turn is a series of one or more structured message chunks.  The phase continues until
 either side terminates transmission; this can be performed cleanly
 only by the client.
 
@@ -295,6 +296,9 @@ reply is also problematic for error handling of the `NBD_CMD_READ`
 request.  Therefore, structured replies can be used to create a
 a context-free server stream; see below.
 
+Similarly, without server negotiation, the client MUST use only simple
+requests.
+
 Replies need not be sent in the same order as requests (i.e., requests
 may be handled by the server asynchronously), and structured reply
 chunks from one request may be interleaved with reply messages from
@@ -369,7 +373,7 @@ S: 64 bits, handle
 S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
     *error* is zero)  
 
-#### Structured reply chunk message
+#### Structured message chunk
 
 Some of the major downsides of the default simple reply to
 `NBD_CMD_READ` are as follows.  First, it is not possible to support
@@ -382,9 +386,11 @@ possible to reliably decode the server traffic without also having
 context of what pending read requests were sent by the client.
 Therefore structured replies are also permitted if negotiated.
 
-A structured reply in the transmission phase consists of one or
-more structured reply chunk messages.  The server MUST NOT send
-this reply type unless the client has successfully negotiated
+A structured message in the transmission phase consists of one or
+more structured message chunks.
+
+The server MUST NOT send structured reply
+type unless the client has successfully negotiated
 structured replies via `NBD_OPT_STRUCTURED_REPLY`.  Conversely, if
 structured replies are negotiated, the server MUST use a
 structured reply for any response with a payload, and MUST NOT use
@@ -394,12 +400,15 @@ structured reply to all other requests.  The server SHOULD prefer
 sending errors via a structured reply, as the error can then be
 accompanied by a string payload to present to a human user.
 
-A structured reply MAY occupy multiple structured chunk messages
+The client MUST NOT sent structured messages, unless
+NBD_FLAG_STRUCTURED_REQUEST is negotiated by the server.
+
+A structured message MAY occupy multiple structured message chunks
 (all with the same value for "handle"), and the
-`NBD_REPLY_FLAG_DONE` reply flag is used to identify the final
+`NBD_STRUCTURED_FLAG_DONE` reply flag is used to identify the final
 chunk.  Unless further documented by individual requests below,
 the chunks MAY be sent in any order, except that the chunk with
-the flag `NBD_REPLY_FLAG_DONE` MUST be sent last.  Even when a
+the flag `NBD_STRUCTURED_FLAG_DONE` MUST be sent last.  Even when a
 command documents further constraints between chunks of one reply,
 it is always safe to interleave chunks of that reply with messages
 related to other requests.  A server SHOULD try to minimize the
@@ -412,7 +421,7 @@ on the chunks received.
 
 A structured reply chunk message looks as follows:
 
-S: 32 bits, 0x668e33ef, magic (`NBD_STRUCTURED_REPLY_MAGIC`)  
+S: 32 bits, 0x668e33ef, magic (`NBD_STRUCTURED_MESSAGE_MAGIC`)
 S: 16 bits, flags  
 S: 16 bits, type  
 S: 64 bits, handle  
@@ -1085,6 +1094,8 @@ The field has the following format:
   will be faster than a regular write). Clients MUST NOT set the
   `NBD_CMD_FLAG_FAST_ZERO` request flag unless this transmission flag
   is set.
+- bit 12, `NBD_FLAG_STRUCTURED_REQUEST`; allow clients to use
+  structured requests.
 
 Clients SHOULD ignore unknown flags.
 
@@ -1669,37 +1680,38 @@ valid may depend on negotiation during the handshake phase.
   `NBD_ENOTSUP`. The client MUST NOT set this unless the server advertised
   `NBD_FLAG_SEND_FAST_ZERO`.
 
-##### Structured reply flags
+##### Structured message flags
 
-This field of 16 bits is sent by the server as part of every
-structured reply.
+This field of 16 bits is sent as part of every structured message chunk.
 
-- bit 0, `NBD_REPLY_FLAG_DONE`; the server MUST clear this bit if
-  more structured reply chunks will be sent for the same client
-  request, and MUST set this bit if this is the final reply.  This
-  bit MUST always be set for the `NBD_REPLY_TYPE_NONE` chunk,
+- bit 0, `NBD_STRUCTURED_FLAG_DONE`; message sender MUST clear this bit if
+  more structured message chunks will be sent for the same structured message,
+  and MUST set this bit if this is the final chunk.  This
+  bit MUST always be set for the `NBD_NONE_CHUNK` chunk,
   although any other chunk type can also be used as the final
   chunk.
 
-The server MUST NOT set any other flags without first negotiating
-the extension with the client, unless the client can usefully
+The structured message sender MUST NOT set any other flags without first negotiating
+the extension with the other side, unless the other side can usefully
 react to the response without interpreting the flag (for instance
-if the flag is some form of hint).  Clients MUST ignore
-unrecognized flags.
+if the flag is some form of hint).
+Unrecognized flags must be ignored.
 
 #### Structured reply types
 
-These values are used in the "type" field of a structured reply.
+These values are used in the "type" field of a structured reply
+(structured message sent by the server).
 Some chunk types can additionally be categorized by role, such as
 *error chunks* or *content chunks*.  Each type determines how to
 interpret the "length" bytes of payload.  If the client receives
 an unknown or unexpected type, other than an *error chunk*, it
 MUST initiate a hard disconnect.
 
-* `NBD_REPLY_TYPE_NONE` (0)
+* `NBD_NONE_CHUNK` (0)
 
+  Shared with structured requests.
   *length* MUST be 0 (and the payload field omitted).  This chunk
-  type MUST always be used with the `NBD_REPLY_FLAG_DONE` bit set
+  type MUST always be used with the `NBD_STRUCTURED_FLAG_DONE` bit set
   (that is, it may appear at most once in a structured reply, and
   is only useful as the final reply chunk).  If no earlier error
   chunks were sent, then this type implies that the overall client
@@ -1826,6 +1838,34 @@ too large to fit within the *length* specified by the header.  For
 all other messages with unknown or unexpected type or inconsistent
 contents, the client MUST initiate a hard disconnect.
 
+#### Structured request types
+
+These values are used in the "type" field of a structured request
+(structured message sent by the client).
+The server SHOULD return `NBD_EINVAL` if it receives an unknown or unexpected
+chunk type.
+The server MAY reply (or start to reply by sending server chunks of structured
+reply) prior to receiving last chunk of structured request.
+If the server replied with simple reply, or finished structured reply by
+sending chunk with NBD_STRUCTURED_FLAG_DONE prior to receiving last chunk of
+structured request, it still MUST receive and ignore all other chunks of this
+request.
+If the client received server reply before sending last chunk of structured
+request, it still MUST finish structured reply by shunk with
+NBD_STRUCTURED_FLAG_DONE (NBD_NONE_CHUNK may be used for this).
+
+* `NBD_NONE_CHUNK` (0)
+
+  Shared with structured replies.
+  *length* MUST be 0 (and the payload field omitted).  This chunk
+  type MUST always be used with the `NBD_STRUCTURED_FLAG_DONE` bit set
+  (that is, it may appear at most once in a structured reply, and
+  is only useful as the final chunk).
+
+  If send in separate (as the only chunk of the sturctured reply) it
+  represents a no-op command, which SHOULD be replied with no errors and
+  may be used like ping, to check server availability.
+
 #### Request types
 
 The following request types exist:
@@ -1859,8 +1899,8 @@ The following request types exist:
 
     If structured replies are negotiated, then a read request MUST
     result in a structured reply with one or more chunks (each using
-    magic 0x668e33ef `NBD_STRUCTURED_REPLY_MAGIC`), where the final
-    chunk has the flag `NBD_REPLY_FLAG_DONE`, and with the following
+    magic 0x668e33ef `NBD_STRUCTURED_MESSAGE_MAGIC`), where the final
+    chunk has the flag `NBD_STRUCTURED_FLAG_DONE`, and with the following
     additional constraints.
 
     The server MAY split the reply into any number of content chunks;
@@ -1882,10 +1922,10 @@ The following request types exist:
     length of the client's request.
 
     To minimize traffic, the server MAY use a content or error chunk
-    as the final chunk by setting the `NBD_REPLY_FLAG_DONE` flag, but
+    as the final chunk by setting the `NBD_STRUCTURED_FLAG_DONE` flag, but
     MUST NOT do so for a content chunk if it would still be possible
     to detect an error while transmitting the chunk.  The
-    `NBD_REPLY_TYPE_NONE` chunk is always acceptable as the final
+    `NBD_NONE_CHUNK` chunk is always acceptable as the final
     chunk.
 
     If an error is detected, the server MUST still complete the
@@ -1921,7 +1961,7 @@ The following request types exist:
     `NBD_CMD_FLAG_DF` flag ("don't fragment").  If this flag is set,
     the server MUST send at most one content chunk, although it MAY
     still send multiple chunks (the remaining chunks would be error
-    chunks or a final type of `NBD_REPLY_TYPE_NONE`).  If the area
+    chunks or a final type of `NBD_NONE_CHUNK`).  If the area
     being read contains both data and a hole, the server MUST use
     `NBD_REPLY_TYPE_OFFSET_DATA` with the zeroes explicitly present.
     A server MAY reject a client's request with the error `NBD_EOVERFLOW`
-- 
2.21.0

