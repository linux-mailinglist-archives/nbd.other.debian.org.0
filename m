Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E23605262FB
	for <lists+nbd@lfdr.de>; Fri, 13 May 2022 15:30:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BEF8720379; Fri, 13 May 2022 13:30:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 13 13:30:19 2022
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=4.0 tests=DIGITS_LETTERS,DKIM_INVALID,
	DKIM_SIGNED,FOURLA,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 81A8A2036C
	for <lists-other-nbd@bendel.debian.org>; Fri, 13 May 2022 13:13:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.89 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id kujhncquzF4L for <lists-other-nbd@bendel.debian.org>;
	Fri, 13 May 2022 13:13:41 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x834.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 52EFD2036E
	for <nbd@other.debian.org>; Fri, 13 May 2022 13:13:40 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id g3so5490965qtb.7
        for <nbd@other.debian.org>; Fri, 13 May 2022 06:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6+gNOUaWkd0Bt/JIZ8SDZDMjw5UUXZsqOvLbfnJqY8g=;
        b=XQFCZfhm7ewTc4XGGTXLDs4ORqJoIOmN58pp/aiyNiZn+4KQD1n6GurSxpZnIeHGle
         BHgljDzcb8IocKVAna6UfJsdoy3zR4xntjetc9xE+ggJfXqHnFMAtZZ2uXcUAwnJpXM4
         z71gIN4Kf3+6Mn/A63t1Hqxn3h5n4ioP20D9p71dlE7v5cFGM4zcQkOi7DROx9Wfe2AN
         L9qYy/9ImbchcWiAdMnPMP1D3jFrgOf98pEoGnR7dsYj8g90ZIRsjjl42tE0GcZLl37n
         db9DftV4Q3/mGZbH/epzsq/QZAHrmL6njW81VxjaZZ2AakSkhIjFmysB8xqF/PjD1wvi
         bqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6+gNOUaWkd0Bt/JIZ8SDZDMjw5UUXZsqOvLbfnJqY8g=;
        b=XzjD+Ru0+JPXgT+Vy2UFI58u5qjbeVfNSDkjkF5x7vDksoLWcTh80hXWKnHjTGQXMq
         iWSreNPoUz8hW54JO27IP92GG2vLP/p+wGkpzdWeZYuccxInrkHBKESgpxIuEtTFeM9s
         Z41kp7TJ6vmi+D86vPwz66HZ/TAWSIiP8qvP5nP2PanLd9FTE8ckecr7WnQaE1vcuQt+
         QwI2UnRA8FxIBB+HmF/ZqTPKNF6E6gCPlJ4IYDKYSYxhn/Qupmo27Lquewg9X03bPc0z
         q/oiJIXRRfCYaeOWjxvHuLeLKUoPpc4IslW+6qnj1cS9PoRTsWpR+xtgrOIPNGPJqs2P
         2eDg==
X-Gm-Message-State: AOAM533SdMwFcM4BVNYJ87mJtMBaHPojP9Lg43Y80BO1nQ+DE5XkVN9y
	gILLVNdM7BaGzZGriQeiaHfh2g==
X-Google-Smtp-Source: ABdhPJwxT4heqZ/ZkYzHC2358zLSs+/kN7c2zraegXVpNi+Urh+gSE1Rj4PwtEzzhr8yWY34ktzoUA==
X-Received: by 2002:ac8:7f0d:0:b0:2f3:cd9e:c2ea with SMTP id f13-20020ac87f0d000000b002f3cd9ec2eamr4447513qtk.590.1652447617290;
        Fri, 13 May 2022 06:13:37 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id q19-20020ac87353000000b002f39b99f67esm1445845qtp.24.2022.05.13.06.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 06:13:36 -0700 (PDT)
Date: Fri, 13 May 2022 09:13:35 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Matthew Ruffell <matthew.ruffell@canonical.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block <linux-block@vger.kernel.org>,
	nbd <nbd@other.debian.org>,
	Linux Kernel <linux-kernel@vger.kernel.org>, yukuai3@huawei.com
Subject: Re: [PROBLEM] nbd requests become stuck when devices watched by
 inotify emit udev uevent changes
Message-ID: <Yn5Zf6lONff1AoOA@localhost.localdomain>
References: <20220422054224.19527-1-matthew.ruffell@canonical.com>
 <CAEzrpqe=LD3DQcEeLXmmFuq7cX_dAQ6DOCuJYWBoZWKKTmoTzA@mail.gmail.com>
 <CAKAwkKt3yMOOW3NXcE91WkGr+8xj050CYP2pLoQVHt_2wXq=-w@mail.gmail.com>
 <CAKAwkKvfFn18RjupuqGpx4QeAiMYKSq7QUTd3wEL=pkZ+BENpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKAwkKvfFn18RjupuqGpx4QeAiMYKSq7QUTd3wEL=pkZ+BENpQ@mail.gmail.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <17K55eUGfbB.A.h7D.r1lfiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2066
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Yn5Zf6lONff1AoOA@localhost.localdomain
Resent-Date: Fri, 13 May 2022 13:30:19 +0000 (UTC)

On Fri, May 13, 2022 at 02:56:18PM +1200, Matthew Ruffell wrote:
> Hi Josef,
> 
> Just a friendly ping, I am more than happy to test a patch, if you send it
> inline in the email, since the pastebin you used expired after 1 day, and I
> couldn't access it.
> 
> I came across and tested Yu Kuai's patches [1][2] which are for the same issue,
> and they indeed fix the hang. Thank you Yu.
> 
> [1] nbd: don't clear 'NBD_CMD_INFLIGHT' flag if request is not completed
> https://lists.debian.org/nbd/2022/04/msg00212.html
> 
> [2] nbd: fix io hung while disconnecting device
> https://lists.debian.org/nbd/2022/04/msg00207.html
> 
> I am also happy to test any patches to fix the I/O errors.
>

Sorry, you caught me on vacation before and I forgot to reply.  Here's part one
of the patch I wanted you to try which fixes the io hung part.  Thanks,

Josef

 
>From 0a6123520380cb84de8ccefcccc5f112bce5efb6 Mon Sep 17 00:00:00 2001
Message-Id: <0a6123520380cb84de8ccefcccc5f112bce5efb6.1652447517.git.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
Date: Sat, 23 Apr 2022 23:51:23 -0400
Subject: [PATCH] timeout thing

---
 drivers/block/nbd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 526389351784..ab365c0e9c04 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1314,7 +1314,10 @@ static void nbd_config_put(struct nbd_device *nbd)
 		kfree(nbd->config);
 		nbd->config = NULL;
 
-		nbd->tag_set.timeout = 0;
+		/* Reset our timeout to something sane. */
+		nbd->tag_set.timeout = 30 * HZ;
+		blk_queue_rq_timeout(nbd->disk->queue, 30 * HZ);
+
 		nbd->disk->queue->limits.discard_granularity = 0;
 		nbd->disk->queue->limits.discard_alignment = 0;
 		blk_queue_max_discard_sectors(nbd->disk->queue, 0);
-- 
2.26.3

