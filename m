Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D997451BB
	for <lists+nbd@lfdr.de>; Sun,  2 Jul 2023 21:57:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C938020F1E; Sun,  2 Jul 2023 19:57:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jul  2 19:57:13 2023
Old-Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7986820F01
	for <lists-other-nbd@bendel.debian.org>; Sun,  2 Jul 2023 19:40:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-12.191 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DSifYaEoyoHw for <lists-other-nbd@bendel.debian.org>;
	Sun,  2 Jul 2023 19:40:45 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_IP=-2 (check from: .kernel. - helo: .dfw.source.kernel. - helo-domain: .kernel.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9952520EF9
	for <nbd@other.debian.org>; Sun,  2 Jul 2023 19:40:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5316160C98;
	Sun,  2 Jul 2023 19:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA564C433C8;
	Sun,  2 Jul 2023 19:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688326838;
	bh=sB3H+3BFpVqM9IJlZFM+G0+XNhcWle9yWb7Z753Yb9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f0o2422Pg5y1c2Ph+AUVAU79jhzptSmugguPCq1xizjk3ebp9WYnmS2QpAAYUMYyH
	 It1E4iZArsA9o2/DpKZ1yCn3DmvdrlUc0kjJmIYtGQXgmUXaueoO8sTZqpD3uyP+IM
	 Svx7xuVHrzJskX8nbIIJFZOJtcLlWzIPW2hjlKkk3yF6ASOT22UMr8Ha9u+lT/3Slk
	 Uh7KcIKVyt6OjECOXyFC6o4wg7CN8vi9zqgsxt3WTs9yStRvKZ6TVNPCKALVgAaUyZ
	 IeRelJEjLjTh2LUusGvCoMPppZ2SLzF1Fo5W3ZAq8kdo099W5oTU56Jo95GP6Si/sy
	 +StFaMbKB9N0w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zhong Jinghua <zhongjinghua@huawei.com>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Sasha Levin <sashal@kernel.org>,
	josef@toxicpanda.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH AUTOSEL 6.4 06/15] nbd: Add the maximum limit of allocated index in nbd_dev_add
Date: Sun,  2 Jul 2023 15:40:11 -0400
Message-Id: <20230702194020.1776895-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702194020.1776895-1-sashal@kernel.org>
References: <20230702194020.1776895-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.1
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <t81BevkK15D.A.glE.ZadokB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2555
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230702194020.1776895-6-sashal@kernel.org
Resent-Date: Sun,  2 Jul 2023 19:57:13 +0000 (UTC)

From: Zhong Jinghua <zhongjinghua@huawei.com>

[ Upstream commit f12bc113ce904777fd6ca003b473b427782b3dde ]

If the index allocated by idr_alloc greater than MINORMASK >> part_shift,
the device number will overflow, resulting in failure to create a block
device.

Fix it by imiting the size of the max allocation.

Signed-off-by: Zhong Jinghua <zhongjinghua@huawei.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Link: https://lore.kernel.org/r/20230605122159.2134384-1-zhongjinghua@huaweicloud.com
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/nbd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 65ecde3e2a5be..6457a094abcc1 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1776,7 +1776,8 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 		if (err == -ENOSPC)
 			err = -EEXIST;
 	} else {
-		err = idr_alloc(&nbd_index_idr, nbd, 0, 0, GFP_KERNEL);
+		err = idr_alloc(&nbd_index_idr, nbd, 0,
+				(MINORMASK >> part_shift) + 1, GFP_KERNEL);
 		if (err >= 0)
 			index = err;
 	}
-- 
2.39.2

