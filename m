Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E0194151AA8
	for <lists+nbd@lfdr.de>; Tue,  4 Feb 2020 13:42:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C3C5A20512; Tue,  4 Feb 2020 12:42:24 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb  4 12:42:24 2020
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5B66520537
	for <lists-other-nbd@bendel.debian.org>; Tue,  4 Feb 2020 12:24:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jQfHAddkH5mB for <lists-other-nbd@bendel.debian.org>;
	Tue,  4 Feb 2020 12:24:25 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
X-Greylist: delayed 1278 seconds by postgrey-1.36 at bendel; Tue, 04 Feb 2020 12:24:25 UTC
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id BF4212048D
	for <nbd@other.debian.org>; Tue,  4 Feb 2020 12:24:25 +0000 (UTC)
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1iywv0-0002p6-I9; Tue, 04 Feb 2020 15:03:02 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: nbd@other.debian.org
Cc: den@openvz.org,
	eblake@redhat.com,
	vsementsov@virtuozzo.com
Subject: [PATCH] doc/proto: drop max-block restriction for data-less commands
Date: Tue,  4 Feb 2020 15:02:57 +0300
Message-Id: <20200204120257.3685-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <prWSCiUKgsM.A.2R.waWOeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/790
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200204120257.3685-1-vsementsov@virtuozzo.com
Resent-Date: Tue,  4 Feb 2020 12:42:24 +0000 (UTC)

max-block restriction make sense for NBD_CMD_WRITE and NBD_CMD_READ to
avoid big data transfer and long io operations at server side.
NBD_CMD_WRITE_ZEROES still may be realized on server through direct
writing zeroes, which may lead to long operation and huge allocation
and should be restricted by max-block.
Same for NBD_CMD_CACHE: long operation / big allocation.

Still, NBD_CMD_TRIM, NBD_CMD_BLOCK_STATUS and NBD_CMD_WRITE_ZEROES with
NBD_CMD_FLAG_FAST_ZERO set are over-restricted by it. So, for better
performance, drop these restrictions.

Note, that Qemu nbd server already works accordingly to this patch: it
doesn't check the restriction for NBD_CMD_TRIM, NBD_CMD_BLOCK_STATUS
and NBD_CMD_WRITE_ZEROES.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

RFC question: hmm, Qemu nbd doesn't check restriction for WRITE_ZEROES
at all, even without NBD_CMD_FLAG_FAST_ZERO flag.

So, we probably could go further, and allow big WRITE_ZEROES without
this flag..

Or may be change s/MUST NOT/SHOULD NOT/ for this case..


 doc/proto.md | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index fc7baf6..4b067f5 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -815,9 +815,12 @@ Where a transmission request can have a nonzero *offset* and/or
 the client MUST ensure that *offset* and *length* are integer
 multiples of any advertised minimum block size, and SHOULD use integer
 multiples of any advertised preferred block size where possible.  For
-those requests, the client MUST NOT use a *length* larger than any
-advertised maximum block size or which, when added to *offset*, would
-exceed the export size.  The server SHOULD report an `NBD_EINVAL` error if
+those requests, the client MUST NOT use a *length* which, when added to
+*offset*, would exceed the export size. Also for NBD_CMD_READ,
+NBD_CMD_WRITE, NBD_CMD_CACHE and NBD_CMD_WRITE_ZEROES (except for
+when NBD_CMD_FLAG_FAST_ZERO is set), the client MUST NOT use a *length*
+larger than any advertised maximum block size.
+The server SHOULD report an `NBD_EINVAL` error if
 the client's request is not aligned to advertised minimum block size
 boundaries, or is larger than the advertised maximum block size.
 Notwithstanding any maximum block size advertised, either the server
-- 
2.21.0

