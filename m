Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 49901409B20
	for <lists+nbd@lfdr.de>; Mon, 13 Sep 2021 19:42:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B9C9120395; Mon, 13 Sep 2021 17:42:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 13 17:42:09 2021
Old-Return-Path: <mcgrof@infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FOURLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,
	RDNS_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 833AB20365
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Sep 2021 17:26:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.763 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RDNS_NONE=0.793]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YNA5xJ4ggc7K for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Sep 2021 17:26:35 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 039D820271
	for <nbd@other.debian.org>; Mon, 13 Sep 2021 17:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=n6IoAZ8B/kEcoizb/4oIl8YoC6PaMi7dZ4UmJ7FfTuc=; b=pK5QwDIEOUYgR3LtlFvUy5fURG
	9u45mAqM1M9DAu9Zww5qGhwL7DkhW606ory3IOBDIiQw5bkR5CbNS1SnMZCioV+m24ylfkxb7A6ge
	2tsX3nC1XrVrNY/xrt2K0/CbkDq4gqhlSc36DUyXHmcmx7U/KtCkShut18PHWMXO8eKaqzv2/nEDF
	fpmHTPjhk8b8IQe0jTE2AKFDSU3Nj0ipIbcN+0M6LFLuck79b71sJareQfNB69tQztBEyElRHIVdE
	YXsLWDnPX/zVc4jzgcfn3FHMudr5LNLi338cljUuC9wVwpsxEPKs0rw9FnVgbReeQCs/XMBa1XJ4b
	hxPQRrPQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPpib-002gGS-4q; Mon, 13 Sep 2021 17:26:09 +0000
Date: Mon, 13 Sep 2021 10:26:09 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Ming Lei <ming.lei@redhat.com>
Cc: axboe@kernel.dk, martin.petersen@oracle.com, jejb@linux.ibm.com,
	kbusch@kernel.org, sagi@grimberg.me, adrian.hunter@intel.com,
	beanhuo@micron.com, ulf.hansson@linaro.org, avri.altman@wdc.com,
	swboyd@chromium.org, agk@redhat.com, snitzer@redhat.com,
	josef@toxicpanda.com, hch@infradead.org, hare@suse.de,
	bvanassche@acm.org, linux-scsi@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-mmc@vger.kernel.org,
	dm-devel@redhat.com, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v3 2/8] scsi/sr: add error handling support for add_disk()
Message-ID: <YT+JsQ7pgtz0E2ZK@bombadil.infradead.org>
References: <20210830212538.148729-1-mcgrof@kernel.org>
 <20210830212538.148729-3-mcgrof@kernel.org>
 <YTbCQdieHG07Bz8W@T590>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTbCQdieHG07Bz8W@T590>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pyMuTrGO5AO.A.eQD.x14PhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1447
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YT+JsQ7pgtz0E2ZK@bombadil.infradead.org
Resent-Date: Mon, 13 Sep 2021 17:42:09 +0000 (UTC)

On Tue, Sep 07, 2021 at 09:37:05AM +0800, Ming Lei wrote:
> On Mon, Aug 30, 2021 at 02:25:32PM -0700, Luis Chamberlain wrote:
> > We never checked for errors on add_disk() as this function
> > returned void. Now that this is fixed, use the shiny new
> > error handling.
> > 
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> > ---
> >  drivers/scsi/sr.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
> > index 2942a4ec9bdd..72fd21844367 100644
> > --- a/drivers/scsi/sr.c
> > +++ b/drivers/scsi/sr.c
> > @@ -779,7 +779,10 @@ static int sr_probe(struct device *dev)
> >  	dev_set_drvdata(dev, cd);
> >  	disk->flags |= GENHD_FL_REMOVABLE;
> >  	sr_revalidate_disk(cd);
> > -	device_add_disk(&sdev->sdev_gendev, disk, NULL);
> > +
> > +	error = device_add_disk(&sdev->sdev_gendev, disk, NULL);
> > +	if (error)
> > +		goto fail_minor;
> 
> You don't undo register_cdrom(), maybe you can use kref_put(&cd->kref, sr_kref_release);
> to simplify the error handling.

Works with me, thanks!

  Luis

