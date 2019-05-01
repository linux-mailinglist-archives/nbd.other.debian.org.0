Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DA310B69
	for <lists+nbd@lfdr.de>; Wed,  1 May 2019 18:35:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 188622034A; Wed,  1 May 2019 16:35:07 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May  1 16:35:07 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MDO_CABLE_TV3,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 707822034B
	for <lists-other-nbd@bendel.debian.org>; Wed,  1 May 2019 16:34:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.38 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MDO_CABLE_TV3=0.5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9BZlDDlRrSB8 for <lists-other-nbd@bendel.debian.org>;
	Wed,  1 May 2019 16:34:56 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id F1C072034A
	for <nbd@other.debian.org>; Wed,  1 May 2019 16:34:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C81F181127
	for <nbd@other.debian.org>; Wed,  1 May 2019 16:34:52 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-15.phx2.redhat.com [10.3.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 748246295A
	for <nbd@other.debian.org>; Wed,  1 May 2019 16:34:52 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Subject: [PATCH 2/2] doc: Tweak naming of NBD errors
Date: Wed,  1 May 2019 11:34:51 -0500
Message-Id: <20190501163451.15506-3-eblake@redhat.com>
In-Reply-To: <20190501163451.15506-1-eblake@redhat.com>
References: <20190501163451.15506-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 01 May 2019 16:34:52 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <TPPtnZrvT5H.A.v1.7qcycB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/487
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190501163451.15506-3-eblake@redhat.com
Resent-Date: Wed,  1 May 2019 16:35:07 +0000 (UTC)

It is intentional that we send NBD-specific error values over the
wire, which (due to history) happen to match particular Linux errno
values, but which may not match on other systems.  To make it more
obvious that a mapping is involved (both for the server converting
local errno values into wire values, and in clients converting wire
values back into any human messages via strerror() or similar), update
the protocol specification to refer to NBD errors with an NBD_E
prefix.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 doc/proto.md | 64 ++++++++++++++++++++++++++--------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index e446f75..48e4373 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -364,7 +364,7 @@ Some of the major downsides of the default simple reply to
 `NBD_CMD_READ` are as follows.  First, it is not possible to support
 partial reads or early errors (the command must succeed or fail as a
 whole, and either *length* bytes of data must be sent or a hard disconnect
-must be initiated, even if the failure is `EINVAL` due to bad flags).
+must be initiated, even if the failure is `NBD_EINVAL` due to bad flags).
 Second, there is no way to efficiently skip over portions of a sparse
 file that are known to contain all zeroes.  Finally, it is not
 possible to reliably decode the server traffic without also having
@@ -378,7 +378,7 @@ structured replies via `NBD_OPT_STRUCTURED_REPLY`.  Conversely, if
 structured replies are negotiated, the server MUST use a
 structured reply for any response with a payload, and MUST NOT use
 a simple reply for `NBD_CMD_READ` (even for the case of an early
-`EINVAL` due to bad flags), but MAY use either a simple reply or a
+`NBD_EINVAL` due to bad flags), but MAY use either a simple reply or a
 structured reply to all other requests.  The server SHOULD prefer
 sending errors via a structured reply, as the error can then be
 accompanied by a string payload to present to a human user.
@@ -436,9 +436,9 @@ On a server shutdown, the server SHOULD wait for inflight
 requests to be serviced prior to initiating a hard disconnect.
 A server MAY speed this process up by issuing error replies.
 The error value issued in respect of these requests and
-any subsequently received requests SHOULD be `ESHUTDOWN`.
+any subsequently received requests SHOULD be `NBD_ESHUTDOWN`.

-If the client receives an `ESHUTDOWN` error it MUST initiate
+If the client receives an `NBD_ESHUTDOWN` error it MUST initiate
 a soft disconnect.

 The client MAY issue a soft disconnect at any time, but
@@ -806,7 +806,7 @@ multiples of any advertised minimum block size, and SHOULD use integer
 multiples of any advertised preferred block size where possible.  For
 those requests, the client MUST NOT use a *length* larger than any
 advertised maximum block size or which, when added to *offset*, would
