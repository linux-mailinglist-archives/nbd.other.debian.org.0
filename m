Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 826F185BD58
	for <lists+nbd@lfdr.de>; Tue, 20 Feb 2024 14:39:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7239420DD3; Tue, 20 Feb 2024 13:39:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb 20 13:39:12 2024
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 938F420EA3
	for <lists-other-nbd@bendel.debian.org>; Tue, 20 Feb 2024 13:22:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.01 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id XwO816ksWwxl for <lists-other-nbd@bendel.debian.org>;
	Tue, 20 Feb 2024 13:22:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pl1-x636.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 707C420BB6
	for <nbd@other.debian.org>; Tue, 20 Feb 2024 13:22:07 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1db8f32cae5so7457255ad.1
        for <nbd@other.debian.org>; Tue, 20 Feb 2024 05:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1708435323; x=1709040123; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARy7Q4Eliz2JX6LXysl5nmstDWlOnwvyUH57xirN7sY=;
        b=UYlq7nuL67ViR95U7tgkjZ0xxPwbNKxGb4zIhZ2EkQVU8uHHkCkOoqcb+QZpd0TGCb
         li4rNSkFW54eQAW4vobmEUGsnZtiRKoDh2gOb0x17Y48A43h1hk6uLO4z7h8r706AM0+
         1X47tTjFNiwuLQiiSZWtWG7429wvV2gJ9OzfVSpYtWJ9UcSXdgFadfqfrtgnuX4oaZDB
         sGyHLqM2fR+gwPs+yNhdTRyYvBZ8lF/MNBnliNW4zJlH81Z8HwhyuH4fgxNK9ftnKFkK
         bakyvqz0ofHzUw5NUg9ytk4Sg2tu2fC+0pZR+bHs6iqT9/5yXKqHoC+1TzsDq8nKUeRS
         XEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708435323; x=1709040123;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARy7Q4Eliz2JX6LXysl5nmstDWlOnwvyUH57xirN7sY=;
        b=nveie9oaCmOHTTDBnp1491Q8oyfqwIJftxvSUHA3nFuLT3pdJ6ql/yDDrj31lawC+6
         kzSpFYm/lm0DwOmla2IAWC0SuF6kSIcyP5cjglyjQTlNp5t++nsq0aXWfiyQC+MnzpJR
         Lo+QIZGxVLqXB7tlMjjRnLR6RcpTggK9gZOY7S+WHsfCCWs5P6ejyIIEi2f4e2IBiSAu
         b/9g9N0TXRFlNm8EgdnNi689oThrp6/4+DFi/oP2a33S8Zqw2P3tmmCAFSPvZwu04dYd
         p0/HBoQjSt38c+rtbQ6HYVhJ8xJP2SsCRZsIH9LSjlfl3u8s8wqlLOot0J9ygg7w945C
         htfg==
X-Forwarded-Encrypted: i=1; AJvYcCXyaLpgPNylBnVXUYZ9L+/bLhiBBfZUrV92zsOLQ+N4c80/s5bEC13nNXGDY2wnOwzE6bGpJa6mbDucfKNXAnsewpYYgg==
X-Gm-Message-State: AOJu0YwRibbHIh1grFMKeq0JIEYF4H2FwUX+D0K8AY1OurJs7EFLPaff
	LiWOGaXVzwclpGDgxzP9vEIKRN1u2UPsG9pOnJCEIiJUvYl56/XeTm9Akrzf97k=
X-Google-Smtp-Source: AGHT+IFDzsxf+QvkIBQ6Yn25tgbgykQJpLVIKvsCINFaIpP2CqGk59RWuZcUGoZYhYkVR41rTlrzkA==
X-Received: by 2002:a17:902:b113:b0:1dc:e32:d0b7 with SMTP id q19-20020a170902b11300b001dc0e32d0b7mr3120302plr.0.1708435323550;
        Tue, 20 Feb 2024 05:22:03 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id iw11-20020a170903044b00b001db5e807cd2sm6188911plb.82.2024.02.20.05.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 05:22:02 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>, 
 Josef Bacik <josef@toxicpanda.com>, Geoff Levand <geoff@infradead.org>, 
 Ilya Dryomov <idryomov@gmail.com>, 
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>, 
 Ming Lei <ming.lei@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>, 
 Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Vineeth Vijayan <vneethv@linux.ibm.com>, linux-block@vger.kernel.org, 
 nbd@other.debian.org, ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org
