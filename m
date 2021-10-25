Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 847764398DF
	for <lists+nbd@lfdr.de>; Mon, 25 Oct 2021 16:42:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 584A12047A; Mon, 25 Oct 2021 14:42:44 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 25 14:42:44 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,TO_TOO_MANY
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3050420367
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 Oct 2021 14:25:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.02 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	TO_TOO_MANY=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xd6ae7bgqigw for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 Oct 2021 14:25:31 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C719020346
	for <nbd@other.debian.org>; Mon, 25 Oct 2021 14:25:31 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id t5-20020a17090a4e4500b001a0a284fcc2so11581864pjl.2
        for <nbd@other.debian.org>; Mon, 25 Oct 2021 07:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z+Z7xBwuEdiDo3yfPlLotr1uBNzHqi96x2Qr+oepBsg=;
        b=rTjEd60jOwJMhvhEMRHrMEBAKxeXsvtSubyuLHnKWoGE2nd+sUM8esldpNB9FZyd9K
         gRQCeEn1RXqoxkZzazCxggbQD8onZqyIrumUA0RNpRhOUM/31Q0jULpAwPnmnaHq6asM
         IVZUJ3hCMlpovO0MZnb2o/8SMBwrlqyN+NapbT63b08vlGyItYPJ66jBYCb4FrpaAIwM
         KI0zI9GdD0ZJvD3b0rU6gDthUBHTwgraXxDkHsAEkVUzeVLVTX8Bcfrgc+xsjt4mWe8P
         MXJo/mpXLJJ35X4Nl6gSqLZQonxUrJq1heeyTERlrDrxbUrkip2EDzQeaeZr52tE8j35
         fyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z+Z7xBwuEdiDo3yfPlLotr1uBNzHqi96x2Qr+oepBsg=;
        b=5Z1KotPch6iwXtYFqnLSfNFkq1XPY8rbqFjCY9imZNaM3J3V09R/LRzuyp4yfoFMIw
         UUN49JWcPRrNle8RepGwGVrE4+VbsgI5VQcjkPWulxA1xZvN2J4vVSlF3o+4GLeKgNyo
         suyTRq/+++Q97w4xCAVvznSQv5fV7OPcNxzO3igPwkbua5dhiuZlNLQreczYMK0XXEno
         o/FDjmmpFLhnd2N/wD/I69BvxmQfP+6Vyj8g484IE52UAxIJFa6HZOzcUtb2+19cGxKW
         zahVqLPuzUjOJIWyk7HNGATi/HZq27JzOqkBdCZa3y/p282LyjWpCnx1DcfD8j1yNifU
         xuJg==
X-Gm-Message-State: AOAM5337VlKdi9IXYBZMGXVteuD9fR+KMmfIGFYKzt8pqlr2Mot+SnAL
	NpKo1MroyFFjYdPIN8Yars6+
X-Google-Smtp-Source: ABdhPJxm/W5mKeg55PTl0JwWvTPTmH6uEA/7yKQ01Mx6oyo7yr2Rrwv5cHZuBMKhI387NKzPi54k5w==
X-Received: by 2002:a17:90a:4598:: with SMTP id v24mr21011284pjg.5.1635171928289;
        Mon, 25 Oct 2021 07:25:28 -0700 (PDT)
Received: from localhost ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id s30sm23254567pfg.17.2021.10.25.07.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:25:27 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: axboe@kernel.dk,
	hch@lst.de,
	josef@toxicpanda.com,
	mst@redhat.com,
	jasowang@redhat.com,
	stefanha@redhat.com,
	kwolf@redhat.com
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH v2 2/4] nbd: Use blk_validate_block_size() to validate block size
Date: Mon, 25 Oct 2021 22:25:04 +0800
Message-Id: <20211025142506.167-3-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025142506.167-1-xieyongji@bytedance.com>
References: <20211025142506.167-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jle6HQ6tfnJ.A.jMH.kJsdhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1570
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211025142506.167-3-xieyongji@bytedance.com
Resent-Date: Mon, 25 Oct 2021 14:42:44 +0000 (UTC)

Use the block layer helper to validate block size instead
of open coding it.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 drivers/block/nbd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 1183f7872b71..3f58c3eb38b6 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -323,7 +323,8 @@ static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 {
 	if (!blksize)
 		blksize = 1u << NBD_DEF_BLKSIZE_BITS;
-	if (blksize < 512 || blksize > PAGE_SIZE || !is_power_of_2(blksize))
+
+	if (blk_validate_block_size(blksize))
 		return -EINVAL;
 
 	nbd->config->bytesize = bytesize;
-- 
2.11.0

