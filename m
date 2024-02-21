Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5299785D02E
	for <lists+nbd@lfdr.de>; Wed, 21 Feb 2024 07:00:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BD6FA20F71; Wed, 21 Feb 2024 06:00:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb 21 06:00:13 2024
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8FF1E2125F
	for <lists-other-nbd@bendel.debian.org>; Wed, 21 Feb 2024 05:44:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ksQPGZHG8KUy for <lists-other-nbd@bendel.debian.org>;
	Wed, 21 Feb 2024 05:44:31 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 124C32124A
	for <nbd@other.debian.org>; Wed, 21 Feb 2024 05:44:30 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id AF02468D07; Wed, 21 Feb 2024 06:44:24 +0100 (CET)
Date: Wed, 21 Feb 2024 06:44:24 +0100
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>, Ming Lei <ming.lei@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
Message-ID: <20240221054424.GA12033@lst.de>
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de> <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_3Wd-WI53pM.A.3gG.tFZ1lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2757
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240221054424.GA12033@lst.de
Resent-Date: Wed, 21 Feb 2024 06:00:13 +0000 (UTC)

On Tue, Feb 20, 2024 at 11:01:05PM +0100, Geert Uytterhoeven wrote:
> Hi Christoph,
> 
> On Thu, Feb 15, 2024 at 9:16 AM Christoph Hellwig <hch@lst.de> wrote:
> > Pass the queue limit set at initialization time directly to
> > blk_mq_alloc_disk instead of updating it right after the allocation.
> >
> > This requires refactoring the code a bit so that what was mmc_setup_queue
> > before also allocates the gendisk now and actually sets all limits.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Thanks for your patch, which is now commit 616f876617927732 ("mmc: pass
> queue_limits to blk_mq_alloc_disk") in block/for-next.
> 
> I have bisected the following failure on White-Hawk (also seen on
> other R-Car Gen3/4 systems) to this commit:
> 
>     renesas_sdhi_internal_dmac ee140000.mmc: mmc0 base at
> 0x00000000ee140000, max clock rate 200 MHz
>     mmc0: new HS400 MMC card at address 0001
>     ------------[ cut here ]------------
>     WARNING: CPU: 1 PID: 20 at block/blk-settings.c:202
> blk_validate_limits+0x12c/0x1e0

This is:

	if (lim->virt_boundary_mask) {
		if (WARN_ON_ONCE(lim->max_segment_size &&
                                 lim->max_segment_size != UINT_MAX))
			return -EINVAL;

so we end up here with both a virt_boundary_mask and a
max_segment_size set, which is rather bogus.  I think the
problem is the order of check in the core blk_validate_limits
that artificially causes this.  Can you try this patch?

diff --git a/block/blk-settings.c b/block/blk-settings.c
index c4406aacc0efc6..2120b6f9fef8ea 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -182,16 +182,6 @@ static int blk_validate_limits(struct queue_limits *lim)
 	if (WARN_ON_ONCE(lim->seg_boundary_mask < PAGE_SIZE - 1))
 		return -EINVAL;
 
-	/*
-	 * The maximum segment size has an odd historic 64k default that
-	 * drivers probably should override.  Just like the I/O size we
-	 * require drivers to at least handle a full page per segment.
-	 */
-	if (!lim->max_segment_size)
-		lim->max_segment_size = BLK_MAX_SEGMENT_SIZE;
-	if (WARN_ON_ONCE(lim->max_segment_size < PAGE_SIZE))
-		return -EINVAL;
-
 	/*
 	 * Devices that require a virtual boundary do not support scatter/gather
 	 * I/O natively, but instead require a descriptor list entry for each
@@ -203,6 +193,16 @@ static int blk_validate_limits(struct queue_limits *lim)
 				 lim->max_segment_size != UINT_MAX))
 			return -EINVAL;
 		lim->max_segment_size = UINT_MAX;
+	} else {
+		/*
+		 * The maximum segment size has an odd historic 64k default that
+		 * drivers probably should override.  Just like the I/O size we
+		 * require drivers to at least handle a full page per segment.
+		 */
+		if (!lim->max_segment_size)
+			lim->max_segment_size = BLK_MAX_SEGMENT_SIZE;
+		if (WARN_ON_ONCE(lim->max_segment_size < PAGE_SIZE))
+			return -EINVAL;
 	}
 
 	/*

