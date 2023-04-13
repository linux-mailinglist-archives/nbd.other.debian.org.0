Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC216E1720
	for <lists+nbd@lfdr.de>; Fri, 14 Apr 2023 00:03:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 307A32056D; Thu, 13 Apr 2023 22:03:52 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr 13 22:03:52 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,PHONENUMBER,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 26E0720529
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Apr 2023 22:03:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.582 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, PHONENUMBER=1.5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vwMlmAib5NFu for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Apr 2023 22:02:55 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id AA92F2056D
	for <nbd@other.debian.org>; Thu, 13 Apr 2023 22:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681423369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+P9zn4MK4X1uavk59jePjIfK9F+/nXgM0wMNNncVf1g=;
	b=Hl0FwR12Dg00bwgH1ck74ROsmnyxzaE3PxvAuT7ydZ14jybo+ssAkMd9pQC9+ZZ6+uHFkx
	CVUNNJWrCR1JhE2aNx7rDA/rB+qBLjWTAEhbBceVtaAzGdGg0me6y5ycxrmVZvZuKVgAp4
	Qtami5bXahkpcs85v9AuWBj+axHv124=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-Vwtd48dSOyiCgFUwo9-OAQ-1; Thu, 13 Apr 2023 18:02:46 -0400
X-MC-Unique: Vwtd48dSOyiCgFUwo9-OAQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EEE085C1AB;
	Thu, 13 Apr 2023 22:02:46 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9C7F2027046;
	Thu, 13 Apr 2023 22:02:45 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH v3 3/6] spec: Add NBD_OPT_EXTENDED_HEADERS
Date: Thu, 13 Apr 2023 17:02:38 -0500
Message-Id: <20230413220241.1396012-4-eblake@redhat.com>
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
Resent-Message-ID: <U9Vpj6LF3QH.A.4LG.IxHOkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2428
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230413220241.1396012-4-eblake@redhat.com
Resent-Date: Thu, 13 Apr 2023 22:03:52 +0000 (UTC)

Add a new negotiation feature where the client and server agree to use
larger packet headers on every packet sent during transmission phase.
This has two purposes: first, it makes it possible to perform
operations like trim, write zeroes, and block status on more than 2^32
bytes in a single command.  While at it, this is a great opportunity
to declare that any client opting in to extended headers will use
NBD_OPT_GO instead of the weaker NBD_OPT_EXPORT_NAME.

Second, when structured replies are active, clients have to deal with
the difference between 16- and 20-byte headers of simple
vs. structured replies, which impacts performance if the client must
perform multiple syscalls to first read the magic before knowing if
there are even additional bytes to read to learn a payload length.  In
extended header mode, all headers are the same width and there are no
simple replies permitted.  The layout of the reply header is more like
the request header; and including the client's offset in the reply
makes it easier to convert between absolute and relative offsets for
replies to NBD_CMD_READ.  Similarly, by having extended mode use a
power-of-2 sizing, it becomes easier to manipulate arrays of headers
without worrying about an individual header crossing a cache line.
However, note that this change only affects the headers; data payloads
can still be unaligned (for example, a client performing 1-byte reads
or writes).  We would need to negotiate yet another extension if we
wanted to ensure that all NBD transmission packets started on an
8-byte boundary after option haggling has completed.

Note that NBD_INFO_BLOCK_SIZE still advertises only a 32-bit value for
maximum payload size.  As of this patch, it is assumed that most
clients will still be limiting NBD_CMD_READ requests to a much smaller
cap of 32M (the portable payload limit if nothing was advertised) or
64M (nbdkit chose this limit, and a client may know it is talking to
an nbdkit server even without explicit advertisement); so keeping a
32-bit payload size is still fine even while benefittng from a 64-bit
effect size.  At any rate, this patch intentionally does not worry
about a client and server that can mutually agree to a maximum payload
larger than 4G by some means other than NBD_INFO_BLOCK_SIZE (we can
standardize it as a future extension if someone demonstrates a use
case for it); meanwhile, NBD_REPLY_TYPE_OFFSET_DATA will work as-is
with larger payload (since its length is part of the extended header),
but for holes, a server would have to either add a 64-bit counterpart
to NBD_REPLY_TYPE_OFFSET_HOLE or split its hole responses over
multiple reply chunks.

But for NBD_CMD_BLOCK_STATUS, it is very useful to be able to report a
status extent with a size larger than 32-bits, in some cases even if
the client's request was for an effect length smaller than 32-bits
(such as when it is known that the entire image is not sparse).
Consideration was given on whether to require that once extended
headers are negotiated, only a new 64-bit block status reply type can
be used; but in proof-of-concept implementations, I found it easy
enough to have both clients and servers to support both size block
status replies at all times, rather than being picky about the reply
type corresponding to whether extended headers were negotiated.

This spec addition was done in parallel with proof of concept
implementations in qemu (server and client), libnbd (client), and
nbdkit (server).

Signed-off-by: Eric Blake <eblake@redhat.com>

---

v3: prohibit NBD_OPT_EXPORT_NAME, clarify more regarding
NBD_REP_ERR_EXT_HEADER_REQD, wording tweaks
---
 doc/proto.md | 502 +++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 371 insertions(+), 131 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 2651f13..9098c42 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -280,36 +280,55 @@ a soft disconnect.

 ### Transmission

