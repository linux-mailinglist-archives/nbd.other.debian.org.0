Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC5715E366
	for <lists+nbd@lfdr.de>; Fri, 14 Feb 2020 17:30:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1296320349; Fri, 14 Feb 2020 16:30:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb 14 16:30:20 2020
Old-Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FVGT_m_MULTI_ODD,
	MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3FB2220609
	for <lists-other-nbd@bendel.debian.org>; Fri, 14 Feb 2020 16:12:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.161 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FVGT_m_MULTI_ODD=0.02, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id b226qhlcT28Z for <lists-other-nbd@bendel.debian.org>;
	Fri, 14 Feb 2020 16:12:56 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id F188E20676
	for <nbd@other.debian.org>; Fri, 14 Feb 2020 16:12:55 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7AC80246A1;
	Fri, 14 Feb 2020 16:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581696772;
	bh=sgwlTZtHceOcXQlBCBMlRKJUHnRjwhhrQxZY8HOsp7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0MuvGpfvGcxxNRBc4GHEmXp7TFr83xOhs66f19Zvs1BqQ7cNoxxOSmdqngb7wC77x
	 G+a8XBBJqbyM/IVkkTbsTBRYPDauDPTOIoQb8lXz+KtfMwyZ3u03o5k3UTxH82JgzZ
	 v6LBh3VTNjslwmpHjkWM+iLe1U63ZORSqjgYtEhs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sun Ke <sunke32@huawei.com>,
	Jens Axboe <axboe@kernel.dk>,
	Sasha Levin <sashal@kernel.org>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH AUTOSEL 4.19 050/252] nbd: add a flush_workqueue in nbd_start_device
Date: Fri, 14 Feb 2020 11:08:25 -0500
Message-Id: <20200214161147.15842-50-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214161147.15842-1-sashal@kernel.org>
References: <20200214161147.15842-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Rb4Awga2UaH.A._IH.cssReB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/824
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200214161147.15842-50-sashal@kernel.org
Resent-Date: Fri, 14 Feb 2020 16:30:20 +0000 (UTC)

From: Sun Ke <sunke32@huawei.com>

[ Upstream commit 5c0dd228b5fc30a3b732c7ae2657e0161ec7ed80 ]

When kzalloc fail, may cause trying to destroy the
workqueue from inside the workqueue.

If num_connections is m (2 < m), and NO.1 ~ NO.n
(1 < n < m) kzalloc are successful. The NO.(n + 1)
failed. Then, nbd_start_device will return ENOMEM
to nbd_start_device_ioctl, and nbd_start_device_ioctl
will return immediately without running flush_workqueue.
However, we still have n recv threads. If nbd_release
run first, recv threads may have to drop the last
config_refs and try to destroy the workqueue from
inside the workqueue.

To fix it, add a flush_workqueue in nbd_start_device.

Fixes: e9e006f5fcf2 ("nbd: fix max number of supported devs")
Signed-off-by: Sun Ke <sunke32@huawei.com>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/nbd.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index b9d321bdaa8a7..226103af30f05 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1216,6 +1216,16 @@ static int nbd_start_device(struct nbd_device *nbd)
 		args = kzalloc(sizeof(*args), GFP_KERNEL);
 		if (!args) {
 			sock_shutdown(nbd);
+			/*
+			 * If num_connections is m (2 < m),
+			 * and NO.1 ~ NO.n(1 < n < m) kzallocs are successful.
+			 * But NO.(n + 1) failed. We still have n recv threads.
+			 * So, add flush_workqueue here to prevent recv threads
+			 * dropping the last config_refs and trying to destroy
+			 * the workqueue from inside the workqueue.
+			 */
+			if (i)
+				flush_workqueue(nbd->recv_workq);
 			return -ENOMEM;
 		}
 		sk_set_memalloc(config->socks[i]->sock->sk);
-- 
2.20.1

