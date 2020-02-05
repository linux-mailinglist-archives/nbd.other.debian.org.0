Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 411E31535E8
	for <lists+nbd@lfdr.de>; Wed,  5 Feb 2020 18:06:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2F21521135; Wed,  5 Feb 2020 17:06:25 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb  5 17:06:25 2020
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B832920926
	for <lists-other-nbd@bendel.debian.org>; Wed,  5 Feb 2020 16:50:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VWwS5_3lAjjM for <lists-other-nbd@bendel.debian.org>;
	Wed,  5 Feb 2020 16:50:39 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 92A6420C5F
	for <nbd@other.debian.org>; Wed,  5 Feb 2020 16:44:12 +0000 (UTC)
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1izNmR-0000ZH-TY; Wed, 05 Feb 2020 19:44:00 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: nbd@other.debian.org
Cc: qemu-block@nongnu.org,
	eblake@redhat.com,
	w@uter.be,
	nsoffer@redhat.com,
	den@openvz.org,
	vsementsov@virtuozzo.com
Subject: [PATCH 2/2] nbd/proto: add NBD_CMD_WRITE_ZEROES64
Date: Wed,  5 Feb 2020 19:43:52 +0300
Message-Id: <20200205164352.16673-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200205164352.16673-1-vsementsov@virtuozzo.com>
References: <20200205164352.16673-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <dsu-uEM6LVN.A.x4C.RYvOeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/794
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200205164352.16673-3-vsementsov@virtuozzo.com
Resent-Date: Wed,  5 Feb 2020 17:06:25 +0000 (UTC)

Add new structured request type to represent 64bit version of
NBD_CMD_WRITE_ZEROES.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 doc/proto.md | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/doc/proto.md b/doc/proto.md
index cb0ac56..378a800 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -1096,6 +1096,8 @@ The field has the following format:
   is set.
 - bit 12, `NBD_FLAG_STRUCTURED_REQUEST`; allow clients to use
   structured requests.
+- bit 13, `NBD_FLAG_SEND_WRITE_ZEROES64`: documents that the server
+  understands `NBD_CMD_WRITE_ZEROES64` structured request chunk type.
 
 Clients SHOULD ignore unknown flags.
 
@@ -1866,6 +1868,25 @@ NBD_STRUCTURED_FLAG_DONE (NBD_NONE_CHUNK may be used for this).
   represents a no-op command, which SHOULD be replied with no errors and
   may be used like ping, to check server availability.
 
+* `NBD_CMD_WRITE_ZEROES64` (6)
+
+  NBD_CMD_WRITE_ZEROES representation with 64bit length.
+
+  The payload is structured as:
+
+  16 bits: command flags
+  64 bits: offset (unsigned)
+  64 bits: length (unsigned)
+
+  The fields has exactly same meaning as corresponding fields for
+  NBD_CMD_WRITE_ZEROES request.
+
+  This request chunk type MUST be the only one chunk of the structured message
+  and therefore MUST be accompanied by NBD_STRUCTURED_FLAG_DONE.
+
+  This request chunk type is negotiated by server flag
+  NBD_FLAG_SEND_WRITE_ZEROES64, and MUST not be used otherwise.
+
 #### Request types
 
 The following request types exist:
@@ -2138,6 +2159,11 @@ The following request types exist:
     including one or more sectors beyond the size of the device. It SHOULD
     return `NBD_EPERM` if it receives a write zeroes request on a read-only export.
 
+    If structured requests are negotieated by server, client MAY use
+    64bit variant of the command, which has exactly same behavior and
+    the only differency is 64bit length field. See NBD_CMD_WRITE_ZEROES64
+    above.
+
 * `NBD_CMD_BLOCK_STATUS` (7)
 
     A block status query request. Length and offset define the range
-- 
2.21.0