In-Reply-To: <20240215070300.2200308-1-hch@lst.de>
References: <20240215070300.2200308-1-hch@lst.de>
Subject: Re: pass queue_limits to blk_mq_alloc_disk for simple drivers
Message-Id: <170843532172.4095460.11560055671499890721.b4-ty@kernel.dk>
Date: Tue, 20 Feb 2024 06:22:01 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.5-dev-2aabd
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <dd5NdXj51eI.A.gUE.AuK1lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2754
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/170843532172.4095460.11560055671499890721.b4-ty@kernel.dk
Resent-Date: Tue, 20 Feb 2024 13:39:12 +0000 (UTC)


On Thu, 15 Feb 2024 08:02:43 +0100, Christoph Hellwig wrote:
> this series converts all "simple" blk-mq drivers that don't have complex
> internal layering or other oddities to pass the queue_limits to
> blk_mq_alloc_disk.  None of these drivers updates the limits at runtime.
> 
> Diffstat:
>  arch/um/drivers/ubd_kern.c          |    8 +-
>  drivers/block/aoe/aoeblk.c          |   15 ++---
>  drivers/block/floppy.c              |    6 +-
>  drivers/block/mtip32xx/mtip32xx.c   |   13 ++--
>  drivers/block/nbd.c                 |   13 ++--
>  drivers/block/ps3disk.c             |   17 +++---
>  drivers/block/rbd.c                 |   29 +++++-----
>  drivers/block/rnbd/rnbd-clt.c       |   64 +++++++++--------------
>  drivers/block/sunvdc.c              |   18 +++---
>  drivers/block/ublk_drv.c            |   90 +++++++++++++++------------------
>  drivers/cdrom/gdrom.c               |   14 ++---
>  drivers/memstick/core/ms_block.c    |   14 ++---
>  drivers/memstick/core/mspro_block.c |   15 ++---
>  drivers/mmc/core/queue.c            |   97 +++++++++++++++++++-----------------
>  drivers/mtd/mtd_blkdevs.c           |   12 ++--
>  drivers/mtd/ubi/block.c             |    6 +-
>  drivers/s390/block/scm_blk.c        |   17 +++---
>  17 files changed, 222 insertions(+), 226 deletions(-)
> 
> [...]

Applied, thanks!

[01/17] ubd: pass queue_limits to blk_mq_alloc_disk
        commit: 5d6789ce33a97718564d0b8d2ea34e03d650e624
[02/17] aoe: pass queue_limits to blk_mq_alloc_disk
        commit: 9999200f583107f7e244e50935d480433b7d8a3b
[03/17] floppy: pass queue_limits to blk_mq_alloc_disk
        commit: 48bc8c7ba6fb39a4325b07f3abe8fe5a77361c7e
[04/17] mtip: pass queue_limits to blk_mq_alloc_disk
        commit: 68c3135fb5fbd85c7b2ca851184f30f54433a9d3
[05/17] nbd: pass queue_limits to blk_mq_alloc_disk
        commit: 9a0d4970288de29191fa45bf0ab4d8398bfa3a01
[06/17] ps3disk: pass queue_limits to blk_mq_alloc_disk
        commit: a7f18b74dbe171625afc2751942a92f71a4dd4ba
[07/17] rbd: pass queue_limits to blk_mq_alloc_disk
        commit: 24f30b770c0f450346f1c99120427b2e938cdfd0
[08/17] rnbd-clt: pass queue_limits to blk_mq_alloc_disk
        commit: e6ed9892f10d7195d621ede1cedc41421f1ca607
[09/17] sunvdc: pass queue_limits to blk_mq_alloc_disk
        commit: d0fa9a8b0af71b69cf3dec10feaebe19d55a72cf
[10/17] gdrom: pass queue_limits to blk_mq_alloc_disk
        commit: a339cf2bbfbe6e16ead79276d608912d36065884
[11/17] ms_block: pass queue_limits to blk_mq_alloc_disk
        commit: f93b43ae3feafedc5777099ca1a0e05352b92671
[12/17] mspro_block: pass queue_limits to blk_mq_alloc_disk
        commit: 9f633ecd43046659e3345bc4a4404e1d2ba67463
[13/17] mtd_blkdevs: pass queue_limits to blk_mq_alloc_disk
        commit: 3ec44e52bfce60f6da65165bc86eb382462d173d
[14/17] ubiblock: pass queue_limits to blk_mq_alloc_disk
        commit: 21b700c0812b6aa8f794c36b971772b2b08dab9a
[15/17] scm_blk: pass queue_limits to blk_mq_alloc_disk
        commit: 066be10aef5a7ddd8ad537db7a5145c6d79d4ea2
[16/17] ublk: pass queue_limits to blk_mq_alloc_disk
        commit: 494ea040bcb5f4cc78c37dc53c7915752c24f739
[17/17] mmc: pass queue_limits to blk_mq_alloc_disk
        commit: 616f8766179277324393f7b77e07f14cb3503825

Best regards,
-- 
Jens Axboe



