Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2015189C
	for <lists+nbd@lfdr.de>; Mon, 24 Jun 2019 18:27:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4BDAD20483; Mon, 24 Jun 2019 16:27:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 24 16:27:08 2019
Old-Return-Path: <marcos.souza.org@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FREEMAIL_FROM,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 354FF20461
	for <lists-other-nbd@bendel.debian.org>; Mon, 24 Jun 2019 16:09:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pGl-pLs15_NN for <lists-other-nbd@bendel.debian.org>;
	Mon, 24 Jun 2019 16:09:19 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 390C0203D8
	for <nbd@other.debian.org>; Mon, 24 Jun 2019 16:09:16 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id m29so15102844qtu.1
        for <nbd@other.debian.org>; Mon, 24 Jun 2019 09:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZCpezpLtCB1J9Gal7ptkDlYgmZl63QGP8artZkviCDA=;
        b=etStToFOav+7bM42+SKEzJy5f/AScX04IseFYdc4Nm8Bc6tPADY2ROkboZShxOZLjN
         T5DdXgzO/yRsO+xQkDqieqB/h4rlLStssB/aRi/wU85Vfxq+IFthM7NCzmFQ1d0oFoVV
         cg6eRsMe06hlXqVAkY3UGhvqUAepoVpFRccv0sTdwRbOKbiaJw6NAv38m/fZqJP2i7b/
         xmDlMOYu15NiEKgYHiOL5Xadw/5yRbbQcjM7B3TEG1z+ajWNMP0n/TaCvdMPxvVkSeTq
         lde5OYPkrRzTq4hVwEbqeTNUbEnOKsCfKtUihWNY7x1iOrf4Ifwuvq9gDS2PGzdD+TXo
         6V/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZCpezpLtCB1J9Gal7ptkDlYgmZl63QGP8artZkviCDA=;
        b=KyfnFf/Ptc+0T+crnKMHGIY0fo3m0akw0c4lnuEOsxgEQcY34Q+teMNwjYG2LhP4kM
         +5BG5f6/4drt7C1NgUc3lQ20kDQpm6A4wqfC1DOH/NDz1ocW3UEv2rIQT3fzKzPL7ESM
         5YCNmkwfScnEYoXgQMOC2ZqU+s/ZEoN57kejZjd3W4ArDz3Un8Mjfh90SsMld6F5enEI
         MSz/5acAmpHbqvP2IUAS+RHV4EV8X0j8PlZ/qlR8Woc9M8eYuWJgQsgDEun3GXJGx7W4
         kfmb5KFZi1YsHKD5+NUY09xeuRpCS5Ma0XU8hptj7ACz0A5Nr10r+U++DLSZBj/0Mkvr
         8/QQ==
X-Gm-Message-State: APjAAAX39JbhqR3qpfUt1yb1RGipIMYFp8a9yEY2/t7Q35EtHjSpXDZk
	k+7s2nAyRMpoj4wo+2t8NCw=
X-Google-Smtp-Source: APXvYqzmTaHXwZxuG+EwWxfqCNTumIMVXGVIF5v19QQPeIRAiB74jnqEp3jhXTw732c8NNyCSZ6QiQ==
X-Received: by 2002:ac8:253d:: with SMTP id 58mr32092359qtm.40.1561392552988;
        Mon, 24 Jun 2019 09:09:12 -0700 (PDT)
Received: from continental.prv.suse.net ([177.132.134.92])
        by smtp.gmail.com with ESMTPSA id f132sm5549791qke.88.2019.06.24.09.09.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 24 Jun 2019 09:09:11 -0700 (PDT)
From: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Marcos Paulo de Souza <marcos.souza.org@gmail.com>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org (open list:NETWORK BLOCK DEVICE (NBD)),
	nbd@other.debian.org (open list:NETWORK BLOCK DEVICE (NBD))
Subject: [PATCH] driver: block: nbd: Replace magic number 9 with SECTOR_SHIFT
Date: Mon, 24 Jun 2019 13:09:33 -0300
Message-Id: <20190624160933.23148-1-marcos.souza.org@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <kpKo2Dpm7AH.A.iCG.cnPEdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/596
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190624160933.23148-1-marcos.souza.org@gmail.com
Resent-Date: Mon, 24 Jun 2019 16:27:08 +0000 (UTC)

set_capacity expects the disk size in sectors of 512 bytes, and changing
the magic number 9 to SECTOR_SHIFT clarifies this intent.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 drivers/block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 3a9bca3aa093..fd3bc061c600 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -288,7 +288,7 @@ static void nbd_size_update(struct nbd_device *nbd)
 	}
 	blk_queue_logical_block_size(nbd->disk->queue, config->blksize);
 	blk_queue_physical_block_size(nbd->disk->queue, config->blksize);
-	set_capacity(nbd->disk, config->bytesize >> 9);
+	set_capacity(nbd->disk, config->bytesize >> SECTOR_SHIFT);
 	if (bdev) {
 		if (bdev->bd_disk) {
 			bd_set_size(bdev, config->bytesize);
-- 
2.21.0

