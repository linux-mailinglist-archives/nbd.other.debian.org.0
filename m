Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6761693C0F8
	for <lists+nbd@lfdr.de>; Thu, 25 Jul 2024 13:37:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 54A4D20F84; Thu, 25 Jul 2024 11:37:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jul 25 11:37:08 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8E1D020F7B
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 Jul 2024 11:36:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YDFOQSUQSZBf for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 Jul 2024 11:36:51 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 17E2620EFF
	for <nbd@other.debian.org>; Thu, 25 Jul 2024 11:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=A2VuDAKeSGGGRwdNEgASvdRePK2jE6LTgdknFzfGiVg=; b=HRSnzfY+SxqUo9lzjJBHswdyNO
	izEqhcP/7tFCFgJJGzzhTZHV+hkIJ95lvet5keDsrZB2SVJh4LM2TT0rY+nfGtvBDiOATcCiQ/ZZp
	NX14nRCfBdImELKCJsEds0YwtB87PNneYsFwhe69klvX8hKaVd3bPAdUOO5oKLpwqsdI1TpEV3xHA
	zPeruYumASMydrGBh8+RD0p+DiFqZyJ0vUaImcbHlwd7Aik2LDO+RgK3xJUkwPiJj9pwJIeGrrPKF
	y3yZwQEUsA40VBWzlQvQ+rZPVwPFNOT65DR9yRxPQziuObFSyUbJuGiw7PBH1R7FTtIfgagxi0sHi
	wC/6XZ8A==;
Received: from [102.39.153.168] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1sWwlF-001dJr-31;
	Thu, 25 Jul 2024 13:35:53 +0200
Received: from wouter by pc220518 with local (Exim 4.98)
	(envelope-from <w@uter.be>)
	id 1sWwl8-00000002sGZ-0mps;
	Thu, 25 Jul 2024 13:35:46 +0200
Date: Thu, 25 Jul 2024 13:35:46 +0200
From: Wouter Verhelst <w@uter.be>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-block@vger.kernel.org,
	Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH 14/26] block: move the nonrot flag to queue_limits
Message-ID: <ZqI4kosy20WkLC2P@pc220518.home.grep.be>
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-15-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617060532.127975-15-hch@lst.de>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tV26z8862YL.A.y3L.kjjomB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3102
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZqI4kosy20WkLC2P@pc220518.home.grep.be
Resent-Date: Thu, 25 Jul 2024 11:37:08 +0000 (UTC)

On Mon, Jun 17, 2024 at 08:04:41AM +0200, Christoph Hellwig wrote:
> Use the chance to switch to defaulting to non-rotational and require
> the driver to opt into rotational, which matches the polarity of the
> sysfs interface.
[...]
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index cb1c86a6a3fb9d..6cddf5baffe02a 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1867,11 +1867,6 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
>  		goto out_err_disk;
>  	}
>  
> -	/*
> -	 * Tell the block layer that we are not a rotational device
> -	 */
> -	blk_queue_flag_set(QUEUE_FLAG_NONROT, disk->queue);
> -
>  	mutex_init(&nbd->config_lock);
>  	refcount_set(&nbd->config_refs, 0);
>  	/*

NBD actually exports a flag for rotational devices; it's defined in
nbd.h in the NBD userland source as

#define NBD_FLAG_ROTATIONAL     (1 << 4)        /* Use elevator algorithm - rotational media */

which is passed in the same flags field which also contains the
NBD_FLAG_SEND_FLUSH and NBD_FLAG_SEND_FUA flags.

Perhaps we might want to look at that flag and set the device to
rotational if it is specified?

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

