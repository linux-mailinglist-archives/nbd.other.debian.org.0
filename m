Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C55553FBDCD
	for <lists+nbd@lfdr.de>; Mon, 30 Aug 2021 23:00:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9B0A620451; Mon, 30 Aug 2021 21:00:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 30 21:00:28 2021
Old-Return-Path: <mcgrof@infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RDNS_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DBBB0203D2
	for <lists-other-nbd@bendel.debian.org>; Mon, 30 Aug 2021 20:42:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.337 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3, RDNS_NONE=0.793]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id h0NW6OtWuweW for <lists-other-nbd@bendel.debian.org>;
	Mon, 30 Aug 2021 20:42:48 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 27EA920433
	for <nbd@other.debian.org>; Mon, 30 Aug 2021 20:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=s8sN/nm91BxBuEePx1oK1Ip0xK3fNhEwWe4+zuk6ceg=; b=4v7ISjCjGyaDn8TkXmebdJ4hKv
	PYx8skNRQRgbxfe4rRQMsvdVqvz6VsOfG9X+ROPMHVGQ4OJA5hAo5lE2j0lBIGhBMuJO1IOmg+FTW
	Baz+6nCnSYe3ZmhnuxdkpAmokYK10l/Ya7AG5MqiR+lD1nmC8JOlQ969ZzIpbc1fur6demSAe5MMr
	C2BQu/AgInu/iK6+i6nB3CZiOREMoI+7P48WwQrSYGGvuhP+V5R6VnsWpAN/CQqgW38xrJ61oM8JV
	aPng4azQlAs9WpIqkFSGrCtxrK/b3zVILCxHQ9PBfuLp0BPIxBCinyxszKB9hpiE2mepEls2HYCFQ
	4ovZX2pA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKo6Z-000Wv2-7h; Mon, 30 Aug 2021 20:42:07 +0000
Date: Mon, 30 Aug 2021 13:42:07 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: axboe@kernel.dk, martin.petersen@oracle.com, jejb@linux.ibm.com,
	kbusch@kernel.org, sagi@grimberg.me, adrian.hunter@intel.com,
	beanhuo@micron.com, ulf.hansson@linaro.org, avri.altman@wdc.com,
	swboyd@chromium.org, agk@redhat.com, snitzer@redhat.com,
	josef@toxicpanda.com, hare@suse.de, bvanassche@acm.org,
	ming.lei@redhat.com, linux-scsi@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-mmc@vger.kernel.org,
	dm-devel@redhat.com, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/10] mmc/core/block: add error handling support for
 add_disk()
Message-ID: <YS1Cn6yMbpQGFOYe@bombadil.infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
 <20210823202930.137278-7-mcgrof@kernel.org>
 <YSSN+eac2aCFXTAA@infradead.org>
 <YSkyHINtV/djFEej@bombadil.infradead.org>
 <YSnme1mfHS/HCguW@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSnme1mfHS/HCguW@infradead.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <R5rKjc97pTF.A.e6D.sbULhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1357
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YS1Cn6yMbpQGFOYe@bombadil.infradead.org
Resent-Date: Mon, 30 Aug 2021 21:00:28 +0000 (UTC)

On Sat, Aug 28, 2021 at 08:32:11AM +0100, Christoph Hellwig wrote:
> On Fri, Aug 27, 2021 at 11:42:36AM -0700, Luis Chamberlain wrote:
> > > >  	if (area_type == MMC_BLK_DATA_AREA_MAIN)
> > > >  		dev_set_drvdata(&card->dev, md);
> > > > -	device_add_disk(md->parent, md->disk, mmc_disk_attr_groups);
> > > > +	ret = device_add_disk(md->parent, md->disk, mmc_disk_attr_groups);
> > > > +	if (ret)
> > > > +		goto out;
> > > 
> > > This needs to do a blk_cleanup_queue and also te kfree of md.
> > 
> > If mmc_blk_alloc_parts() fails mmc_blk_remove_req() is called which
> > does both for us?
> 
> Yes, but only for the main gendisk, and those parts already added to
> the list which happens after device_add_disk succeeded.

Ah yes I see that now. Will fix up. The tag also needs to be cleaned up.

  Luis

