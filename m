Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 937DD468065
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:31:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7B11520178; Fri,  3 Dec 2021 23:31:39 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:31:39 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B219F20160
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:31:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.927 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uaj6PkzzumF9 for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:31:27 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id CE4A52015F
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ReflyIVyVVxgUfE8lnp73Rx1x6HoY9UGsRIRe/TvEe4=;
	b=HgX6BO7tfmaTe7wd+2K9MO/IFI3+IV+vSZH3vsxuHeLGkx7bwaMgUHt2MCwKLJeVfNs+Ff
	MjvEU7qDG3JMMg5gVCnaThFd7RnLhTHqQViiOdaUGqrERkA8TFhg45Gg5PPsaLZRWWa5Jz
	FbrM7dxJLCrGtRDBSOQz2xzcCjYXOvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-kMdgzBqtP7SN3waLOsfHhA-1; Fri, 03 Dec 2021 18:16:00 -0500
X-MC-Unique: kMdgzBqtP7SN3waLOsfHhA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AABB100CCC6;
	Fri,  3 Dec 2021 23:15:59 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60D205D9D5;
	Fri,  3 Dec 2021 23:15:58 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: nbd@other.debian.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	libguestfs@redhat.com,
	nsoffer@redhat.com,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 03/14] qemu-io: Allow larger write zeroes under no fallback
Date: Fri,  3 Dec 2021 17:15:28 -0600
Message-Id: <20211203231539.3900865-4-eblake@redhat.com>
In-Reply-To: <20211203231539.3900865-1-eblake@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231539.3900865-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qogwawExCWG.A.m4C.bjqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1619
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231539.3900865-4-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:31:39 +0000 (UTC)

When writing zeroes can fall back to a slow write, permitting an
overly large request can become an amplification denial of service
attack in triggering a large amount of work from a small request.  But
the whole point of the no fallback flag is to quickly determine if
writing an entire device to zero can be done quickly (such as when it
is already known that the device started with zero contents); in those
cases, artificially capping things at 2G in qemu-io itself doesn't
help us.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qemu-io-cmds.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 954955c12fb9..45a957093369 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -603,10 +603,6 @@ static int do_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
         .done   = false,
     };

-    if (bytes > INT_MAX) {
-        return -ERANGE;
-    }
-
     co = qemu_coroutine_create(co_pwrite_zeroes_entry, &data);
     bdrv_coroutine_enter(blk_bs(blk), co);
     while (!data.done) {
@@ -1160,8 +1156,9 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
     if (count < 0) {
         print_cvtnum_err(count, argv[optind]);
         return count;
-    } else if (count > BDRV_REQUEST_MAX_BYTES) {
-        printf("length cannot exceed %" PRIu64 ", given %s\n",
+    } else if (count > BDRV_REQUEST_MAX_BYTES &&
+               !(flags & BDRV_REQ_NO_FALLBACK)) {
+        printf("length cannot exceed %" PRIu64 " without -n, given %s\n",
                (uint64_t)BDRV_REQUEST_MAX_BYTES, argv[optind]);
         return -EINVAL;
     }
-- 
2.33.1