-exceed the export size.  The server SHOULD report an `EINVAL` error if
+exceed the export size.  The server SHOULD report an `NBD_EINVAL` error if
 the client's request is not aligned to advertised minimum block size
 boundaries, or is larger than the advertised maximum block size.
 Notwithstanding any maximum block size advertised, either the server
@@ -818,7 +818,7 @@ be considered a denial of service attack (even if the advertised
 maximum block size is smaller).  For all other commands, where the
 *length* is not reflected in the payload (such as `NBD_CMD_TRIM` or
 `NBD_CMD_WRITE_ZEROES`), a server SHOULD merely fail the command with
-an `EINVAL` error for a client that exceeds the maximum block size,
+an `NBD_EINVAL` error for a client that exceeds the maximum block size,
 rather than initiating a hard disconnect.

 ## Metadata querying
@@ -864,7 +864,7 @@ The procedure works as follows:
 A client MUST NOT use `NBD_CMD_BLOCK_STATUS` unless it selected a
 nonzero number of metadata contexts during negotiation, and used the
 same export name for the subsequent `NBD_OPT_GO` (or
-`NBD_OPT_EXPORT_NAME`). Servers SHOULD reply with `EINVAL` to clients
+`NBD_OPT_EXPORT_NAME`). Servers SHOULD reply with `NBD_EINVAL` to clients
 sending `NBD_CMD_BLOCK_STATUS` without selecting at least one metadata
 context.

@@ -933,17 +933,17 @@ The `base:allocation` metadata context is the basic "allocated at all"
 metadata context. If an extent is marked with `NBD_STATE_HOLE` at that
 context, this means that the given extent is not allocated in the
 backend storage, and that writing to the extent MAY result in the
-`ENOSPC` error. This supports sparse file semantics on the server
+`NBD_ENOSPC` error. This supports sparse file semantics on the server
 side.  If a server supports the `base:allocation` metadata context,
 then writing to an extent which has `NBD_STATE_HOLE` clear MUST NOT
-fail with `ENOSPC` unless for reasons specified in the definition of
+fail with `NBD_ENOSPC` unless for reasons specified in the definition of
 another context.

 It defines the following flags for the flags field:

 - `NBD_STATE_HOLE` (bit 0): if set, the block represents a hole (and
   future writes to that area may cause fragmentation or encounter an
-  `ENOSPC` error); if clear, the block is allocated or the server
+  `NBD_ENOSPC` error); if clear, the block is allocated or the server
   could not otherwise determine its status. Note that the use of
   `NBD_CMD_TRIM` is related to this status, but that the server MAY
   report a hole even where `NBD_CMD_TRIM` has not been requested, and
@@ -1628,7 +1628,7 @@ valid may depend on negotiation during the handshake phase.
   `NBD_CMD_READ`.  SHOULD be set to 1 if the client requires the
   server to send at most one content chunk in reply.  MUST NOT be set
   unless the transmission flags include `NBD_FLAG_SEND_DF`.  Use of
-  this flag MAY trigger an `EOVERFLOW` error chunk, if the request
+  this flag MAY trigger an `NBD_EOVERFLOW` error chunk, if the request
   length is too large.
 - bit 3, `NBD_CMD_FLAG_REQ_ONE`; valid during
   `NBD_CMD_BLOCK_STATUS`. If set, the client is interested in only one
@@ -1892,7 +1892,7 @@ The following request types exist:
     chunks or a final type of `NBD_REPLY_TYPE_NONE`).  If the area
     being read contains both data and a hole, the server MUST use
     `NBD_REPLY_TYPE_OFFSET_DATA` with the zeroes explicitly present.
-    A server MAY reject a client's request with the error `EOVERFLOW`
+    A server MAY reject a client's request with the error `NBD_EOVERFLOW`
     if the length is too large to send without fragmentation, in which
     case it MUST NOT send a content chunk; however, the server MUST
     support unfragmented reads in which the client's request length
@@ -1989,7 +1989,7 @@ The following request types exist:
     transmission flags field, however, these implementations do not
     use any command flags.  A server MAY advertise
     `NBD_FLAG_SEND_CACHE` even if the command has no effect or always
