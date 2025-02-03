Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A190AA25EA3
	for <lists+nbd@lfdr.de>; Mon,  3 Feb 2025 16:27:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 64BB420735; Mon,  3 Feb 2025 15:27:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb  3 15:27:12 2025
Old-Return-Path: <groeck7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FOURLA,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D0F60206EA
	for <lists-other-nbd@bendel.debian.org>; Mon,  3 Feb 2025 15:09:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.499 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
	FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qnh8ru7P0yz5 for <lists-other-nbd@bendel.debian.org>;
	Mon,  3 Feb 2025 15:09:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id EC54E2067F
	for <nbd@other.debian.org>; Mon,  3 Feb 2025 15:09:08 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2166651f752so89327115ad.3
        for <nbd@other.debian.org>; Mon, 03 Feb 2025 07:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738595345; x=1739200145; darn=other.debian.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Liydz60cmndYD4qns14/Qbs4OC2qocuyXIy5gGvyjyg=;
        b=GSfQnCMbRdJTRNu6Z0ocfMtPPo/a0Nyd+IOEhj9t7SJplqdYmmHOYoW7L1HWUCziMa
         bgWMcYdWZA/yEuu79ICG6P+d1Jo0a7GlHsozso9Qkrq6n8wAvQlMJUVvWIfrpk6t3mUj
         PHPpNIl3pbhfE+MJmPSiq3WJklJzViDgM/igbLkdU0MP48HbBZzyfL3rv5T8+03rTOvo
         X6z8qXF2rWpL0Qca8uENqLuswKvPv6LabLo5JgK1IJ0bV5b/8xOTUsCC1PIY4UoQS5T4
         kLHyy7nf9HEtRfXOcr+Oe76M4owQ76mwIdunKPaPtD2r/f3ni/qlNEwl+0ngYZQ8z8zJ
         1d2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738595345; x=1739200145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Liydz60cmndYD4qns14/Qbs4OC2qocuyXIy5gGvyjyg=;
        b=acg0b+5+58R0Hyfmqy+mYwbsMMVbqNMYRq/jCm1SfQyPr7wm/IFRASG9lrd/SqA22z
         85064laGEjRb3Vnb8ZcvWEBycfiw4beYr+nFkX+YPtpdtwR3WoK8+oMME/yyQ8g5HOEe
         plFU1LpduzRwwP37kx5RP/nNkanf8P4Oq0O1FQHDPCjerOPPVaxkymR2penD8sCsyfCk
         4FUhX54IDMBRKtHbX2oGHpcDssryY8P1N6pNI/5vGbHluyIUsoBiP6xaNXEGygSjhDKo
         NsyWQpkj3eV9hJoI/AecXE3vku2za6rC1Qm3ojFC0OTU4/EWj7P/FpZpmJ0Vpy9oOqcO
         dXEg==
X-Forwarded-Encrypted: i=1; AJvYcCVB+BXRBceWj3TZanVVZLkeFfJt4cOoSOuuzd77OQBvXF6Gq93YLcc9QGEblh8uR3Uq2dE=@other.debian.org
X-Gm-Message-State: AOJu0YxsBW/EYJ94JxLBJ5QmsqEE4UlK8dzEZuwyVdooHAXQno+rXugE
	PQSETPCkNQFg9BQE3QQzrpzg4SvbTZHLBJ92PzdpWJBqmr2CGJAX
X-Gm-Gg: ASbGnctmuLuGKHirM3BVpHcRV72OjtoGzlVMwmXVLIEsqjN8H4+Zf7vrrgW1Z09lDqx
	le2Aw3NpCXAYxDnoIIw1NpQYuEiEjzpXWz3mqfo4EITBVI7/UE2fBqp3J5xYACb+4o5yA2dABsI
	02cpDPSvEaQrpUPeODnQ0VMUEIWxcxYcyfJm21wse0ULa2PxCiZbCxzAJ6eEHfKS4qRd2FilIqO
	cDnu3Hwq8k3ElH5RVtxvaA9TltDwHiYMAidCFSCwe3M56rpnVtLSXCr7ftTQBU1gOszAemc8aHP
	hlfpr4vcukdWxY75pfJCgoY5UL9z
