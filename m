Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5515A257E12
	for <lists+nbd@lfdr.de>; Mon, 31 Aug 2020 17:57:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3F6DA20458; Mon, 31 Aug 2020 15:57:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 31 15:57:22 2020
Old-Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MD5_SHA1_SUM,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 99DF120420
	for <lists-other-nbd@bendel.debian.org>; Mon, 31 Aug 2020 15:40:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.139 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.959,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id bwP6dJfeHUKY for <lists-other-nbd@bendel.debian.org>;
	Mon, 31 Aug 2020 15:40:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A38D72044E
	for <nbd@other.debian.org>; Mon, 31 Aug 2020 15:40:30 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DA7E920767;
	Mon, 31 Aug 2020 15:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598887820;
	bh=ht+MpGssPKdJ6E3rsvdmycBCNz+RMWwRINpMqFlTCqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AP7mPhhIXZomj4o2XoZnzCtfT9p7rI3/XsbrLq4uRX2koZd2g6tmndwdD17I4amDm
	 r7DiKc8GM6BVTEa6SN9P9tvgxcoxPzfkn8Jv65muM0505aw+oeawBfBrLghgjqiTLs
	 GV2M1zDmJXoiE9i3nslbAFVYbjn5Jski6rNMo4RE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hou Pu <houpu@bytedance.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	Sasha Levin <sashal@kernel.org>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH AUTOSEL 5.8 31/42] nbd: restore default timeout when setting it to zero
Date: Mon, 31 Aug 2020 11:29:23 -0400
Message-Id: <20200831152934.1023912-31-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831152934.1023912-1-sashal@kernel.org>
References: <20200831152934.1023912-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <g2l_4LDHxXL.A.POF.i3RTfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/962
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200831152934.1023912-31-sashal@kernel.org
Resent-Date: Mon, 31 Aug 2020 15:57:22 +0000 (UTC)

From: Hou Pu <houpu@bytedance.com>

[ Upstream commit acb19e17c5134dd78668c429ecba5b481f038e6a ]

If we configured io timeout of nbd0 to 100s. Later after we
finished using it, we configured nbd0 again and set the io
timeout to 0. We expect it would timeout after 30 seconds
and keep retry. But in fact we could not change the timeout
when we set it to 0. the timeout is still the original 100s.

So change the timeout to default 30s when we set it to zero.
It also behaves same as commit 2da22da57348 ("nbd: fix zero
cmd timeout handling v2").

It becomes more important if we were reconfigure a nbd device
and the io timeout it set to zero. Because it could take 30s
to detect the new socket and thus io could be completed more
quickly compared to 100s.

Signed-off-by: Hou Pu <houpu@bytedance.com>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/nbd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index ce7e9f223b20b..bc9dc1f847e19 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1360,6 +1360,8 @@ static void nbd_set_cmd_timeout(struct nbd_device *nbd, u64 timeout)
 	nbd->tag_set.timeout = timeout * HZ;
 	if (timeout)
 		blk_queue_rq_timeout(nbd->disk->queue, timeout * HZ);
+	else
+		blk_queue_rq_timeout(nbd->disk->queue, 30 * HZ);
 }
 
 /* Must be called with config_lock held */
-- 
2.25.1

