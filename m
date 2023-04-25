Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB2D6EE3CA
	for <lists+nbd@lfdr.de>; Tue, 25 Apr 2023 16:18:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3D502205F0; Tue, 25 Apr 2023 14:18:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr 25 14:18:31 2023
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8B88F206F4
	for <lists-other-nbd@bendel.debian.org>; Tue, 25 Apr 2023 14:02:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.02 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id m-i8JhEUva9Y for <lists-other-nbd@bendel.debian.org>;
	Tue, 25 Apr 2023 14:02:44 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd2d.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 07351206F2
	for <nbd@other.debian.org>; Tue, 25 Apr 2023 14:02:43 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-760a1c94c28so30565239f.1
        for <nbd@other.debian.org>; Tue, 25 Apr 2023 07:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1682431360; x=1685023360;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbSmchhnLqoxBBOB9jzlLo4OdNnltqZ5Dw4f7dze7p4=;
        b=VgEuSmnVeGcFhD19eLG2aJIJQKvz4ZPWM0hMuDNYNq+BKxR75DmV5/xn7GqmhsoYMR
         WxPr6zdb2B6WHF3Srj18a7fj3uKE0Nc2cCn+sobzPy7QQsk1C5FJm37J+eF86s2hPa0M
         avlbNfWyo1stoqb/j+8unWJYG66Q2wM6E1O4RVCgc+ACxLwpwnoE9DybYkOnRTUFL3ja
         mBJOlYaECuiA293Dj+LDq9Y2SLOzXvsdu5NnBx3hvBLS2M9C9heBknpYyUp6DXajK+Wf
         mdcOD5l9GrnmS90TgmSmtPdljLBOpNWCG4Od2I9QsoDhtL+V05ejsQKG+fv5s2h0S2UG
         DmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682431360; x=1685023360;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbSmchhnLqoxBBOB9jzlLo4OdNnltqZ5Dw4f7dze7p4=;
        b=CkWqXFNXW8zXD2JWS6Yb7c9H2chE+NOcj6KpemRtJvkZWtzsCGUWJqDYnhhAnFwcye
         KfMrHyq5SLCtz5q+HnfLVGnmtFPPI7ydy3ctDwpnvMs4aXkfkufCWiYau4kBBhBFPsPN
         OPB4NkTGrsb+zWIYvzGfbZ94n6KLqtzQJLFu7fiPTbEqrFanbk/BjoEJVV9jp4j0VUMG
         A7ftGaB12kC/RDvP2DR0tEBNTZQAndiS2zPYBDoZTzibnWyrwENcwYsJGICkE+wuWB3N
         BTPAdOS5xHtpbOtjtva+dUrgGZXqy0o1uuufBJ0bnLGwtA74jvel4rq2F+iFuKhMnoc9
         Rn3g==
X-Gm-Message-State: AC+VfDxGiGdooT7MXlL3xshpLGswvd2EGwzdLFrabGTNDiXNV4eAXhMx
	peW3f17ELFXv6tL+YzuX1jKAicy+D6Vt6dlY0vU=
X-Google-Smtp-Source: ACHHUZ7tihl5IcLne+etz9KF/64OCuhsafJExlla/uPvJwVFetjytc1OomzoQU7CPrNfKKdk5Du9zw==
X-Received: by 2002:a05:6e02:de5:b0:32a:d83e:491e with SMTP id m5-20020a056e020de500b0032ad83e491emr928945ilj.0.1682431359436;
        Tue, 25 Apr 2023 07:02:39 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id t32-20020a05663836e000b0041284223319sm306309jau.88.2023.04.25.07.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 07:02:38 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, linux-bcache@vger.kernel.org, 
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: josef@toxicpanda.com, minchan@kernel.org, senozhatsky@chromium.org, 
 colyli@suse.de, kent.overstreet@gmail.com, dlemoal@kernel.org, 
 johannes.thumshirn@wdc.com, bvanassche@acm.org, vincent.fu@samsung.com, 
 akinobu.mita@gmail.com, shinichiro.kawasaki@wdc.com, nbd@other.debian.org
In-Reply-To: <20230424234628.45544-1-kch@nvidia.com>
References: <20230424234628.45544-1-kch@nvidia.com>
Subject: Re: [PATCH V2 0/1] block/drivers: remove dead clear of random flag
Message-Id: <168243135820.8048.11023111731807520461.b4-ty@kernel.dk>
Date: Tue, 25 Apr 2023 08:02:38 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <AYHOn2kHnkE.A.caB.3E-RkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2454
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/168243135820.8048.11023111731807520461.b4-ty@kernel.dk
Resent-Date: Tue, 25 Apr 2023 14:18:31 +0000 (UTC)


On Mon, 24 Apr 2023 16:46:27 -0700, Chaitanya Kulkarni wrote:
> The drivers in this patch-series clear QUEUE_FLAG_ADD_RANDOM that is
> not set at all in the queue allocation path in :-
> 
> drivers/block/mtip32xx/mtip32xx.c:	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, dd->queue);
> drivers/block/null_blk/main.c:	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, nullb->q);
> drivers/block/rbd.c:	/* QUEUE_FLAG_ADD_RANDOM is off by default for blk-mq */
> drivers/block/zram/zram_drv.c:	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, zram->disk->queue);
> drivers/block/nbd.c:	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, disk->queue);
> drivers/block/brd.c:	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, disk->queue);
> drivers/md/bcache/super.c:	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, d->disk->queue);
> drivers/md/dm-table.c:	 * Clear QUEUE_FLAG_ADD_RANDOM if any underlying device does not
> drivers/md/dm-table.c:		blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, q);
> drivers/mmc/core/queue.c:	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, mq->queue);
> drivers/mtd/mtd_blkdevs.c:	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, new->rq);
> drivers/s390/block/scm_blk.c:	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, rq);
> drivers/scsi/sd.c:		blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, q);
> drivers/scsi/sd.c:		blk_queue_flag_set(QUEUE_FLAG_ADD_RANDOM, q);
> include/linux/blkdev.h:#define QUEUE_FLAG_ADD_RANDOM	10	/* Contributes to random pool */
> include/linux/blkdev.h:#define blk_queue_add_random(q)	test_bit(QUEUE_FLAG_ADD_RANDOM, &(q)->queue_flags)
> 
> [...]

Applied, thanks!

[1/1] block/drivers: remove dead clear of random flag
      commit: 3f89ac587baa0c0460c977d1596e16f950815f05

Best regards,
-- 
Jens Axboe



