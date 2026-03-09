Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aD21Hb3rrmlRKAIAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 09 Mar 2026 16:48:13 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0289F23C032
	for <lists+nbd@lfdr.de>; Mon, 09 Mar 2026 16:48:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C6D3020457; Mon,  9 Mar 2026 15:48:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Mar  9 15:48:12 2026
Old-Return-Path: <csander@purestorage.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FVGT_m_MULTI_ODD,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3516820458
	for <lists-other-nbd@bendel.debian.org>; Mon,  9 Mar 2026 15:31:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.92 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id A-8WA7CU3qFi for <lists-other-nbd@bendel.debian.org>;
	Mon,  9 Mar 2026 15:31:46 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .purestorage. - helo: .mail-ot1-x336.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 96A9620452
	for <nbd@other.debian.org>; Mon,  9 Mar 2026 15:31:43 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7d738fc8934so86548a34.0
        for <nbd@other.debian.org>; Mon, 09 Mar 2026 08:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773070300; cv=none;
        d=google.com; s=arc-20240605;
        b=efbDURQzXgmld3rv3MukkeM4v1leme5AgXEAhIJo0lgWkokEQpP9q6Lvb3702XSA+G
         ZTWwhLHD80s/eJKqE32FtbYGnMUeAsvwMH06WUQSFvHh+bC/N3qi5jEgJi/QVTOaRwbT
         ojRdxrI5c39vRAE16Cx3OeL8rt0V/mg87hnSRKPInStuYs13FHOZ2gouWFxQHV+Re5o+
         CkM5hEe7A0LvoYKNUmadchQiiP7M7rdnqhN2te0m4jGNE7+qbi8dSR9DIVa1rnUKx+Ig
         UkHsTDdB6pCQhp8wVldYeZJ4l4Gk8peQJBqD3NlU1C8XOO+QXjooVbZeZHbcA/31YSos
         R3Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6+r9RgPpLrGiXVfQx056rbYEWCZcszUA9kQtErD1KEc=;
        fh=qP+4aBTUxzgpU+O05zxnq5y9uA4GgBU1cXF91u5gEDY=;
        b=eMiqTySb82NVxH1fpdLhEeLtRj3OeRA+mHywysMcos5XZB9VJvj03fKqZtwht049pu
         3jSTiM1GC+xL9wHu09YdDiPQfZqM3a3JU6JDTGMCfCbTh596rXgEZSQdilsIyL5LT1Xz
         SaKX3H0uhAy+7g1Wi3huK1qB6q0cQ2TjPr7XG9UjZl6pN+yaptoGM46LVoTSl6NxjaKA
         k3y3C4TUSSK48ydBv0hAiiLeaa1fyHhaXXxx6FGpkorFAme3MFHAWrVNhjYh/4UPKlbm
         CMLA1cRmn+3h1nZWLSyf2NU9eEoYQZrU8CFR8aFoSzwO5o8UWa78IgbaoVcffBN1v3UJ
         pq8g==;
        darn=other.debian.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1773070300; x=1773675100; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+r9RgPpLrGiXVfQx056rbYEWCZcszUA9kQtErD1KEc=;
        b=AX42MYMuyC4S7ij0NKuYOVT/C86hAjT/+STtRKs/wutd/NTn915Rvjs+jc3ndHUSiT
         IMnv9fNpjFPihZP+YBCVjmdPyE+I1Cu8qGCkqyIWGuis06/yqgPHacvpM47BexaugdLK
         Qy5l9Vvg2PaE/Ci4G2P0ygZArP/phqOUd9jdjc22NgDSqz3nnKLFEPI7F0fDlvSeylap
         JUjewTawEf1Dg8UMqdvB1JZQj9NH7i2wvuKolxfnZ5mdhU2HuBxt01qxcn7QwUOAAC9U
         fK9QPFRIMz+hmpH2sAZ+N7so075sBR3htD4O55sCtt+Dms5b+30D8t0At6Xv2ho/wovx
         Fq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773070300; x=1773675100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6+r9RgPpLrGiXVfQx056rbYEWCZcszUA9kQtErD1KEc=;
        b=Oqdf5d/RdxxEYOWtRe4hIt8T/h+8vWBGsdrCOpzev2bYdZc8XIXCfN3pXQsLaNqEVD
         oA9P9ZdLVqMJDJ6e2ZHkkaBdvL1rx9/Pt+NvmrXjYmOtgykpuACl4OMK20+Div/JZoOO
         hZqv1poDBp8fh6qfPqoBME2hq3GdStn+s9xUsE781BmiXK+0B2LHxvtGpcb3WdSHkUmB
         DztWbliXPiRh2LJk6S1i6q2dtzMX+6p7DgLzlmENKWD2ZJM3fQNfQC+T0N+zmR554WAW
         A047ObKzJNZxb/UE2pELmn+8/ofpF3btK2X1nS8+2YxzNHRh2fkZDmeyjRMJ+8kp2xVH
         P6Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXWeoMWg8OBkNkSKmGCOGvbsd/xmLi4vVNowwBxgTMsCrkevaHg1uQs3iTA1gCLTPrGRso=@other.debian.org
