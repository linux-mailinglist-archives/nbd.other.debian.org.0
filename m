Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B36CD43B4FE
	for <lists+nbd@lfdr.de>; Tue, 26 Oct 2021 17:00:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 996782037E; Tue, 26 Oct 2021 15:00:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct 26 15:00:32 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,TO_TOO_MANY
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3C31120442
	for <lists-other-nbd@bendel.debian.org>; Tue, 26 Oct 2021 14:44:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.02 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	TO_TOO_MANY=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id URo-Tl7FDOwp for <lists-other-nbd@bendel.debian.org>;
	Tue, 26 Oct 2021 14:44:33 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 984CC20433
	for <nbd@other.debian.org>; Tue, 26 Oct 2021 14:44:33 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id n36-20020a17090a5aa700b0019fa884ab85so2449894pji.5
        for <nbd@other.debian.org>; Tue, 26 Oct 2021 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z+Z7xBwuEdiDo3yfPlLotr1uBNzHqi96x2Qr+oepBsg=;
        b=22j8DgYNRhC00uD/t5NzU582DDp0TeZDzIrUD1vGUJP+buHsS4Wl2zs0sJDnuKtMZM
         0RyGAs9nqjt3Dbg08V65xH2SaH2M1zPQmwqjjAnf9XDDtU/VK5JihbmRhTzIl1xVtubj
         P4M4bdBG8Fwk/bkknT7a1/4cncO0izssVrGw3M+oo3Bj4/oBRDzoAGeWAqohB476Lq5N
         d+JDoJtjNzeV/lnlK9fc6hB5aojZQ9n3ECn2VdAGwwKDCmgN4JQqDjeSxsijRk5QpSuf
         B4YMiW8PTC5adr8WbXbEi6Pl3UVvZz2G0FfLhxpLFyqMkjuRZeq10dd/PxM/yDRHsuUu
         6/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z+Z7xBwuEdiDo3yfPlLotr1uBNzHqi96x2Qr+oepBsg=;
        b=P3OiTRUPgRU/0vhoNUQghkAyA7lKKgJRAQu0VvCXQtqzBaa5cCaz5TneynKtpFGWq/
         b0+Gh8mCOSTLpOPBlH05M4bcpiP237WaRR8m5NHgU1Cr9TEnBGQlSjpeJWkfbxV1RZfo
         bt3L0XzhaGvUHh/KTnEVkBfPWLJbRCB15tqFE+29gawPSL/z9i0QOLwme3Xl2hRRdU/R
         jqIjEVXNw5oEkvTSlO8vI9Cpw+Y/Vmw5oWyUG7B2L7fBA9ubLYYOi1/VSkjr4Y7TgmOf
         XlLw1C+aaxoL0CxMBSzoUopxBtPBhqrDTajDRrfGulY3DSd/QtBkHrIFbCoWHknCRjwB
         CYUA==
X-Gm-Message-State: AOAM533AuUBkLwyAysDdGEwwBrIzG2X6bHwVwibcY3+4UsTPdLXQKt0D
	NaWBSajbUG6r7gaj7YEitnvV
X-Google-Smtp-Source: ABdhPJy6TY80ypFa1FsBAsensvZvnVf0khk4LzYsG9f8LfU6Fg3VXfA30SCyYasasYzhyUMmEmeu1Q==
X-Received: by 2002:a17:902:bf07:b0:138:e32d:9f2e with SMTP id bi7-20020a170902bf0700b00138e32d9f2emr22470151plb.59.1635259469930;
        Tue, 26 Oct 2021 07:44:29 -0700 (PDT)
Received: from localhost ([139.177.225.237])
        by smtp.gmail.com with ESMTPSA id on13sm1323889pjb.23.2021.10.26.07.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 07:42:58 -0700 (PDT)
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
Subject: [PATCH v3 2/4] nbd: Use blk_validate_block_size() to validate block size
Date: Tue, 26 Oct 2021 22:40:13 +0800
Message-Id: <20211026144015.188-3-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026144015.188-1-xieyongji@bytedance.com>
References: <20211026144015.188-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <QTKUOkx7jRN.A.ggF.QgBehB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1579
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211026144015.188-3-xieyongji@bytedance.com
Resent-Date: Tue, 26 Oct 2021 15:00:32 +0000 (UTC)

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

