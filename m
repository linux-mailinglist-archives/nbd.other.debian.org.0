Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BC23A409B14
	for <lists+nbd@lfdr.de>; Mon, 13 Sep 2021 19:39:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9104F20385; Mon, 13 Sep 2021 17:39:49 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 13 17:39:49 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 7BC8720353
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Sep 2021 17:22:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.763 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RDNS_NONE=0.793]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HQ_IacKFHhj1 for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Sep 2021 17:21:58 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C45F720348
	for <nbd@other.debian.org>; Mon, 13 Sep 2021 17:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ozDu2C9KwJDzUHmqI8L8ZS+TLMmJ1vttUQXVZymGuXw=; b=luWWEIGyIZ+r8nBZzOJgzAJsGx
	N7oDNxgPF3OFmLGgbOPfFjf02fv1ISLc3zvjj4zwkR3ngVeDFoBg7Rkyv8mSPTvmKkXt7bSAXti/9
	R9iY/fZEkesX3BRkVDPaUYhI5ZVJAmf9pJ9amuMKXN9I1A0qj9K6hB9CNHTxNXjZ4LiDoRa1aKw6u
	OUGwFvrmsqa3QOnqAltvdpvADc9fuLcHfFKdTOuFM26DVcVbWUL0CHsaQPCf1HTG5zJqz5CVqQ2VF
	UsurmMzg0xrJvEN2AiG/3SjuJJXUQG1qj45oxztVARgLk7FaNR9pDlE3SjbrPxclCpERbHXedjJr2
	dSlpvPyQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPpe0-002eih-G4; Mon, 13 Sep 2021 17:21:24 +0000
Date: Mon, 13 Sep 2021 10:21:24 -0700
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
Subject: Re: [PATCH v3 1/8] scsi/sd: add error handling support for add_disk()
Message-ID: <YT+IlJnSZzG0j0ON@bombadil.infradead.org>
References: <20210830212538.148729-1-mcgrof@kernel.org>
 <20210830212538.148729-2-mcgrof@kernel.org>
 <YTbAYyo0+rqUZ+L0@T590>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTbAYyo0+rqUZ+L0@T590>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3tKLKCvk30N.A.0FD.lz4PhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1446
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YT+IlJnSZzG0j0ON@bombadil.infradead.org
Resent-Date: Mon, 13 Sep 2021 17:39:49 +0000 (UTC)

On Tue, Sep 07, 2021 at 09:29:07AM +0800, Ming Lei wrote:
> On Mon, Aug 30, 2021 at 02:25:31PM -0700, Luis Chamberlain wrote:
> > We never checked for errors on add_disk() as this function
> > returned void. Now that this is fixed, use the shiny new
> > error handling.
> > 
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> > ---
> >  drivers/scsi/sd.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
> > index 610ebba0d66e..8c1273fff23e 100644
> > --- a/drivers/scsi/sd.c
> > +++ b/drivers/scsi/sd.c
> > @@ -3487,7 +3487,11 @@ static int sd_probe(struct device *dev)
> >  		pm_runtime_set_autosuspend_delay(dev,
> >  			sdp->host->hostt->rpm_autosuspend_delay);
> >  	}
> > -	device_add_disk(dev, gd, NULL);
> > +
> > +	error = device_add_disk(dev, gd, NULL);
> > +	if (error)
> > +		goto out_free_index;
> > +
> 
> The error handling is actually wrong, see 
> 
> 	https://lore.kernel.org/linux-scsi/c93f3010-13c9-e07f-1458-b6b47a27057b@acm.org/T/#t
> 
> Maybe you can base on that patch.

Done, thanks!

 Luis