X-Gm-Message-State: AOJu0YzL834FGbOk6rMA+6NvFO4UwDPHlj6mIZT+BZeizRGoIzbiit0W
	6v626bE+m9Kro+k/oRjfp83rc2LwUlb2lYDPBuOHMdrBf9fOjbBTupbELAgVZYnq0aPMQncJoW9
	s/b81OQvDrvdULykdUNOQsV+SCi0n11FQJJzt+QS5lw==
X-Gm-Gg: ATEYQzyK9TzxLMHLAIMOUIq+AMMQ9urpQed7pTATvEB7LhgBnbXkkY3NPI4TLK5uwAu
	2ZHSRf/Lv6FfDBJgQ8QE6IfRh3dYqUhW+ukVvO3uKbmi1FSFQ5DwdndRUk5peibXCoUQmMiOsZg
	SuX7jJhuXSqDU4KmI9FwGdB9JyVwW2ibDuy9kfOl3UVabp5W0Z25L0ArcKzt7q8QWM1U4r5Avmq
	lc487Bg8amVMYo9Urk1BrSPdizqKPFMfIzDiV+OmHIlUuub/ndElUS6n8SCVnX3G8l3py7tjPj/
	K2ZyePE=
X-Received: by 2002:a05:6830:3495:b0:7d7:40e7:9536 with SMTP id
 46e09a7af769-7d740e79670mr3723400a34.0.1773070299522; Mon, 09 Mar 2026
 08:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260309062840.2937858-2-iam@sung-woo.kim>
