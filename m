Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CDC3F9F63
	for <lists+nbd@lfdr.de>; Fri, 27 Aug 2021 21:00:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D166A207E1; Fri, 27 Aug 2021 19:00:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 27 19:00:09 2021
Old-Return-Path: <mcgrof@infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RDNS_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9953120781
	for <lists-other-nbd@bendel.debian.org>; Fri, 27 Aug 2021 18:43:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.663 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RDNS_NONE=0.793]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 424QWYQLdWKE for <lists-other-nbd@bendel.debian.org>;
	Fri, 27 Aug 2021 18:43:05 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B72E420785
	for <nbd@other.debian.org>; Fri, 27 Aug 2021 18:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RBmvAwPay+sXfU8kdltg7dsiThQ5ECrs+zL2VnxPj/I=; b=lgcsvGKlvlRPjm4XeXNlzIQlb5
	QOizv+m63NRPhUGgoDpLlprNnix7EU3Cz1GL3Dr13Yyi6Y3Nr3ZcwPqXlvo+FLXQro8rIPZF8R2NE
	br7T4+GN2+Iy0CWjeDe99nHKDDW+WmK9hBqupHrrsDPuAvNSfyGKm5l+1xhNnDcYa8EfWkyLUQJKG
	GwFI3fYMZklR57ielKept6nXS5jAmCG3O5g08pxOv90RKWehVeX3UdKf6uej4LC9vtg6/RMef71fY
	3xgKIlR8IdwVfwjRwU0ZwCodscgojLikAQkiS+jUjyBHBMc7lxOFxYMcLwoExFl6wGAE/e2wldljK
	aLHIm5Zw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJgoG-00Cyj5-C3; Fri, 27 Aug 2021 18:42:36 +0000
Date: Fri, 27 Aug 2021 11:42:36 -0700
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
Message-ID: <YSkyHINtV/djFEej@bombadil.infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
 <20210823202930.137278-7-mcgrof@kernel.org>
 <YSSN+eac2aCFXTAA@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSSN+eac2aCFXTAA@infradead.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nR2qYHeOjYN.A.sJF.5YTKhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1350
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YSkyHINtV/djFEej@bombadil.infradead.org
Resent-Date: Fri, 27 Aug 2021 19:00:09 +0000 (UTC)

On Tue, Aug 24, 2021 at 07:13:13AM +0100, Christoph Hellwig wrote:
> On Mon, Aug 23, 2021 at 01:29:26PM -0700, Luis Chamberlain wrote:
> > We never checked for errors on add_disk() as this function
> > returned void. Now that this is fixed, use the shiny new
> > error handling.
> > 
> > The caller cleanups the disk already so all we need to do
> > is just pass along the return value.
> > 
> > Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> > ---
> >  drivers/mmc/core/block.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> > index 4c11f171e56d..4f12c6d1e1b5 100644
> > --- a/drivers/mmc/core/block.c
> > +++ b/drivers/mmc/core/block.c
> > @@ -2432,7 +2432,9 @@ static struct mmc_blk_data *mmc_blk_alloc_req(struct mmc_card *card,
> >  	/* used in ->open, must be set before add_disk: */
> >  	if (area_type == MMC_BLK_DATA_AREA_MAIN)
> >  		dev_set_drvdata(&card->dev, md);
> > -	device_add_disk(md->parent, md->disk, mmc_disk_attr_groups);
> > +	ret = device_add_disk(md->parent, md->disk, mmc_disk_attr_groups);
> > +	if (ret)
> > +		goto out;
> 
> This needs to do a blk_cleanup_queue and also te kfree of md.

If mmc_blk_alloc_parts() fails mmc_blk_remove_req() is called which
does both for us?

 Luis

