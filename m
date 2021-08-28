Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5253FA468
	for <lists+nbd@lfdr.de>; Sat, 28 Aug 2021 09:51:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 43D2D20609; Sat, 28 Aug 2021 07:51:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Aug 28 07:51:09 2021
Old-Return-Path: <BATV+e82f36cbde774264a3b5+6579+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AF38D205FA
	for <lists-other-nbd@bendel.debian.org>; Sat, 28 Aug 2021 07:35:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PEBorLIbmfxe for <lists-other-nbd@bendel.debian.org>;
	Sat, 28 Aug 2021 07:34:58 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3EAC6205F1
	for <nbd@other.debian.org>; Sat, 28 Aug 2021 07:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=js+UWYNM8YPTLRZ9ERhhOXxsAZmGo7ttkBYVZv/l62E=; b=MtDOH/dQOYQf+MXWY+D5I7cimb
	fy2CtDFjdVWCJSJZeW/Rl27SSbUkyUrjto52ZO169qNA4fujxRkz0Kms4tueEF3gvcXnr25UPeEDi
	qDU19bQcmKoNRQVNAruP+mEqqE2ESkdMq5tdK6I5DYQ+YwO9YkK8K4d89WklXaPcP62ybMNyNO/if
	zoGFKk08exnNTbKFQS4wnvJTA0KuTRuvQA+29IZxpVKLOuRuqqL6xxLMTLgbBl1HulWZ5RXSqzqgZ
	zcPTqTVkvQI+gvE6tldn43E94bYVmTGPeUAvfvhx9LVWm2DZff3E2NSwpUj+IZYPn0EMwccIsj9Kc
	rYcMIPVg==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJsp1-00FNRa-6I; Sat, 28 Aug 2021 07:32:22 +0000
Date: Sat, 28 Aug 2021 08:32:11 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, axboe@kernel.dk,
	martin.petersen@oracle.com, jejb@linux.ibm.com, kbusch@kernel.org,
	sagi@grimberg.me, adrian.hunter@intel.com, beanhuo@micron.com,
	ulf.hansson@linaro.org, avri.altman@wdc.com, swboyd@chromium.org,
	agk@redhat.com, snitzer@redhat.com, josef@toxicpanda.com,
	hare@suse.de, bvanassche@acm.org, ming.lei@redhat.com,
	linux-scsi@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-mmc@vger.kernel.org, dm-devel@redhat.com,
	nbd@other.debian.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/10] mmc/core/block: add error handling support for
 add_disk()
Message-ID: <YSnme1mfHS/HCguW@infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
 <20210823202930.137278-7-mcgrof@kernel.org>
 <YSSN+eac2aCFXTAA@infradead.org>
 <YSkyHINtV/djFEej@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSkyHINtV/djFEej@bombadil.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XMIOEypwAJK.A.e9F.treKhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1354
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YSnme1mfHS/HCguW@infradead.org
Resent-Date: Sat, 28 Aug 2021 07:51:09 +0000 (UTC)

On Fri, Aug 27, 2021 at 11:42:36AM -0700, Luis Chamberlain wrote:
> > >  	if (area_type == MMC_BLK_DATA_AREA_MAIN)
> > >  		dev_set_drvdata(&card->dev, md);
> > > -	device_add_disk(md->parent, md->disk, mmc_disk_attr_groups);
> > > +	ret = device_add_disk(md->parent, md->disk, mmc_disk_attr_groups);
> > > +	if (ret)
> > > +		goto out;
> > 
> > This needs to do a blk_cleanup_queue and also te kfree of md.
> 
> If mmc_blk_alloc_parts() fails mmc_blk_remove_req() is called which
> does both for us?

Yes, but only for the main gendisk, and those parts already added to
the list which happens after device_add_disk succeeded.