-There are three message types in the transmission phase: the request,
-the simple reply, and the structured reply chunk.  The
+There are two general message types in the transmission phase: the
+request (simple or extended), and the reply (simple, structured, or
+extended).  The determination of which message headers to use is
+determined during handshaking phase, based on whether
+`NBD_OPT_STRUCTURED_REPLY` or `NBD_OPT_EXTENDED_HEADERS` was requested
+by the client and given a successful response by the server.  The
 transmission phase consists of a series of transactions, where the
 client submits requests and the server sends corresponding replies
 with either a single simple reply or a series of one or more
-structured reply chunks per request.  The phase continues until
-either side terminates transmission; this can be performed cleanly
-only by the client.
+structured or extended reply chunks per request.  The phase continues
+until either side terminates transmission; this can be performed
+cleanly only by the client.

 Note that without client negotiation, the server MUST use only simple
 replies, and that it is impossible to tell by reading the server
 traffic in isolation whether a data field will be present; the simple
 reply is also problematic for error handling of the `NBD_CMD_READ`
-request.  Therefore, structured replies can be used to create a
-context-free server stream; see below.
+request.  Therefore, structured or extended replies can be used to
+create a context-free server stream; see below.
+
+The results of client negotiation also determine whether the client
+and server will utilize only compact requests and replies, or whether
+both sides will use only extended packets.  Compact messages are the
+default, but inherently limit single transactions to a 32-bit window
+starting at a 64-bit offset.  Extended messages make it possible to
+perform 64-bit transactions (although typically only for commands that
+do not include a data payload).  Furthermore, when only structured
+replies have been negotiated, compact messages require the client to
+perform partial reads to determine which reply packet style (16-byte
+simple or 20-byte structured) is on the wire before knowing the length
+of the rest of the reply, which can reduce client performance.  With
+extended messages, all packet headers have a fixed length of 32 bytes,
+and although this results in more traffic over the network, the
+resulting layout is friendlier for performance.

 Replies need not be sent in the same order as requests (i.e., requests
-may be handled by the server asynchronously), and structured reply
-chunks from one request may be interleaved with reply messages from
-other requests; however, there may be constraints that prevent
-arbitrary reordering of structured reply chunks within a given reply.
+may be handled by the server asynchronously), and structured or
+extended reply chunks from one request may be interleaved with reply
+messages from other requests; however, there may be constraints that
+prevent arbitrary reordering of reply chunks within a given reply.
 Clients SHOULD use a cookie that is distinct from all other currently
 pending transactions, but MAY reuse cookies that are no longer in
 flight; cookies need not be consecutive.  In each reply message
-(whether simple or structured), the server MUST use the same value for
-cookie as was sent by the client in the corresponding request,
-treating the cookie as an opaque field.  In this way, the client can
-correlate which request is receiving a response.  Note that earlier
-versions of this specification referred to a client's cookie as a
-handle.
+(whether simple, structured, or extended), the server MUST use the
+same value for cookie as was sent by the client in the corresponding
+request, treating the cookie as an opaque field.  In this way, the
+client can correlate which request is receiving a response.  Note that
+earlier versions of this specification referred to a client's cookie
+as a handle.

 #### Ordering of messages and writes

@@ -346,7 +365,10 @@ may be useful.

 #### Request message

-The request message, sent by the client, looks as follows:
+The compact request message is sent by the client when extended
+transactions are not in use (either the client did not request
+extended headers during negotiation, or the server responded that
+`NBD_OPT_EXTENDED_HEADERS` is unsupported), and looks as follows:

 C: 32 bits, 0x25609513, magic (`NBD_REQUEST_MAGIC`)  
 C: 16 bits, command flags  
@@ -356,19 +378,54 @@ C: 64 bits, offset (unsigned)
 C: 32 bits, length (unsigned)  
 C: (*length* bytes of data if the request is of type `NBD_CMD_WRITE`)  

+In the compact style, the client MUST NOT use the
+`NBD_CMD_FLAG_PAYLOAD_LEN` flag; and the only command where *length*
+represents payload length instead of effect length is `NBD_CMD_WRITE`.
+
+If negotiation agreed on extended transactions with
+`NBD_OPT_EXTENDED_HEADERS`, the client instead uses extended requests:
+
+C: 32 bits, 0x21e41c71, magic (`NBD_EXTENDED_REQUEST_MAGIC`)  
+C: 16 bits, command flags  
+C: 16 bits, type  
+C: 64 bits, cookie  
+C: 64 bits, offset (unsigned)  
+C: 64 bits, payload/effect length (unsigned)  
+C: (*length* bytes of data if *flags* includes `NBD_CMD_FLAG_PAYLOAD_LEN`)  
+
+With extended headers, the meaning of the *length* field depends on
+whether *flags* contains `NBD_CMD_FLAG_PAYLOAD_LEN` (that many
+additional bytes of payload are present), or if the flag is absent
+(there is no payload, and *length* instead is an effect length
+describing how much of the export the request operates on).  The
+command `NBD_CMD_WRITE` MUST use the flag `NBD_CMD_FLAG_PAYLOAD_LEN`
+in this mode; while other commands SHOULD avoid the flag if the
+server has not indicated extension suppport for payloads on that
+command.  A server SHOULD initiate hard disconnect if a client sets
+the `NBD_CMD_FLAG_PAYLOAD_LEN` flag and uses a *length* larger than
+a server's advertised or default maximum payload length (capped at
+32 bits by the constraints of `NBD_INFO_BLOCK_SIZE`); in all other
+cases, a server SHOULD gracefully consume *length* bytes of payload
+(even if it then replies with an `NBD_EINVAL` failure because the
+particular command was not expecting a payload), and proceed with
+the next client command.  Thus, only when *length* is used as an
+effective length will it utilize a full 64-bit value.
+
 #### Simple reply message

 The simple reply message MUST be sent by the server in response to all