-    fails with `EINVAL`; however, if it advertised the command, the
+    fails with `NBD_EINVAL`; however, if it advertised the command, the
     server MUST reject any command flags it does not recognize.

 * `NBD_CMD_WRITE_ZEROES` (6)
@@ -2017,9 +2017,9 @@ The following request types exist:
     If an error occurs, the server MUST set the appropriate error code
     in the error field.

-    The server SHOULD return `ENOSPC` if it receives a write zeroes request
+    The server SHOULD return `NBD_ENOSPC` if it receives a write zeroes request
     including one or more sectors beyond the size of the device. It SHOULD
-    return `EPERM` if it receives a write zeroes request on a read-only export.
+    return `NBD_EPERM` if it receives a write zeroes request on a read-only export.

 * `NBD_CMD_BLOCK_STATUS` (7)

@@ -2077,7 +2077,7 @@ The following request types exist:

     A client MAY initiate a hard disconnect if it detects that the
     server has sent an invalid chunk. The server SHOULD return
-    `EINVAL` if it receives a `NBD_CMD_BLOCK_STATUS` request including
+    `NBD_EINVAL` if it receives a `NBD_CMD_BLOCK_STATUS` request including
     one or more sectors beyond the size of the device.

 * `NBD_CMD_RESIZE` (8)
@@ -2108,36 +2108,36 @@ as the value for an error.

 The following error values are defined:

-* `EPERM` (1), Operation not permitted.
-* `EIO` (5), Input/output error.
-* `ENOMEM` (12), Cannot allocate memory.
-* `EINVAL` (22), Invalid argument.
-* `ENOSPC` (28), No space left on device.
-* `EOVERFLOW` (75), Value too large.
-* `ESHUTDOWN` (108), Server is in the process of being shut down.
+* `NBD_EPERM` (1), Operation not permitted.
+* `NBD_EIO` (5), Input/output error.
+* `NBD_ENOMEM` (12), Cannot allocate memory.
+* `NBD_EINVAL` (22), Invalid argument.
+* `NBD_ENOSPC` (28), No space left on device.
+* `NBD_EOVERFLOW` (75), Value too large.
+* `NBD_ESHUTDOWN` (108), Server is in the process of being shut down.

-The server SHOULD return `ENOSPC` if it receives a write request
+The server SHOULD return `NBD_ENOSPC` if it receives a write request
 including one or more sectors beyond the size of the device.  It also
-SHOULD map the `EDQUOT` and `EFBIG` errors to `ENOSPC`.  It SHOULD
-return `EINVAL` if it receives a read or trim request including one or
+SHOULD map the `EDQUOT` and `EFBIG` errors to `NBD_ENOSPC`.  It SHOULD
+return `NBD_EINVAL` if it receives a read or trim request including one or
 more sectors beyond the size of the device, or if a read or write
 request is not aligned to advertised minimum block sizes. Finally, it
-SHOULD return `EPERM` if it receives a write or trim request on a
+SHOULD return `NBD_EPERM` if it receives a write or trim request on a
 read-only export.

-The server SHOULD NOT return `EOVERFLOW` except as documented in
+The server SHOULD NOT return `NBD_EOVERFLOW` except as documented in
 response to `NBD_CMD_READ` when `NBD_CMD_FLAG_DF` is supported.

-The server SHOULD return `EINVAL` if it receives an unknown command.
+The server SHOULD return `NBD_EINVAL` if it receives an unknown command.

-The server SHOULD return `EINVAL` if it receives an unknown command flag. It
-also SHOULD return `EINVAL` if it receives a request with a flag not explicitly
+The server SHOULD return `NBD_EINVAL` if it receives an unknown command flag. It
+also SHOULD return `NBD_EINVAL` if it receives a request with a flag not explicitly
 documented as applicable to the given request.

 Which error to return in any other case is not specified by the NBD
 protocol.

-The server SHOULD NOT return `ENOMEM` if at all possible.
+The server SHOULD NOT return `NBD_ENOMEM` if at all possible.

 ## Experimental extensions

-- 
2.20.1

