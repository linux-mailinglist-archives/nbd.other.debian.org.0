Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9533143B4FF
	for <lists+nbd@lfdr.de>; Tue, 26 Oct 2021 17:00:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7D5C6203BD; Tue, 26 Oct 2021 15:00:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct 26 15:00:43 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,TO_TOO_MANY
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DC97B20433
	for <lists-other-nbd@bendel.debian.org>; Tue, 26 Oct 2021 14:44:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.02 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	TO_TOO_MANY=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id bOwhCaf1rccZ for <lists-other-nbd@bendel.debian.org>;
	Tue, 26 Oct 2021 14:44:37 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 487982043E
	for <nbd@other.debian.org>; Tue, 26 Oct 2021 14:44:37 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id oa4so11127079pjb.2
        for <nbd@other.debian.org>; Tue, 26 Oct 2021 07:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=av0r/rjVqFrB/l7qERXJM+4hS0XcNVLfoNKN5vMbJNg=;
        b=fQCuSISujQ+sp4jiaR2E3exaiwEYxJwlV49WSqAxrPz8tjID4RK9dUcdYjmYSArsLN
         okRmNoxVVFxY50rCcK3bONQSE0Re5Q4qqvWpnnJY9ONfiJM0SA/Ok/XB9E7rdEhIZ/Uz
         4skmvpbX5fSta7u6VMRNW3H94ocQ9YwBGIMd2mpvjPtefnKml9woJY4Jk6N17UDeFb2k
         nkWr2Cl+nsf/X8K/M1vklGlm6NoD83XAvXz6x+vy3NC1F6an3D0TbHoCHcdyC0KtPkhA
         g4zWU4JM8bWS6/P/GS46nl54uzxY+GMfhHSKgHMtCsTaRqS4BqwmGYQqcKxMfC8uQe3u
         EeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=av0r/rjVqFrB/l7qERXJM+4hS0XcNVLfoNKN5vMbJNg=;
        b=bEG0pLVKt8Nt2fc4EOQO4k2FaoATlBu+NEaMN/nTgbfDkrOBGaQvK4MM0FruVtPMqQ
         WmNXj+7wmTLf4H+iVzOXZXjbOJiGlxWwBJcxVzqZtmUjp7aIEtgWEYMmiYXsbl3SOn9O
         5PSIDXhrfj2Hzp0JRVzY9iYosWaNJh+oI0wCnBaMQRnAXf5dXA9cROdA2HMo4vzTPk9+
         y0ymdEneuWcBkH8R0Ek2WDoAAs9m9ZLzuH474uJ+H/i4X2E4cNiyL5jqvvLcUDkG/d/3
         YHEZDYr71+RnXzv/WEUTJiyK68ptvaHTOOOQGYO3xry3uZnsVIts/cs1MWg6QBH6puV8
         HaaA==
X-Gm-Message-State: AOAM5324FJuDOjDx85yjbDDY9K7/VYiM3yInc4qpB8QBUMTX27gWINcF
	cKGSI3WmO5PM6ORiq5BV3O8X
X-Google-Smtp-Source: ABdhPJyTDsD97vcyR2KGqe10jzWQryeC853DoaBsvwg3J1QWs9+FnNpyFRuyRjDckKsjLlrUuPA1hg==
X-Received: by 2002:a17:90b:1d86:: with SMTP id pf6mr38167103pjb.20.1635259473908;
        Tue, 26 Oct 2021 07:44:33 -0700 (PDT)
Received: from localhost ([139.177.225.237])
        by smtp.gmail.com with ESMTPSA id p9sm22418175pfn.7.2021.10.26.07.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 07:44:32 -0700 (PDT)
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
Subject: [PATCH v3 3/4] loop: Use blk_validate_block_size() to validate block size
Date: Tue, 26 Oct 2021 22:40:14 +0800
Message-Id: <20211026144015.188-4-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026144015.188-1-xieyongji@bytedance.com>
References: <20211026144015.188-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3dQzcZiKnQP.A.uiF.bgBehB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1580
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211026144015.188-4-xieyongji@bytedance.com
Resent-Date: Tue, 26 Oct 2021 15:00:43 +0000 (UTC)

Remove loop_validate_block_size() and use the block layer helper
to validate block size.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 drivers/block/loop.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 7bf4686af774..dfc72a1f6500 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -273,19 +273,6 @@ static void __loop_update_dio(struct loop_device *lo, bool dio)
 }
 
 /**
- * loop_validate_block_size() - validates the passed in block size
- * @bsize: size to validate
- */
-static int
-loop_validate_block_size(unsigned short bsize)
-{
-	if (bsize < 512 || bsize > PAGE_SIZE || !is_power_of_2(bsize))
-		return -EINVAL;
-
-	return 0;
-}
-
-/**
  * loop_set_size() - sets device size and notifies userspace
  * @lo: struct loop_device to set the size for
  * @size: new size of the loop device
@@ -1236,7 +1223,7 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 	}
 
 	if (config->block_size) {
-		error = loop_validate_block_size(config->block_size);
+		error = blk_validate_block_size(config->block_size);
 		if (error)
 			goto out_unlock;
 	}
@@ -1759,7 +1746,7 @@ static int loop_set_block_size(struct loop_device *lo, unsigned long arg)
 	if (lo->lo_state != Lo_bound)
 		return -ENXIO;
 
-	err = loop_validate_block_size(arg);
+	err = blk_validate_block_size(arg);
 	if (err)
 		return err;
 
-- 
2.11.0

