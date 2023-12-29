Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DA78B82006E
	for <lists+nbd@lfdr.de>; Fri, 29 Dec 2023 17:00:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BE4ED207D4; Fri, 29 Dec 2023 16:00:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec 29 16:00:13 2023
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5CECA207E9
	for <lists-other-nbd@bendel.debian.org>; Fri, 29 Dec 2023 15:44:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.01 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id oXnlbtJgp5ii for <lists-other-nbd@bendel.debian.org>;
	Fri, 29 Dec 2023 15:44:41 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd32.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E0B18207B9
	for <nbd@other.debian.org>; Fri, 29 Dec 2023 15:44:38 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7bb06f56fe9so36726439f.0
        for <nbd@other.debian.org>; Fri, 29 Dec 2023 07:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1703864675; x=1704469475; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQjXtcB6Oq3k74ay/cs5vR/HD/xg6rvyoXPDzdeumLU=;
        b=ZYvKYlNpbaaCvT96fSJgyy5yd+lWPcsFVcNvPa+fE+hzGkfMsuSp19zrdV9XM6QcL6
         bha4wb9pZ2CGuzgk63fz2KXgOL2kru2JkwPeu5uueH1BSqNJ4KJXzHuEMdeD77k2pPVT
         KsKsp9yA8rCyyUDmJd9tDTYRCNw6C2zxGv5s5GT6OcgVy/Tl58vWdlPlvArOvjJmkoJQ
         HhoyTKDYJfgZNTbaO4H4vK4YICOP7nHWvCIaFfN8VKMEG1RHcR0Cf/BIh7Dx+RSYutbT
         law41yq/FoUMkzv4WQBmJqhvqDgA8gHz5PAY5mOkyHT8BXvfu53Z+2nVYLjAS+gaG2BH
         QClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864675; x=1704469475;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQjXtcB6Oq3k74ay/cs5vR/HD/xg6rvyoXPDzdeumLU=;
        b=aEy+fZDfR5/lwdkGQG4X9k+kU95hjt5iroi+R5e8L6Olg3IKxufUlJciXCnZDU1lLF
         WytafQuW8XV71MN6H0Rj74xO4NrgbSqGa5GEFUNjnYw3ZNyG2qZiwIju6lAzn8vu31Q0
         ZzyYHKt22KCLuC6T5Hq6+Vq6mQNPiQBKQFhmntchzHoz4/4kCoK5AdOWsytLlsy6KzsN
         QcOw2LYhreAor90crLEIBhFk6w3zjWGdsnJbsIkSsjMnTFxzHeIgDmnhian27EvrVdAA
         8PSrW7H3U4PCLmuKiGfWRObb4h7bu0WeiYQM3cUPS92tWqHwW7OPnc9xum0SGdt+OJma
         GPrQ==
X-Gm-Message-State: AOJu0YwKYEw5NtPMivXCiPRdaGXsc5jd6rMoxtEPm6Iq8bq1XCuWjDD0
	98CKqYpggUiFFKVRL+c0MbLwdgxWLqpJbw==
X-Google-Smtp-Source: AGHT+IHAm0ro/JYGZ86leiXTCWBYht33pHhUQxq1wRsVw6jMpELsHFapyFrv/5iAU4fxQiP4l1Rgag==
X-Received: by 2002:a05:6e02:1d13:b0:35f:da7a:3797 with SMTP id i19-20020a056e021d1300b0035fda7a3797mr22028997ila.1.1703864675229;
        Fri, 29 Dec 2023 07:44:35 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id z11-20020a634c0b000000b005ce6b79ab6asm1526889pga.82.2023.12.29.07.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:44:34 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Josef Bacik <josef@toxicpanda.com>, Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, Coly Li <colyli@suse.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-um@lists.infradead.org, 
 linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <20231228075545.362768-1-hch@lst.de>
References: <20231228075545.362768-1-hch@lst.de>
Subject: Re: provide a sane discard_granularity default
Message-Id: <170386467352.1470147.12182761923584971917.b4-ty@kernel.dk>
Date: Fri, 29 Dec 2023 08:44:33 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-7edf1
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <foq6qKsuK-I.A.XoB.N0ujlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2699
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/170386467352.1470147.12182761923584971917.b4-ty@kernel.dk
Resent-Date: Fri, 29 Dec 2023 16:00:13 +0000 (UTC)


On Thu, 28 Dec 2023 07:55:36 +0000, Christoph Hellwig wrote:
> this series defaults the discard_granularity to the sector size as
> that is a very logical default for devices that have no further
> restrictions.  This removes the need for trivial drivers to set
> a discard granularity and cleans up the interface.
> 
> Diffstat:
>  arch/um/drivers/ubd_kern.c    |    1 -
>  block/blk-merge.c             |    6 +-----
>  block/blk-settings.c          |    5 ++++-
>  drivers/block/nbd.c           |    6 +-----
>  drivers/block/null_blk/main.c |    1 -
>  drivers/block/zram/zram_drv.c |    1 -
>  drivers/md/bcache/super.c     |    1 -
>  drivers/mtd/mtd_blkdevs.c     |    4 +---
>  8 files changed, 7 insertions(+), 18 deletions(-)
> 
> [...]

Applied, thanks!

[1/9] block: remove two comments in bio_split_discard
      commit: 928a5dd3a849dc6d8298835bdcb25c360d41bccb
[2/9] bcache: discard_granularity should not be smaller than a sector
      commit: 5e7169e7f7c0989304dbe8467a1d703d614c64db
[3/9] block: default the discard granularity to sector size
      commit: 3c407dc723bbf914f3744b0c2bb82265b411a50c
[4/9] ubd: use the default discard granularity
      commit: 599d9d4eab7c3d5dc6f1e0f8f052fee9eaa54e50
[5/9] nbd: use the default discard granularity
      commit: 1e2ab2e8a98c9e0629b5b8bff8ee6f2cb3e8daac
[6/9] null_blk: use the default discard granularity
      commit: 724325477f8a48ce1defc2a49998bbc19fe85c88
[7/9] zram: use the default discard granularity
      commit: 3753039def5d0d1c43af847b507ba9b782db183a
[8/9] bcache: use the default discard granularity
      commit: 105c1a5f6ccef7f52f9e76664407ef96218272eb
[9/9] mtd_blkdevs: use the default discard granularity
      commit: 31e4fac930814f2f92eb6ebac9c4d4e3b09f7aaf

Best regards,
-- 
Jens Axboe



