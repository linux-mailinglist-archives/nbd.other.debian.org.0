Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7473F584C
	for <lists+nbd@lfdr.de>; Tue, 24 Aug 2021 08:33:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1AE3B205B7; Tue, 24 Aug 2021 06:33:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug 24 06:33:09 2021
Old-Return-Path: <BATV+f96701cc9b95d8800a83+6575+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9360E20621
	for <lists-other-nbd@bendel.debian.org>; Tue, 24 Aug 2021 06:17:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xxQMKXSKB6_l for <lists-other-nbd@bendel.debian.org>;
	Tue, 24 Aug 2021 06:17:02 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D17D320606
	for <nbd@other.debian.org>; Tue, 24 Aug 2021 06:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dQds9cSHSeE6kGx5MS02raO6iayqk63xe1w2A7iEq1M=; b=NAFLIm8m4aCi9SqoT2xstelsQt
	vDDY5oULL6Gmc1ZtN/gXrqKm8aT4pyL1HMdd/l2rqnGgXcV9wI4JDOqTNN4B9TBQDOR+FgwwGB+hC
	fVN/KSCGFY0auXuQHe7JihRBzo4EtOoqe2ZdAM3mAMsZk+1zS6mxXQtz21pklOJ9cM9Gq4EjMh2dC
	VNji9HAUzIQdgAkjytgO5wKENF8c6yy+BfZYUHRc1wJwRmWaSWdd5JxzsX07oeG29ZP7H46rvTk6j
	mURnUDtSYtcFQhIZ3HmOwQ46s6R9rtWUkAiy5MKh90yI8kvp0Wmvu5n28MAsamto4HyofHAZc1EFv
	5HJ8ucjg==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIPgP-00Adf8-0Q; Tue, 24 Aug 2021 06:13:28 +0000
Date: Tue, 24 Aug 2021 07:13:13 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: axboe@kernel.dk, martin.petersen@oracle.com, jejb@linux.ibm.com,
	kbusch@kernel.org, sagi@grimberg.me, adrian.hunter@intel.com,
	beanhuo@micron.com, ulf.hansson@linaro.org, avri.altman@wdc.com,
	swboyd@chromium.org, agk@redhat.com, snitzer@redhat.com,
	josef@toxicpanda.com, hch@infradead.org, hare@suse.de,
	bvanassche@acm.org, ming.lei@redhat.com, linux-scsi@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-mmc@vger.kernel.org,
	dm-devel@redhat.com, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/10] mmc/core/block: add error handling support for
 add_disk()
Message-ID: <YSSN+eac2aCFXTAA@infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
 <20210823202930.137278-7-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823202930.137278-7-mcgrof@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ku_quZom9HB.A.NEE.lKJJhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1313
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YSSN+eac2aCFXTAA@infradead.org
Resent-Date: Tue, 24 Aug 2021 06:33:09 +0000 (UTC)

On Mon, Aug 23, 2021 at 01:29:26PM -0700, Luis Chamberlain wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
> 
> The caller cleanups the disk already so all we need to do
> is just pass along the return value.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  drivers/mmc/core/block.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> index 4c11f171e56d..4f12c6d1e1b5 100644
> --- a/drivers/mmc/core/block.c
> +++ b/drivers/mmc/core/block.c
> @@ -2432,7 +2432,9 @@ static struct mmc_blk_data *mmc_blk_alloc_req(struct mmc_card *card,
>  	/* used in ->open, must be set before add_disk: */
>  	if (area_type == MMC_BLK_DATA_AREA_MAIN)
>  		dev_set_drvdata(&card->dev, md);
> -	device_add_disk(md->parent, md->disk, mmc_disk_attr_groups);
> +	ret = device_add_disk(md->parent, md->disk, mmc_disk_attr_groups);
> +	if (ret)
> +		goto out;

This needs to do a blk_cleanup_queue and also te kfree of md.

