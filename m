Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6726A4E6439
	for <lists+nbd@lfdr.de>; Thu, 24 Mar 2022 14:39:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 336472036E; Thu, 24 Mar 2022 13:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 24 13:39:09 2022
Old-Return-Path: <jack@suse.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E7891202C3
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Mar 2022 13:23:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.39 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1fWwxTO-3syp for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Mar 2022 13:23:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 437322036D
	for <nbd@other.debian.org>; Thu, 24 Mar 2022 13:23:26 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 15B9E210DB;
	Thu, 24 Mar 2022 13:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1648128204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MzQ+aUPdE/0iGhDktTPztuu2knGtt31lC78epnE6SgA=;
	b=RZzU8YVwHd7uXdz0fE9dn8PqzegHwd48JOZrB7Wvpos83O4fsXN9ak+cWPnWMeNLVo40AM
	kehBgSZOttNspDVX3nGG8/rJXsZ+Z8od58ktWgV1xtPOx4qaqo4z+JpGSwIYcSehTBZKJc
	QXqvcxGFFUM7d9m9PGbn2eYBVy2+XVU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1648128204;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MzQ+aUPdE/0iGhDktTPztuu2knGtt31lC78epnE6SgA=;
	b=3MtuobPCA00jBfcjaLFELc9t0kU+FS2lYWsviTXWYojFJbWMNbXTFLcABmZvDJC4B38A1Z
	ggCRY6kU84ZgE3BA==
Received: from quack3.suse.cz (unknown [10.100.200.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id EC526A3B89;
	Thu, 24 Mar 2022 13:23:22 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 9A6B4A0610; Thu, 24 Mar 2022 14:23:22 +0100 (CET)
Date: Thu, 24 Mar 2022 14:23:22 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Jan Kara <jack@suse.cz>, "Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH 01/13] nbd: use the correct block_device in nbd_ioctl
Message-ID: <20220324132322.2t3y4evcxunlpvzm@quack3.lan>
References: <20220324075119.1556334-1-hch@lst.de>
 <20220324075119.1556334-2-hch@lst.de>
 <20220324122041.itc55zladc5sax5p@quack3.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324122041.itc55zladc5sax5p@quack3.lan>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WaV00z_IIuJ.A.yWE.9RHPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1768
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220324132322.2t3y4evcxunlpvzm@quack3.lan
Resent-Date: Thu, 24 Mar 2022 13:39:09 +0000 (UTC)

On Thu 24-03-22 13:20:41, Jan Kara wrote:
> On Thu 24-03-22 08:51:07, Christoph Hellwig wrote:
> > The bdev parameter to ->ioctl contains the block device that the ioctl
> > is called on, which can be the partition.  But the code in nbd_ioctl
> > that uses it really wants the whole device for things like the bd_openers
> > check.  Switch to not pass the bdev along and always use nbd->disk->part0
> > instead.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Looks good. Feel free to add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>

Hum, thinking about this some more...

> > -static void nbd_clear_sock_ioctl(struct nbd_device *nbd,
> > -				 struct block_device *bdev)
> > +static void nbd_clear_sock_ioctl(struct nbd_device *nbd)
> >  {
> >  	sock_shutdown(nbd);
> > -	__invalidate_device(bdev, true);
> > -	nbd_bdev_reset(bdev);
> > +	__invalidate_device(nbd->disk->part0, true);
> > +	nbd_bdev_reset(nbd);

Should't we call __invalidate_device() for the partition bdev here? Because
if the NBD device has partitions, filesystem will be mounted on this
partition and we want to invalidate it. Similarly the partition buffer
cache is different from the buffer cache of the whole device and we should
invalidate the partition one. In fact in cases like this I think we need
to invalidate all the partitions and filesystems that are there on this
disk so neither the old, nor the new code looks quite correct to me. Am I
missing something?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