In-Reply-To: <20260309062840.2937858-2-iam@sung-woo.kim>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Mon, 9 Mar 2026 08:31:27 -0700
X-Gm-Features: AaiRm50lVynE24y1iGtUrsPblHqAJTvTl9abhpAYnSu85cy3kb3SYItst0KXwYA
Message-ID: <CADUfDZorSQCVtQyfjBuaziwG2Jo28yZiiqLKbp9PkFFw-9VgfQ@mail.gmail.com>
Subject: Re: [PATCH] blk-mq: nvme: Fix general protection fault in nvme_setup_descriptor_pools()
To: Sungwoo Kim <iam@sung-woo.kim>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev, 
	Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Chao Shi <cshi008@fiu.edu>, 
	Weidong Zhu <weizhu@fiu.edu>, Dave Tian <daveti@purdue.edu>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4eg5_SQ6G4O.A.ILgO.8uurpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3512
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CADUfDZorSQCVtQyfjBuaziwG2Jo28yZiiqLKbp9PkFFw-9VgfQ@mail.gmail.com
Resent-Date: Mon,  9 Mar 2026 15:48:12 +0000 (UTC)
X-Rspamd-Queue-Id: 0289F23C032
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.51 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	R_DKIM_ALLOW(-0.20)[purestorage.com:s=google2022];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:iam@sung-woo.kim,m:axboe@kernel.dk,m:josef@toxicpanda.com,m:agk@redhat.com,m:snitzer@kernel.org,m:mpatocka@redhat.com,m:dm-devel@lists.linux.dev,m:ulf.hansson@linaro.org,m:richard@nod.at,m:miquel.raynal@bootlin.com,m:vigneshr@ti.com,m:marcan@marcan.st,m:sven@svenpeter.dev,m:alyssa@rosenzweig.io,m:kbusch@kernel.org,m:hch@lst.de,m:sagi@grimberg.me,m:james.smart@broadcom.com,m:kch@nvidia.com,m:jejb@linux.ibm.com,m:martin.petersen@oracle.com,m:cshi008@fiu.edu,m:weizhu@fiu.edu,m:daveti@purdue.edu,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nbd@other.debian.org,m:linux-mmc@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:asahi@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-nvme@lists.infradead.org,m:linux-scsi@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[csander@purestorage.com,bounce-nbd=lists@other.debian.org];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	DKIM_TRACE(0.00)[purestorage.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[csander@purestorage.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_DNSFAIL(0.00)[purestorage.com : server fail];
	NEURAL_HAM(-0.00)[-0.963];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	TAGGED_RCPT(0.00)[nbd];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bendel.debian.org:rdns,bendel.debian.org:helo,mail.gmail.com:mid,purestorage.com:dkim,purdue.edu:email,sung-woo.kim:email,qemu.org:url]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 11:30=E2=80=AFPM Sungwoo Kim <iam@sung-woo.kim> wrot=
e:
>
> The numa_node can be < 0 since NUMA_NO_NODE =3D -1. However,
> struct blk_mq_hw_ctx{} defines numa_node as unsigned int. As a result,
> numa_node is set to UINT_MAX for NUMA_NO_NODE in blk_mq_alloc_hctx().

The node argument to blk_mq_alloc_hctx() comes from
blk_mq_alloc_and_init_hctx(), which is called by
blk_mq_alloc_and_init_hctx() with int node =3D blk_mq_get_hctx_node(set,
i). node =3D NUMA_NO_NODE would suggest that blk_mq_hw_queue_to_node()
doesn't find any CPU affinitized to the queue. Is that even possible?

>
> Later, nvme_setup_descriptor_pools() accesses
> descriptor_pools[numa_node]. Due to the above, it tries to access
> descriptor_pools[UINT_MAX]. The address is garbage but accessible
> because it is canonical and still within the slab memory range.
> Therefore, no page fault occurs, and KASAN cannot detect this since it
> is beyond the redzones.
>
> Subsequently, normal I/O calls dma_pool_alloc() with the garbage pool
> address. pool->next_block contains a wild pointer, causing a general
> protection fault (GPF).
>
> To fix this, this patch changes the type of numa_node to int and adds
> a check for NUMA_NO_NODE.
>
> Log:
>
> Oops: general protection fault, probably for non-canonical address 0xe980=
3b040854d02c: 0000 [#1] SMP KASAN PTI
> KASAN: maybe wild-memory-access in range [0x4c01f82042a68160-0x4c01f82042=
a68167][FEMU] Err: I/O cmd failed: opcode=3D0x2 status=3D0x4002
> CPU: 0 UID: 0 PID: 112363 Comm: systemd-udevd Not tainted 6.19.0-dirty #1=
0 PREEMPT(voluntary)
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-=
ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
> RIP: 0010:pool_block_pop mm/dmapool.c:187 [inline]
> RIP: 0010:dma_pool_alloc+0x110/0x990 mm/dmapool.c:417
> Code: 00 0f 85 a4 07 00 00 4c 8b 63 58 4d 85 e4 0f 84 12 01 00 00 e8 41 1=
d 93 ff 4c 89 e2 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 0f=
 85 a7 07 00 00 49 8b 04 24 48 8d 7b 68 48 89 fa 48
> RSP: 0018:ffffc90002b9efd0 EFLAGS: 00010003
> RAX: dffffc0000000000 RBX: ffff888005466800 RCX: ffffffff94faab7f
> RDX: 09803f040854d02c RSI: 6c9b26c9b26c9b27 RDI: ffff88800c725ea0
> RBP: ffffc90002b9f060 R08: 0000000000000001 R09: 0000000000000001
> R10: 0000000000000003 R11: 0000000000000000 R12: 4c01f82042a68164
> R13: ffff888005466800 R14: 0000000000000820 R15: ffff888007b29000
> FS:  00007f2abc4ff8c0(0000) GS:ffff8880d1ff7000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000056360eb89000 CR3: 000000000a480000 CR4: 00000000000006f0
> Call Trace:
>  <TASK>
>  nvme_pci_setup_data_prp drivers/nvme/host/pci.c:906 [inline]
>  nvme_map_data drivers/nvme/host/pci.c:1114 [inline]
>  nvme_prep_rq.part.0+0x17d3/0x3c90 drivers/nvme/host/pci.c:1243
>  nvme_prep_rq drivers/nvme/host/pci.c:1239 [inline]
>  nvme_prep_rq_batch drivers/nvme/host/pci.c:1321 [inline]
>  nvme_queue_rqs+0x37b/0x8a0 drivers/nvme/host/pci.c:1336
>  __blk_mq_flush_list block/blk-mq.c:2848 [inline]
>  __blk_mq_flush_list+0xaa/0xe0 block/blk-mq.c:2844
>  blk_mq_dispatch_queue_requests+0x4f5/0x990 block/blk-mq.c:2893
>  blk_mq_flush_plug_list+0x232/0x650 block/blk-mq.c:2981
>  __blk_flush_plug+0x2c3/0x510 block/blk-core.c:1225
>  blk_finish_plug block/blk-core.c:1252 [inline]
>  blk_finish_plug+0x64/0xc0 block/blk-core.c:1249
>  read_pages+0x6bd/0x9d0 mm/readahead.c:176
>  page_cache_ra_unbounded+0x659/0x950 mm/readahead.c:269
>  do_page_cache_ra mm/readahead.c:332 [inline]
>  force_page_cache_ra+0x282/0x3a0 mm/readahead.c:361
>  page_cache_sync_ra+0x201/0xbf0 mm/readahead.c:579
>  filemap_get_pages+0x3be/0x1990 mm/filemap.c:2690
>  filemap_read+0x3ea/0xdf0 mm/filemap.c:2800
>  blkdev_read_iter+0x1b8/0x520 block/fops.c:856
>  new_sync_read fs/read_write.c:491 [inline]
>  vfs_read+0x90f/0xd80 fs/read_write.c:572
>  ksys_read+0x14e/0x280 fs/read_write.c:715
>  __do_sys_read fs/read_write.c:724 [inline]
>  __se_sys_read fs/read_write.c:722 [inline]
>  __x64_sys_read+0x7b/0xc0 fs/read_write.c:722
>  x64_sys_call+0x17ec/0x21b0 arch/x86/include/generated/asm/syscalls_64.h:=
1
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x8b/0x1200 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x7f2abc7b204e
> Code: 0f 1f 40 00 48 8b 15 79 af 00 00 f7 d8 64 89 02 48 c7 c0 ff ff ff f=
f eb ba 0f 1f 00 64 8b 04 25 18 00 00 00 85 c0 75 14 0f 05 <48> 3d 00 f0 ff=
 ff 77 5a c3 66 0f 1f 84 00 00 00 00 00 48 83 ec 28
> RSP: 002b:00007fff07113cb8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> RAX: ffffffffffffffda RBX: 000056360eb6a528 RCX: 00007f2abc7b204e
> RDX: 0000000000040000 RSI: 000056360eb6a538 RDI: 000000000000000f
> RBP: 000056360e8d23d0 R08: 000056360eb6a510 R09: 00007f2abc79abe0
> R10: 0000000000040050 R11: 0000000000000246 R12: 000000003ff80000
> R13: 0000000000040000 R14: 000056360eb6a510 R15: 000056360e8d2420
>  </TASK>
> Modules linked in:
>
> Fixes: 320ae51feed5 ("blk-mq: new multi-queue block IO queueing mechanism=
")
> Fixes: d977506f8863 ("nvme-pci: make PRP list DMA pools per-NUMA-node")
> Acked-by: Chao Shi <cshi008@fiu.edu>
> Acked-by: Weidong Zhu <weizhu@fiu.edu>
> Acked-by: Dave Tian <daveti@purdue.edu>
> Signed-off-by: Sungwoo Kim <iam@sung-woo.kim>
> ---
>  block/bsg-lib.c                   |  2 +-
>  drivers/block/mtip32xx/mtip32xx.c |  2 +-
>  drivers/block/nbd.c               |  2 +-
>  drivers/md/dm-rq.c                |  2 +-
>  drivers/mmc/core/queue.c          |  2 +-
>  drivers/mtd/ubi/block.c           |  2 +-
>  drivers/nvme/host/apple.c         |  2 +-
>  drivers/nvme/host/fc.c            |  2 +-
>  drivers/nvme/host/pci.c           | 11 ++++++++---
>  drivers/nvme/host/rdma.c          |  2 +-
>  drivers/nvme/host/tcp.c           |  2 +-
>  drivers/nvme/target/loop.c        |  2 +-
>  drivers/scsi/scsi_lib.c           |  2 +-
>  include/linux/blk-mq.h            |  4 ++--
>  14 files changed, 22 insertions(+), 17 deletions(-)
>
> diff --git a/block/bsg-lib.c b/block/bsg-lib.c
> index 9ceb5d0832f5..e93b1018a346 100644
> --- a/block/bsg-lib.c
> +++ b/block/bsg-lib.c
> @@ -299,7 +299,7 @@ static blk_status_t bsg_queue_rq(struct blk_mq_hw_ctx=
 *hctx,
>
>  /* called right after the request is allocated for the request_queue */
>  static int bsg_init_rq(struct blk_mq_tag_set *set, struct request *req,
> -                      unsigned int hctx_idx, unsigned int numa_node)
> +                      unsigned int hctx_idx, int numa_node)
>  {
>         struct bsg_job *job =3D blk_mq_rq_to_pdu(req);
>
> diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/m=
tip32xx.c
> index 567192e371a8..8aedba9b5690 100644
> --- a/drivers/block/mtip32xx/mtip32xx.c
> +++ b/drivers/block/mtip32xx/mtip32xx.c
> @@ -3340,7 +3340,7 @@ static void mtip_free_cmd(struct blk_mq_tag_set *se=
t, struct request *rq,
>  }
>
>  static int mtip_init_cmd(struct blk_mq_tag_set *set, struct request *rq,
> -                        unsigned int hctx_idx, unsigned int numa_node)
> +                        unsigned int hctx_idx, int numa_node)
>  {
>         struct driver_data *dd =3D set->driver_data;
>         struct mtip_cmd *cmd =3D blk_mq_rq_to_pdu(rq);
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index f6c33b21f69e..e1fac1c0c4cd 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1888,7 +1888,7 @@ static void nbd_dbg_close(void)
>  #endif
>
>  static int nbd_init_request(struct blk_mq_tag_set *set, struct request *=
rq,
> -                           unsigned int hctx_idx, unsigned int numa_node=
)
> +                           unsigned int hctx_idx, int numa_node)
>  {
>         struct nbd_cmd *cmd =3D blk_mq_rq_to_pdu(rq);
>         cmd->nbd =3D set->driver_data;
> diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
> index a6ca92049c10..b687a209256b 100644
> --- a/drivers/md/dm-rq.c
> +++ b/drivers/md/dm-rq.c
> @@ -455,7 +455,7 @@ static void dm_start_request(struct mapped_device *md=
, struct request *orig)
>  }
>
>  static int dm_mq_init_request(struct blk_mq_tag_set *set, struct request=
 *rq,
> -                             unsigned int hctx_idx, unsigned int numa_no=
de)
> +                             unsigned int hctx_idx, int numa_node)
>  {
>         struct mapped_device *md =3D set->driver_data;
>         struct dm_rq_target_io *tio =3D blk_mq_rq_to_pdu(rq);
> diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
> index 284856c8f655..06cb29190a88 100644
> --- a/drivers/mmc/core/queue.c
> +++ b/drivers/mmc/core/queue.c
> @@ -203,7 +203,7 @@ static unsigned short mmc_get_max_segments(struct mmc=
_host *host)
>  }
>
>  static int mmc_mq_init_request(struct blk_mq_tag_set *set, struct reques=
t *req,
> -                              unsigned int hctx_idx, unsigned int numa_n=
ode)
> +                              unsigned int hctx_idx, int numa_node)
>  {
>         struct mmc_queue_req *mq_rq =3D req_to_mmc_queue_req(req);
>         struct mmc_queue *mq =3D set->driver_data;
> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> index b53fd147fa65..1c0bd2b36637 100644
> --- a/drivers/mtd/ubi/block.c
> +++ b/drivers/mtd/ubi/block.c
> @@ -312,7 +312,7 @@ static blk_status_t ubiblock_queue_rq(struct blk_mq_h=
w_ctx *hctx,
>
>  static int ubiblock_init_request(struct blk_mq_tag_set *set,
>                 struct request *req, unsigned int hctx_idx,
> -               unsigned int numa_node)
> +               int numa_node)
>  {
>         struct ubiblock_pdu *pdu =3D blk_mq_rq_to_pdu(req);
>
> diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
> index ed61b97fde59..50ff5e9a168d 100644
> --- a/drivers/nvme/host/apple.c
> +++ b/drivers/nvme/host/apple.c
> @@ -819,7 +819,7 @@ static int apple_nvme_init_hctx(struct blk_mq_hw_ctx =
*hctx, void *data,
>
>  static int apple_nvme_init_request(struct blk_mq_tag_set *set,
>                                    struct request *req, unsigned int hctx=
_idx,
> -                                  unsigned int numa_node)
> +                                  int numa_node)
>  {
>         struct apple_nvme_queue *q =3D set->driver_data;
>         struct apple_nvme *anv =3D queue_to_apple_nvme(q);
> diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
> index 6948de3f438a..64d0c5d7613a 100644
> --- a/drivers/nvme/host/fc.c
> +++ b/drivers/nvme/host/fc.c
> @@ -2109,7 +2109,7 @@ __nvme_fc_init_request(struct nvme_fc_ctrl *ctrl,
>
>  static int
>  nvme_fc_init_request(struct blk_mq_tag_set *set, struct request *rq,
> -               unsigned int hctx_idx, unsigned int numa_node)
> +               unsigned int hctx_idx, int numa_node)
>  {
>         struct nvme_fc_ctrl *ctrl =3D to_fc_ctrl(set->driver_data);
>         struct nvme_fcp_op_w_sgl *op =3D blk_mq_rq_to_pdu(rq);
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index 3c83076a57e5..a5f12fc7655d 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -443,11 +443,16 @@ static bool nvme_dbbuf_update_and_check_event(u16 v=
alue, __le32 *dbbuf_db,
>  }
>
>  static struct nvme_descriptor_pools *
> -nvme_setup_descriptor_pools(struct nvme_dev *dev, unsigned numa_node)
> +nvme_setup_descriptor_pools(struct nvme_dev *dev, int numa_node)
>  {
> -       struct nvme_descriptor_pools *pools =3D &dev->descriptor_pools[nu=
ma_node];
> +       struct nvme_descriptor_pools *pools;
>         size_t small_align =3D NVME_SMALL_POOL_SIZE;
>
> +       if (numa_node =3D=3D NUMA_NO_NODE)
> +               pools =3D &dev->descriptor_pools[numa_node_id()];
> +       else
> +               pools =3D &dev->descriptor_pools[numa_node];

Simpler: if (numa_node =3D=3D NUMA_NO_NODE) numa_node =3D numa_node_id();

> +
>         if (pools->small)
>                 return pools; /* already initialized */
>
> @@ -516,7 +521,7 @@ static int nvme_init_hctx(struct blk_mq_hw_ctx *hctx,=
 void *data,
>
>  static int nvme_pci_init_request(struct blk_mq_tag_set *set,
>                 struct request *req, unsigned int hctx_idx,
> -               unsigned int numa_node)
> +               int numa_node)
>  {
>         struct nvme_iod *iod =3D blk_mq_rq_to_pdu(req);
>
> diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
> index 35c0822edb2d..c2514ef94028 100644
> --- a/drivers/nvme/host/rdma.c
> +++ b/drivers/nvme/host/rdma.c
> @@ -292,7 +292,7 @@ static void nvme_rdma_exit_request(struct blk_mq_tag_=
set *set,
>
>  static int nvme_rdma_init_request(struct blk_mq_tag_set *set,
>                 struct request *rq, unsigned int hctx_idx,
> -               unsigned int numa_node)
> +               int numa_node)
>  {
>         struct nvme_rdma_ctrl *ctrl =3D to_rdma_ctrl(set->driver_data);
>         struct nvme_rdma_request *req =3D blk_mq_rq_to_pdu(rq);
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 69cb04406b47..385eef98081b 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -547,7 +547,7 @@ static void nvme_tcp_exit_request(struct blk_mq_tag_s=
et *set,
>
>  static int nvme_tcp_init_request(struct blk_mq_tag_set *set,
>                 struct request *rq, unsigned int hctx_idx,
> -               unsigned int numa_node)
> +               int numa_node)
>  {
>         struct nvme_tcp_ctrl *ctrl =3D to_tcp_ctrl(set->driver_data);
>         struct nvme_tcp_request *req =3D blk_mq_rq_to_pdu(rq);
> diff --git a/drivers/nvme/target/loop.c b/drivers/nvme/target/loop.c
> index fc8e7c9ad858..72a8ea70eae7 100644
> --- a/drivers/nvme/target/loop.c
> +++ b/drivers/nvme/target/loop.c
> @@ -202,7 +202,7 @@ static int nvme_loop_init_iod(struct nvme_loop_ctrl *=
ctrl,
>
>  static int nvme_loop_init_request(struct blk_mq_tag_set *set,
>                 struct request *req, unsigned int hctx_idx,
> -               unsigned int numa_node)
> +               int numa_node)
>  {
>         struct nvme_loop_ctrl *ctrl =3D to_loop_ctrl(set->driver_data);
>         struct nvme_loop_iod *iod =3D blk_mq_rq_to_pdu(req);
> diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
> index 4a902c9dfd8b..8958ad31ed2a 100644
> --- a/drivers/scsi/scsi_lib.c
> +++ b/drivers/scsi/scsi_lib.c
> @@ -1948,7 +1948,7 @@ static blk_status_t scsi_queue_rq(struct blk_mq_hw_=
ctx *hctx,
>  }
>
>  static int scsi_mq_init_request(struct blk_mq_tag_set *set, struct reque=
st *rq,
> -                               unsigned int hctx_idx, unsigned int numa_=
node)
> +                               unsigned int hctx_idx, int numa_node)
>  {
>         struct Scsi_Host *shost =3D set->driver_data;
>         struct scsi_cmnd *cmd =3D blk_mq_rq_to_pdu(rq);
> diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
> index cae9e857aea4..1a5a3786522c 100644
> --- a/include/linux/blk-mq.h
> +++ b/include/linux/blk-mq.h
> @@ -426,7 +426,7 @@ struct blk_mq_hw_ctx {
>         struct blk_mq_tags      *sched_tags;
>
>         /** @numa_node: NUMA node the storage adapter has been connected =
to. */
> -       unsigned int            numa_node;
> +       int             numa_node;
>         /** @queue_num: Index of this hardware queue. */
>         unsigned int            queue_num;
>
> @@ -651,7 +651,7 @@ struct blk_mq_ops {
>          * flush request.
>          */
>         int (*init_request)(struct blk_mq_tag_set *set, struct request *,
> -                           unsigned int, unsigned int);
> +                           unsigned int, int);

Pre-existing, but naming these integer arguments would be helpful for
documentation.

Best,
Caleb

>         /**
>          * @exit_request: Ditto for exit/teardown.
>          */
> --
> 2.47.3
>
>