-requests if structured replies have not been negotiated using
-`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been negotiated, a simple
+requests if neither structured replies (`NBD_OPT_STRUCTURED_REPLY`)
+nor extended headers (`NBD_OPT_EXTENDED_HEADERS`) have been
+negotiated.  If structured replies have been negotiated, a simple
 reply MAY be used as a reply to any request other than `NBD_CMD_READ`,
-but only if the reply has no data payload.  The message looks as
-follows:
+but only if the reply has no data payload.  If extended headers have
+been negotiated, a simple reply MUST NOT be used.  The message looks
+as follows:

 S: 32 bits, 0x67446698, magic (`NBD_SIMPLE_REPLY_MAGIC`; used to be
    `NBD_REPLY_MAGIC`)  
 S: 32 bits, error (MAY be zero)  
-S: 64 bits, cookie  
+S: 64 bits, cookie (MUST match the request)  
 S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
     *error* is zero)  

@@ -418,9 +475,9 @@ on the chunks received.
 A structured reply chunk message looks as follows:

 S: 32 bits, 0x668e33ef, magic (`NBD_STRUCTURED_REPLY_MAGIC`)  
-S: 16 bits, flags  
+S: 16 bits, reply flags  
 S: 16 bits, type  
-S: 64 bits, cookie  
+S: 64 bits, cookie (MUST match the request)  
 S: 32 bits, length of payload (unsigned)  
 S: *length* bytes of payload data (if *length* is nonzero)  

@@ -428,6 +485,47 @@ The use of *length* in the reply allows context-free division of
 the overall server traffic into individual reply messages; the
 *type* field describes how to further interpret the payload.

+#### Extended reply chunk message
+
+One implementation drawback of the original structured replies via
+`NBD_OPT_STRUCTURED_REPLY` is that a client must read the magic number
+to know whether it will then be reading a 16-byte simple or 20-byte
+structured header from the server.  Another is that an array of
+20-byte structures is not always cache-line friendly, compared to
+power-of-2 sizing.  Therefore, a client may instead attempt to
+negotiate extended headers via `NBD_OPT_EXTENDED_HEADERS` in place of
+structured replies.
+
+If extended headers are negotiated, all server replies MUST use an
+extended reply; the server MUST NOT use simple replies even when there
+is no payload.  Most fields in the extended reply have the same
+semantics as their counterparts in structured replies (including the
+use of `NBD_REPLY_FLAG_DONE` to end a sequence of one or more chunks
+comprising the overall reply).  The extended reply has an additional
+field *offset* which MUST match the *offset* of the client's request
+(even in reply types such as `NBD_REPLY_TYPE_OFFSET_DATA` where the
+payload itself contains a different offset representing the middle of
+the buffer).
+
+The other difference between extended replies and structured replies
+is that the *length* field is 64 bits to match the layout of the
+extended request header.  However, note that while the request flags
+determine whether a request uses a 32-bit payload length or a 64-bit
+effect length, at this time the reply length is used solely for
+payload lengths and so in practice will never exceed a 32-bit value
+(see `NBD_INFO_BLOCK_SIZE`); a client MAY initiate hard disconnect if
+a server's reply length is unexpectedly large.
+
+An extended reply chunk message looks as follows:
+
+S: 32 bits, 0x6e8a278c, magic (`NBD_EXTENDED_REPLY_MAGIC`)  
+S: 16 bits, reply flags  
+S: 16 bits, type  
+S: 64 bits, cookie (MUST match the request)  
+S: 64 bits, offset (MUST match the request)  
+S: 64 bits, length of payload (unsigned)  
+S: *length* bytes of payload data (if *length* is nonzero)  
+
 #### Terminating the transmission phase

 There are two methods of terminating the transmission phase:
@@ -843,22 +941,22 @@ client controls the payload length (`NBD_CMD_WRITE`, or `NBD_CMD_READ`
 with simple replies), the client MUST NOT request a length larger than
 the maximum payload size. For replies where the payload length is
 controlled by the server (`NBD_CMD_BLOCK_STATUS` without the flag
-`NBD_CMD_FLAG_REQ_ONE`, or `NBD_CMD_READ` when structured replies are
-negotiated), the server MAY exceed the maximum payload by the fixed
-amount of overhead required in the structured reply (for example, a
-server that advertises a maximum payload of 2^25 bytes may return
-2^25+8 payload bytes in a single `NBD_REPLY_TYPE_OFFSET_DATA` chunk,
-rather than splitting the reply across two chunks), although it MUST
-honor any additional payload constraints documented for a particular
-command.  For commands that do not require a payload in either
-direction (such as `NBD_CMD_TRIM` or `NBD_CMD_WRITE_ZEROES`), the
-client MAY request an effect length larger than the maximum payload
-size; the server SHOULD NOT disconnect, but MAY reply with an
-`NBD_EOVERFLOW` or `NBD_EINVAL` error if the oversize request would
-require too many server resources when compared to the same command
-with an effect length limited to the maximum payload size (such as an
-implementation of `NBD_CMD_WRITE_ZEROES` that utilizes a scratch
-buffer).
+`NBD_CMD_FLAG_REQ_ONE`, or `NBD_CMD_READ` when structured replies or
+extended headers are negotiated), the server MAY exceed the maximum
+payload by the fixed amount of overhead required in the structured
+reply (for example, a server that advertises a maximum payload of 2^25
+bytes may return 2^25+8 payload bytes in a single
+`NBD_REPLY_TYPE_OFFSET_DATA` chunk, rather than splitting the reply
+across two chunks), although it MUST honor any additional payload
+constraints documented for a particular command.  For commands that do
+not require a payload in either direction (such as `NBD_CMD_TRIM` or
+`NBD_CMD_WRITE_ZEROES`), the client MAY request an effect length
+larger than the maximum payload size; the server SHOULD NOT
+disconnect, but MAY reply with an `NBD_EOVERFLOW` or `NBD_EINVAL`
+error if the oversize request would require too many server resources
+when compared to the same command with an effect length limited to the
+maximum payload size (such as an implementation of
+`NBD_CMD_WRITE_ZEROES` that utilizes a scratch buffer).

 Where a transmission request can have a nonzero *offset* and/or
 *length* (such as `NBD_CMD_READ`, `NBD_CMD_WRITE`, or `NBD_CMD_TRIM`),
@@ -901,12 +999,11 @@ The procedure works as follows:
 - During transmission, a client can then indicate interest in metadata
   for a given region by way of the `NBD_CMD_BLOCK_STATUS` command,
   where *offset* and *length* indicate the area of interest. On
-  success, the server MUST respond with one structured reply chunk of
-  type `NBD_REPLY_TYPE_BLOCK_STATUS` per metadata context selected
-  during negotiation, where each reply chunk is a list of one or more
-  consecutive extents for that context.  Each extent comes with a
-  *flags* field, the semantics of which are defined by the metadata
-  context.
+  success, the server MUST respond with one status type reply chunk
+  per metadata context selected during negotiation, where each reply
+  chunk is a list of one or more consecutive extents for that context.
+  Each extent comes with a *flags* field, the semantics of which are
+  defined by the metadata context.

 The client's requested *length* is only a hint to the server, so the
 cumulative extent length contained in a chunk of the server's reply
@@ -927,9 +1024,10 @@ same export name for the subsequent `NBD_OPT_GO` (or
 sending `NBD_CMD_BLOCK_STATUS` without selecting at least one metadata
 context.

-The reply to the `NBD_CMD_BLOCK_STATUS` request MUST be sent as a
-structured reply; this implies that in order to use metadata querying,
-structured replies MUST be negotiated first.
+The reply to a successful `NBD_CMD_BLOCK_STATUS` request MUST be sent
+via reply chunks; this implies that in order to use metadata querying,
+either structured replies or extended headers MUST be negotiated
+first.

 Metadata contexts are identified by their names. The name MUST consist
 of a namespace, followed by a colon, followed by a leaf-name.  The
@@ -1104,12 +1202,12 @@ The field has the following format:
 - bit 5, `NBD_FLAG_SEND_TRIM`: exposes support for `NBD_CMD_TRIM`.
 - bit 6, `NBD_FLAG_SEND_WRITE_ZEROES`: exposes support for
   `NBD_CMD_WRITE_ZEROES` and `NBD_CMD_FLAG_NO_HOLE`.
-- bit 7, `NBD_FLAG_SEND_DF`: do not fragment a structured reply. The
-  server MUST set this transmission flag to 1 if the
-  `NBD_CMD_READ` request supports the `NBD_CMD_FLAG_DF` flag, and
-  MUST leave this flag clear if structured replies have not been
-  negotiated. Clients MUST NOT set the `NBD_CMD_FLAG_DF` request
-  flag unless this transmission flag is set.
+- bit 7, `NBD_FLAG_SEND_DF`: do not fragment a structured or extended
+  reply. The server MUST set this transmission flag to 1 if the
+  `NBD_CMD_READ` request supports the `NBD_CMD_FLAG_DF` flag, and MUST
+  leave this flag clear if neither structured replies nor extended
+  headers have been negotiated. Clients MUST NOT set the
+  `NBD_CMD_FLAG_DF` request flag unless this transmission flag is set.
 - bit 8, `NBD_FLAG_CAN_MULTI_CONN`: Indicates that the server operates
   entirely without cache, or that the cache it uses is shared among all
   connections to the given device. In particular, if this flag is
@@ -1167,11 +1265,13 @@ of the newstyle negotiation.

     A major problem of this option is that it does not support the
     return of error messages to the client in case of problems. To
-    remedy this, `NBD_OPT_GO` has been introduced (see below).
-    A client thus SHOULD use `NBD_OPT_GO` in preference to
-    `NBD_OPT_EXPORT_NAME` but SHOULD fall back to `NBD_OPT_EXPORT_NAME`
-    if `NBD_OPT_GO` is not supported (not falling back will prevent
-    it from connecting to old servers).
+    remedy this, `NBD_OPT_GO` has been introduced (see below).  A
+    client thus SHOULD use `NBD_OPT_GO` in preference to
+    `NBD_OPT_EXPORT_NAME` but SHOULD fall back to
+    `NBD_OPT_EXPORT_NAME` if `NBD_OPT_GO` is not supported (not
+    falling back will prevent it from connecting to old servers).
+    Additionally, a client that has used `NBD_OPT_EXTENDED_HEADERS` to
+    negotiate extended headers MUST NOT use this option.

 * `NBD_OPT_ABORT` (2)

@@ -1219,10 +1319,10 @@ of the newstyle negotiation.

     When this command succeeds, the server MUST NOT preserve any
     negotiation state (such as a request for
-    `NBD_OPT_STRUCTURED_REPLY`, or metadata contexts from
-    `NBD_OPT_SET_META_CONTEXT`) issued before this command.  A client
-    SHOULD defer all stateful option requests until after it
-    determines whether encryption is available.
+    `NBD_OPT_STRUCTURED_REPLY` or `NBD_OPT_EXTENDED_HEADERS`, or
+    metadata contexts from `NBD_OPT_SET_META_CONTEXT`) issued before
+    this command.  A client SHOULD defer all stateful option requests
+    until after it determines whether encryption is available.

     See the section on TLS above for further details.

@@ -1303,6 +1403,10 @@ of the newstyle negotiation.
       `NBD_REP_ERR_BLOCK_SIZE_REQD` error SHOULD ensure it first
       sends an `NBD_INFO_BLOCK_SIZE` information reply in order
       to help avoid a potentially unnecessary round trip.
+    - `NBD_REP_ERR_EXT_HEADER_REQD`: The server requires the client to
+      utilize extended headers.  While this may make it easier to
+      implement a server with fewer considerations for backwards
+      compatibility, it limits connections to only recent clients.

     Additionally, if TLS has not been initiated, the server MAY reply
     with `NBD_REP_ERR_TLS_REQD` (instead of `NBD_REP_ERR_UNKNOWN`) to
@@ -1313,7 +1417,10 @@ of the newstyle negotiation.
     export.

     For backwards compatibility, clients SHOULD be prepared to also
-    handle `NBD_REP_ERR_UNSUP` by falling back to using `NBD_OPT_EXPORT_NAME`.
+    handle `NBD_REP_ERR_UNSUP` by falling back to using
+    `NBD_OPT_EXPORT_NAME`; however, if the server has acknowledged a
+    client's request for `NBD_OPT_EXTENDED_HEADERS`, the server MUST
+    NOT fail `NBD_OPT_GO` with `NBD_REP_ERR_UNSUP`.

     Other errors (such as `NBD_REP_ERR_SHUTDOWN`) are also possible,
     as permitted elsewhere in this document, with no constraints on
@@ -1357,6 +1464,9 @@ of the newstyle negotiation.
       server MUST use structured replies to the `NBD_CMD_READ`
       transmission request.  Other extensions that require structured
       replies may now be negotiated.
+    - `NBD_REP_ERR_EXT_HEADER_REQD`: The client has already
+      successfully negotiated extended headers, which takes precedence
+      over this option.
     - For backwards compatibility, clients SHOULD be prepared to also
       handle `NBD_REP_ERR_UNSUP`; in this case, no structured replies
       will be sent.
@@ -1364,9 +1474,10 @@ of the newstyle negotiation.
     It is envisioned that future extensions will add other new
     requests that may require a data payload in the reply.  A server
     that supports such extensions SHOULD NOT advertise those
-    extensions until the client negotiates structured replies; and a
-    client MUST NOT make use of those extensions without first
-    enabling the `NBD_OPT_STRUCTURED_REPLY` extension.
+    extensions until the client has negotiated either structured
+    replies or extended headers; and a client MUST NOT make use of
+    those extensions without first enabling support for reply
+    payloads.

     If the client requests `NBD_OPT_STARTTLS` after this option, it
     MUST renegotiate structured replies and any other dependent
@@ -1377,9 +1488,10 @@ of the newstyle negotiation.
     Return a list of `NBD_REP_META_CONTEXT` replies, one per context,
     followed by an `NBD_REP_ACK` or an error.

-    This option SHOULD NOT be requested unless structured replies have
-    been negotiated first. If a client attempts to do so, a server
-    MAY send `NBD_REP_ERR_INVALID`.
+    This option SHOULD NOT be requested unless structured replies or
+    extended headers have been negotiated first. If a client attempts
+    to do so, a server MAY send `NBD_REP_ERR_INVALID` or
+    `NBD_REP_ERR_EXT_HEADER_REQD`.

     Data:
     - 32 bits, length of export name.  
@@ -1461,9 +1573,10 @@ of the newstyle negotiation.
     they are interested in are selected with the final query that they
     sent.

-    This option MUST NOT be requested unless structured replies have
-    been negotiated first. If a client attempts to do so, a server
-    SHOULD send `NBD_REP_ERR_INVALID`.
+    This option MUST NOT be requested unless structured replies or
+    extended headers have been negotiated first. If a client attempts
+    to do so, a server SHOULD send `NBD_REP_ERR_INVALID` or
+    `NBD_REP_ERR_EXT_HEADER_REQD`.

     A client MUST NOT send `NBD_CMD_BLOCK_STATUS` unless within the
     negotiation phase it sent `NBD_OPT_SET_META_CONTEXT` at least
@@ -1500,6 +1613,48 @@ of the newstyle negotiation.
     option does not select any metadata context, provided the client
     then does not attempt to issue `NBD_CMD_BLOCK_STATUS` commands.

+* `NBD_OPT_EXTENDED_HEADERS` (11)
+
+    The client wishes to use extended headers during the transmission
+    phase.  The client MUST NOT send any additional data with the
+    option, and the server SHOULD reject a request that includes data
+    with `NBD_REP_ERR_INVALID`.
+
+    When successful, this option takes precedence over structured
+    replies, and the server MUST also support `NBD_OPT_GO`.  A client
+    MAY request structured replies first, although a server SHOULD
+    support this option even if structured replies are not negotiated.
+    Once extended headers are successfully requested, a client MUST
+    NOT use `NBD_OPT_EXPORT_NAME`.
+
+    It is envisioned that future extensions will add other new
+    requests that support a data payload in the request or reply.  A
+    server that supports such extensions SHOULD NOT advertise those
+    extensions until the client has negotiated extended headers; and a
+    client MUST NOT make use of those extensions without first
+    enabling support for reply payloads.
+
+    The server replies with the following, or with an error permitted
+    elsewhere in this document:
+
+    - `NBD_REP_ACK`: Extended headers have been negotiated; the client
+      MUST use the 32-byte extended request header, with proper use of
+      `NBD_CMD_FLAG_PAYLOAD_LEN` for all commands sending a payload;
+      and the server MUST use the 32-byte extended reply header.
+    - For backwards compatibility, clients SHOULD be prepared to also
+      handle `NBD_REP_ERR_UNSUP`; in this case, only the compact
+      transmission headers will be used.
+
+    Note that a response of `NBD_REP_ERR_BLOCK_SIZE_REQD` does not
+    make sense in response to this command, but a server MAY fail with
+    that error for a later `NBD_OPT_GO` without a client request for
+    `NBD_INFO_BLOCK_SIZE`, since the use of extended headers provides
+    more incentive for a client to promise to obey block size
+    constraints.
+
+    If the client requests `NBD_OPT_STARTTLS` after this option, it
+    MUST renegotiate extended headers.
+
 #### Option reply types

 These values are used in the "reply type" field, sent by the server
@@ -1679,6 +1834,16 @@ case that data is an error message string suitable for display to the user.

     The request or the reply is too large to process.

+* `NBD_REP_ERR_EXT_HEADER_REQD` (2^31 + 10)
+
+    The server is unwilling to proceed with the given request (such as
+    `NBD_OPT_GO` or `NBD_OPT_SET_META_CONTEXT`) for a client that has
+    not yet requested extended headers (via
+    `NBD_OPT_EXTENDED_HEADERS`).  This error is also used to indicate
+    that the server is unable to downgrade to structured replies (via
+    `NBD_OPT_STRUCTURED_REPLY`) if extended headers have already been
+    enabled.
+
 ### Transmission phase

 #### Flag fields
@@ -1732,11 +1897,22 @@ valid may depend on negotiation during the handshake phase.
   `NBD_CMD_WRITE`, then the server MUST fail quickly with an error of
   `NBD_ENOTSUP`. The client MUST NOT set this unless the server advertised
   `NBD_FLAG_SEND_FAST_ZERO`.
+- bit 5, `NBD_CMD_FLAG_PAYLOAD_LEN`; only valid if extended headers
+  were negotiated via `NBD_OPT_EXTENDED_HEADERS`.  If set, the
+  *length* field of the header describes a (nonzero) payload length of
+  data to be sent alongside the header; if the flag is clear, the
+  header *length* is instead an effect length for the command's
+  interaction with the export, and there is no payload after the
+  header.  With extended headers, the flag MUST be set for
+  `NBD_CMD_WRITE` (as the write command always sends a payload of the
+  bytes to be written); for other commands, the flag will trigger an
+  `NBD_EINVAL` error unless the server has advertised support for an
+  extension payload form for the command.

-##### Structured reply flags
+##### Structured and extended header reply flags

 This field of 16 bits is sent by the server as part of every
-structured reply.
+structured or extended header reply.

 - bit 0, `NBD_REPLY_FLAG_DONE`; the server MUST clear this bit if
   more structured reply chunks will be sent for the same client
@@ -1753,9 +1929,10 @@ unrecognized flags.

 #### Structured reply types

-These values are used in the "type" field of a structured reply.  Some
-chunk types can additionally be categorized by role, such as *error
-chunks* or *content chunks*.  Each type determines how to interpret
+These values are used in the "type" field of a structured reply, and
+when extended headers are negotiated.  Some chunk types can
+additionally be categorized by role, such as *error chunks*, *content
+chunks*, or *status chunks*.  Each type determines how to interpret
 the "length" bytes of payload.  If the client receives an unknown or
 unexpected type, other than an *error chunk*, it MUST initiate a hard
 disconnect.  A server MUST NOT send a chunk where any variable-length
@@ -1804,13 +1981,27 @@ small amount of fixed-length overhead inherent in the chunk type).
   64 bits: offset (unsigned)  
   32 bits: hole size (unsigned, MUST be nonzero)  

+  At this time, although servers that support extended headers are
+  permitted to accept client requests for `NBD_CMD_READ` with an
+  effect length larger than any advertised maximum payload size by
+  splitting the reply into multiple chunks, portable clients SHOULD
+  NOT request a read *length* larger than 32 bits (corresponding to
+  the maximum payload constraint implied by `NBD_INFO_BLOCK_SIZE`),
+  and therefore a 32-bit constraint on the *hole size* does not
+  represent an arbitrary limitation.  Should a future scenario arise
+  where it can be demonstrated that a client and server would benefit
+  from an extension allowing a maximum payload size to be larger than
+  32 bits, that extension would also introduce a counterpart reply
+  type that can express a 64-bit *hole size*.
+
 * `NBD_REPLY_TYPE_BLOCK_STATUS` (5)

-  *length* MUST be 4 + (a positive integer multiple of 8).  This reply
-  represents a series of consecutive block descriptors where the sum
-  of the length fields within the descriptors is subject to further
-  constraints documented below.  A successful block status request MUST
-  have exactly one status chunk per negotiated metadata context ID.
+  This chunk type is in the status chunk category.  *length* MUST be
+  4 + (a positive integer multiple of 8).  This reply represents a
+  series of consecutive block descriptors where the sum of the length
+  fields within the descriptors is subject to further constraints
+  documented below.  A successful block status request MUST have
+  exactly one status chunk per negotiated metadata context ID.

   The payload starts with:

@@ -1852,6 +2043,43 @@ small amount of fixed-length overhead inherent in the chunk type).
   extent information at the first offset not covered by a
   reduced-length reply.

+* `NBD_REPLY_TYPE_BLOCK_STATUS_EXT` (6)
+
+  This chunk type is in the status chunk category.  *length* MUST be
+  8 + (a positive multiple of 16).  The semantics of this chunk mirror
+  those of `NBD_REPLY_TYPE_BLOCK_STATUS`, other than the use of a
+  larger *extent length* field, added padding in each descriptor to
+  ease alignment, and the addition of a *descriptor count* field that
+  can be used for easier client processing.  This chunk type MUST NOT
+  be used unless extended headers were negotiated with
+  `NBD_OPT_EXTENDED_HEADERS`.
+
+  If the *descriptor count* field contains 0, the number of subsequent
+  descriptors is determined solely by the *length* field of the reply
+  header.  However, the server MAY populate the *descriptor count*
+  field with the number of descriptors that follow; when doing this,
+  the server MUST ensure that the header *length* is equal to
+  *descriptor count* * 16 + 8.
+
+  The payload starts with:
+
+  32 bits, metadata context ID  
+  32 bits, descriptor count  
+
+  and is followed by a list of one or more descriptors, each with this
+  layout:
+
+  64 bits, length of the extent to which the status below
+     applies (unsigned, MUST be nonzero)  
+  32 bits, padding (MUST be zero)  
+  32 bits, status flags  
+
+  Note that when extended headers are in use, the client MUST be
+  prepared for the server to use either the compact or extended chunk
+  type, regardless of whether the client's hinted effect length was
+  more or less than 32 bits; but the server MUST use exactly one of
+  the two chunk types per negotiated metacontext ID.
+
 All error chunk types have bit 15 set, and begin with the same
 *error*, *message length*, and optional *message* fields as
 `NBD_REPLY_TYPE_ERROR`.  If nonzero, *message length* indicates
@@ -1866,8 +2094,9 @@ remaining structured fields at the end.
   and the client MAY NOT make any assumptions about partial
   success. This type SHOULD NOT be used more than once in a
   structured reply.  Valid as a reply to any request.  Note that
-  *message length* MUST NOT exceed the 4096 bytes string length
-  limit.
+  *message length* MUST NOT exceed the 4096 bytes string length limit,
+  and therefore there is no need for a counterpart extended-length
+  error chunk type.

   The payload is structured as:

@@ -1914,19 +2143,21 @@ The following request types exist:

     A read request. Length and offset define the data to be read. The
     server MUST reply with either a simple reply or a structured
-    reply, according to whether the structured replies have been
-    negotiated using `NBD_OPT_STRUCTURED_REPLY`. The client SHOULD NOT
-    request a read length of 0; the behavior of a server on such a
+    reply, according to whether structured replies
+    (`NBD_OPT_STRUCTURED_REPLY`) or extended headers
+    (`NBD_OPT_EXTENDED_HEADERS`) were negotiated.  The client SHOULD
+    NOT request a read length of 0; the behavior of a server on such a
     request is unspecified although the server SHOULD NOT disconnect.

     *Simple replies*

-    If structured replies were not negotiated, then a read request
-    MUST always be answered by a simple reply, as documented above
-    (using magic 0x67446698 `NBD_SIMPLE_REPLY_MAGIC`, and containing
-    length bytes of data according to the client's request), which in
-    turn means any client request with a length larger than the
-    maximum payload size will fail.
+    If neither structured replies nor extended headers were
+    negotiated, then a read request MUST always be answered by a
+    simple reply, as documented above (using magic 0x67446698
+    `NBD_SIMPLE_REPLY_MAGIC`, and containing length bytes of data
+    according to the client's request), which in turn means any client
+    request with a length larger than the maximum payload size will
+    fail.

     If an error occurs, the server SHOULD set the appropriate error code
     in the error field. The server MAY then initiate a hard disconnect.
@@ -1939,13 +2170,15 @@ The following request types exist:

     *Structured replies*

-    If structured replies are negotiated, then a read request MUST
-    result in a structured reply with one or more chunks (each using
-    magic 0x668e33ef `NBD_STRUCTURED_REPLY_MAGIC`), where the final
-    chunk has the flag `NBD_REPLY_FLAG_DONE`, and with the following
-    additional constraints.
+    If structured replies or extended headers are negotiated, then a
+    read request MUST result in a reply with one or more structured
+    chunks (each using `NBD_STRUCTURED_REPLY_MAGIC` or
+    `NBD_EXTENDED_REPLY_MAGIC` according to what was negotiated),
+    where the final chunk has the flag `NBD_REPLY_FLAG_DONE`, and with
+    the following additional constraints.

-    The server MAY split the reply into any number of content chunks;
+    The server MAY split the reply into any number of content chunks
+    (`NBD_REPLY_TYPE_OFFSET_DATA` and `NBD_REPLY_TYPE_OFFSET_HOLE`);
     each chunk MUST describe at least one byte, although to minimize
     overhead, the server SHOULD use chunks with lengths and offsets as
     an integer multiple of 512 bytes, where possible (the first and
@@ -1958,12 +2191,12 @@ The following request types exist:
     send additional content chunks even after reporting an error
     chunk.  A server MAY support read requests larger than the maximum
     payload size by splitting the response across multiple chunks (in
-    particular, a request for more than 2^32 - 8 bytes containing data
-    rather than holes MUST be split to avoid overflowing the 32-bit
-    `NBD_REPLY_TYPE_OFFSET_DATA` length field); however, the server is
-    also permitted to reject large read requests up front, so a client
-    should be prepared to retry with smaller requests if a large
-    request fails.
+    particular, if extended headers are not in use, a request for more
+    than 2^32 - 8 bytes containing data rather than holes MUST be
+    split to avoid overflowing the `NBD_REPLY_TYPE_OFFSET_DATA` length
+    field); however, the server is also permitted to reject large read
+    requests up front, so a client should be prepared to retry with
+    smaller requests if a large request fails.

     When no error is detected, the server MUST send enough data chunks
     to cover the entire region described by the offset and length of
@@ -2189,10 +2422,10 @@ The following request types exist:

 * `NBD_CMD_BLOCK_STATUS` (7)

-    A block status query request. Length and offset define the range
-    of interest.  The client SHOULD NOT request a status length of 0;
-    the behavior of a server on such a request is unspecified although
-    the server SHOULD NOT disconnect.
+    A block status query request. The effect length is a hint to the
+    server about the range of interest.  The client SHOULD NOT request
+    a status length of 0; the behavior of a server on such a request
+    is unspecified although the server SHOULD NOT disconnect.

     A client MUST NOT send `NBD_CMD_BLOCK_STATUS` unless within the
     negotiation phase it sent `NBD_OPT_SET_META_CONTEXT` at least
@@ -2200,26 +2433,27 @@ The following request types exist:
     same export name used to enter transmission phase, and where the
     server returned at least one metadata context without an error.
     This in turn requires the client to first negotiate structured
-    replies. For a successful return, the server MUST use a structured
-    reply, containing exactly one chunk of type
-    `NBD_REPLY_TYPE_BLOCK_STATUS` per selected context id, where the
-    status field of each descriptor is determined by the flags field
-    as defined by the metadata context.  The server MAY send chunks in
-    a different order than the context ids were assigned in reply to
-    `NBD_OPT_SET_META_CONTEXT`.
+    replies or extended headers. For a successful return, the server
+    MUST use one reply chunk per selected context id (only
+    `NBD_REPLY_TYPE_BLOCK_STATUS` for structured replies, and either
+    `NBD_REPLY_TYPE_BLOCK_STATUS` or `NBD_REPLY_TYPE_BLOCK_STATUS_EXT`
+    for extended headers).  The status field of each descriptor is
+    determined by the flags field as defined by the metadata context.
+    The server MAY send chunks in a different order than the context
+    ids were assigned in reply to `NBD_OPT_SET_META_CONTEXT`.

-    The list of block status descriptors within the
-    `NBD_REPLY_TYPE_BLOCK_STATUS` chunk represent consecutive portions
-    of the export starting from specified *offset*.  If the client used
-    the `NBD_CMD_FLAG_REQ_ONE` flag, each chunk contains exactly one
-    descriptor where the *length* of the descriptor MUST NOT be
-    greater than the *length* of the request; otherwise, a chunk MAY
-    contain multiple descriptors, and the final descriptor MAY extend
-    beyond the original requested size if the server can determine a
-    larger length without additional effort.  On the other hand, the
-    server MAY return less data than requested.  In particular, a
-    server SHOULD NOT send more than 2^20 status descriptors in a
-    single chunk.  However the server MUST return at least one status
+    The list of block status descriptors within a given status chunk
+    represent consecutive portions of the export starting from
+    specified *offset*.  If the client used the `NBD_CMD_FLAG_REQ_ONE`
+    flag, each chunk contains exactly one descriptor where the
+    *length* of the descriptor MUST NOT be greater than the *length*
+    of the request; otherwise, a chunk MAY contain multiple
+    descriptors, and the final descriptor MAY extend beyond the
+    original requested size if the server can determine a larger
+    length without additional effort.  On the other hand, the server
+    MAY return less data than requested.  In particular, a server
+    SHOULD NOT send more than 2^20 status descriptors in a single
+    chunk.  However the server MUST return at least one status
     descriptor, and since each status descriptor has a non-zero
     length, a client can always make progress on a successful return.

@@ -2421,6 +2655,10 @@ implement the following features:
   Clients that do not implement querying for block size constraints
   SHOULD abide by the rules laid out in the section "Block size
   constraints", above.
+- Servers that implement extended headers but desire interoperability
+  with older client implementations SHOULD NOT use the
+  `NBD_REP_ERR_EXT_HEADER_REQD` error response to `NBD_OPT_GO`, but
+  should gracefully support compact headers.

 ### Future considerations

@@ -2430,6 +2668,8 @@ implementations are not yet ready to support them:

 - Structured replies; the Linux kernel currently does not yet implement
   them.
+- Extended headers; these are similar to structured replies, but is
+  new enough that many clients and servers do not yet implement them.

 ## About this file

-- 
2.39.2