X-Google-Smtp-Source: AGHT+IFUAkyxrkJaDrPwYodDQvzxDDTUk4r3atYHiHtcVu1uJFXauC2E5w6/RR2ly7RfMe7ktQE7aA==
X-Received: by 2002:a17:903:188:b0:21d:dfae:300c with SMTP id d9443c01a7336-21ddfae34camr280680665ad.3.1738595344940;
        Mon, 03 Feb 2025 07:09:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de4a91af6sm76095175ad.17.2025.02.03.07.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:09:04 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 3 Feb 2025 07:09:02 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	ceph-devel@vger.kernel.org, virtualization@lists.linux.dev,
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH] block: force noio scope in blk_mq_freeze_queue
Message-ID: <2273ad20-ed56-429c-a6ef-ffdb3196782b@roeck-us.net>
References: <20250131120352.1315351-1-hch@lst.de>
 <20250131120352.1315351-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131120352.1315351-2-hch@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_pDTlyZ1NxE.A.9aHP.QBOonB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3365
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2273ad20-ed56-429c-a6ef-ffdb3196782b@roeck-us.net
Resent-Date: Mon,  3 Feb 2025 15:27:12 +0000 (UTC)

On Fri, Jan 31, 2025 at 01:03:47PM +0100, Christoph Hellwig wrote:
> When block drivers or the core block code perform allocations with a
> frozen queue, this could try to recurse into the block device to
> reclaim memory and deadlock.  Thus all allocations done by a process
> that froze a queue need to be done without __GFP_IO and __GFP_FS.
> Instead of tying to track all of them down, force a noio scope as
> part of freezing the queue.
> 
> Note that nvme is a bit of a mess here due to the non-owner freezes,
> and they will be addressed separately.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

All sparc64 builds fail with this patch in the tree.

drivers/block/sunvdc.c: In function 'vdc_queue_drain':
drivers/block/sunvdc.c:1130:9: error: too many arguments to function 'blk_mq_unquiesce_queue'
 1130 |         blk_mq_unquiesce_queue(q, memflags);
      |         ^~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/block/sunvdc.c:10:
include/linux/blk-mq.h:895:6: note: declared here
  895 | void blk_mq_unquiesce_queue(struct request_queue *q);
      |      ^~~~~~~~~~~~~~~~~~~~~~
drivers/block/sunvdc.c:1131:9: error: too few arguments to function 'blk_mq_unfreeze_queue'
 1131 |         blk_mq_unfreeze_queue(q);
      |         ^~~~~~~~~~~~~~~~~~~~~
include/linux/blk-mq.h:914:1: note: declared here
  914 | blk_mq_unfreeze_queue(struct request_queue *q, unsigned int memflags)

Bisect log attached for reference.

Guenter

---
# bad: [8d0efe18f567040a251aef1e00ea39bd3776f5e1] Merge branch 'fixes-v6.14' into testing
# good: [69e858e0b8b2ea07759e995aa383e8780d9d140c] Merge tag 'uml-for-linus-6.14-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux
git bisect start 'HEAD' '69e858e0b8b2'
# bad: [1b5f3c51fbb8042efb314484b47b2092cdd40bf6] Merge tag 'riscv-for-linus-6.14-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
git bisect bad 1b5f3c51fbb8042efb314484b47b2092cdd40bf6
# bad: [9755ffd989aa04c298d265c27625806595875895] Merge tag 'block-6.14-20250131' of git://git.kernel.dk/linux
git bisect bad 9755ffd989aa04c298d265c27625806595875895
# good: [626d1a1e99583f846e44d6eefdc9d1c8b82c372d] Merge tag 'ceph-for-6.14-rc1' of https://github.com/ceph/ceph-client
git bisect good 626d1a1e99583f846e44d6eefdc9d1c8b82c372d
# good: [8c8492ca64e79c6e0f433e8c9d2bcbd039ef83d0] io_uring/net: don't retry connect operation on EPOLLERR
git bisect good 8c8492ca64e79c6e0f433e8c9d2bcbd039ef83d0
# good: [95d7e8226106e3445b0d877015f4192c47d23637] Merge tag 'ata-6.14-rc1-part2' of git://git.kernel.org/pub/scm/linux/kernel/git/libata/linux
git bisect good 95d7e8226106e3445b0d877015f4192c47d23637
# good: [5aa21b0495df1fac6d39f45011c1572bb431c44c] loop: don't clear LO_FLAGS_PARTSCAN on LOOP_SET_STATUS{,64}
git bisect good 5aa21b0495df1fac6d39f45011c1572bb431c44c
# good: [14ef49657ff3b7156952b2eadcf2e5bafd735795] block: fix nr_hw_queue update racing with disk addition/removal
git bisect good 14ef49657ff3b7156952b2eadcf2e5bafd735795
# bad: [1e1a9cecfab3f22ebef0a976f849c87be8d03c1c] block: force noio scope in blk_mq_freeze_queue
git bisect bad 1e1a9cecfab3f22ebef0a976f849c87be8d03c1c
# first bad commit: [1e1a9cecfab3f22ebef0a976f849c87be8d03c1c] block: force noio scope in blk_mq_freeze_queue

