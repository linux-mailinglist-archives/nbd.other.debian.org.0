Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 63085154825
	for <lists+nbd@lfdr.de>; Thu,  6 Feb 2020 16:33:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2D8A02052A; Thu,  6 Feb 2020 15:33:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb  6 15:33:13 2020
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 53D7F207CC
	for <lists-other-nbd@bendel.debian.org>; Thu,  6 Feb 2020 15:17:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cEs7by7iPgAM for <lists-other-nbd@bendel.debian.org>;
	Thu,  6 Feb 2020 15:17:08 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5FFD2204A4
	for <nbd@other.debian.org>; Thu,  6 Feb 2020 15:16:00 +0000 (UTC)
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1izisf-0007vC-LA; Thu, 06 Feb 2020 18:15:49 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: nbd@other.debian.org
Cc: qemu-block@nongnu.org,
	eblake@redhat.com,
	w@uter.be,
	nsoffer@redhat.com,
	den@openvz.org,
	vsementsov@virtuozzo.com
Subject: [RFC v2] nbd/proto: introduce extended request and 64bit commands
Date: Thu,  6 Feb 2020 18:15:47 +0300
Message-Id: <20200206151547.5812-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <PIvuAoKKOKI.A.x5.5GDPeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/800
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200206151547.5812-1-vsementsov@virtuozzo.com
Resent-Date: Thu,  6 Feb 2020 15:33:13 +0000 (UTC)

Introduce a request type with payload. Use it to add 64bit support to
data-less commands.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

v1 was "[PATCH 0/2] Structured requests and 64bit commands"

v2: - don't touch structured replies. Still, no reason to not use the
same structure as in structured reply chunk
    - instead of documenting separate 64bit commands, just define
    support for extended request in original commands.

 doc/proto.md | 50 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index fc7baf6..58e932d 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -279,10 +279,10 @@ a soft disconnect.
 
 ### Transmission
 
-There are three message types in the transmission phase: the request,
-the simple reply, and the structured reply chunk.  The
+There are four message types in the transmission phase: the request,
+the extended request, the simple reply, and the structured reply chunk.  The
 transmission phase consists of a series of transactions, where the
-client submits requests and the server sends corresponding replies
+client submits (extended) requests and the server sends corresponding replies
 with either a single simple reply or a series of one or more
 structured reply chunks per request.  The phase continues until
 either side terminates transmission; this can be performed cleanly
@@ -353,6 +353,25 @@ C: 64 bits, offset (unsigned)
 C: 32 bits, length (unsigned)  
 C: (*length* bytes of data if the request is of type `NBD_CMD_WRITE`)  
 
+#### Extended request message
+
+The extended request message, sent by the client, looks as follows:
+
+C: 32 bits, 0x23876289, magic (`NBD_EXTENDED_REQUEST_MAGIC`)
+C: 16 bits, flags
+C: 16 bits, type
+C: 64 bits, handle
+C: 32 bits, length of payload (unsigned)
+C: *length* bytes of payload data (if *length* is nonzero)
+
+The client MUST NOT send extended requests, unless
+NBD_FLAG_EXTENDED_REQUEST is negotiated by the server. If
+NBD_OPT_STRUCTURED_REPLY is negotiated client MAY send extended
+requests of types `NBD_CMD_WRITE_ZEROES`, `NBD_CMD_TRIM`,
+`NBD_CMD_BLOCK_STATUS`.
+If the server (with negotiated NBD_FLAG_EXTENDED_REQUEST) receive
+extended request of unsupported type it MUST reply with `NBD_EINVAL`.
+
 #### Simple reply message
 
 The simple reply message MUST be sent by the server in response to all
@@ -1082,6 +1101,8 @@ The field has the following format:
   will be faster than a regular write). Clients MUST NOT set the
   `NBD_CMD_FLAG_FAST_ZERO` request flag unless this transmission flag
   is set.
+- bit 12, `NBD_FLAG_EXTENDED_REQUEST`; allow clients to use
+  extended requests.
 
 Clients SHOULD ignore unknown flags.
 
@@ -1825,6 +1846,11 @@ contents, the client MUST initiate a hard disconnect.
 
 #### Request types
 
+The following types are shared for request message and extended
+request message. Still, client MUST NOT send extended request of
+specific type unless support for extended request directly defined
+in type description below.
+
 The following request types exist:
 
 * `NBD_CMD_READ` (0)
@@ -1986,6 +2012,12 @@ The following request types exist:
     A client MUST NOT send a trim request unless `NBD_FLAG_SEND_TRIM`
     was set in the transmission flags field.
 
+    `NBD_CMD_TRIM` supports extended requests, with the following
+    16-bytes payload:
+
+    64 bits: offset
+    64 bits: length
+
 * `NBD_CMD_CACHE` (5)
 
     A cache request.  The client is informing the server that it plans
@@ -2095,6 +2127,12 @@ The following request types exist:
     including one or more sectors beyond the size of the device. It SHOULD
     return `NBD_EPERM` if it receives a write zeroes request on a read-only export.
 
+    `NBD_CMD_WRITE_ZEROES` supports extended requests, with the following
+    16-bytes payload:
+
+    64 bits: offset
+    64 bits: length
+
 * `NBD_CMD_BLOCK_STATUS` (7)
 
     A block status query request. Length and offset define the range
@@ -2154,6 +2192,12 @@ The following request types exist:
     `NBD_EINVAL` if it receives a `NBD_CMD_BLOCK_STATUS` request including
     one or more sectors beyond the size of the device.
 
+    `NBD_CMD_BLOCK_STATUS` supports extended requests, with the following
+    16-bytes payload:
+
+    64 bits: offset
+    64 bits: length
+
 * `NBD_CMD_RESIZE` (8)
 
     Defined by the experimental `RESIZE`
-- 
2.21.0

