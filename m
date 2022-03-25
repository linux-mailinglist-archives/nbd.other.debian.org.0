Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 018654E7054
	for <lists+nbd@lfdr.de>; Fri, 25 Mar 2022 10:57:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D483A20429; Fri, 25 Mar 2022 09:57:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 25 09:57:09 2022
Old-Return-Path: <jack@suse.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D27C320477
	for <lists-other-nbd@bendel.debian.org>; Fri, 25 Mar 2022 09:39:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.39 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Wdz3A1ikldGN for <lists-other-nbd@bendel.debian.org>;
	Fri, 25 Mar 2022 09:39:23 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 36D7B20456
	for <nbd@other.debian.org>; Fri, 25 Mar 2022 09:39:23 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id C40D0210F1;
	Fri, 25 Mar 2022 09:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1648201160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7G9EIXoAPdb1ajdlPCiZb3cMqrCwY++/iRz3nA26Srs=;
	b=HYoIdsEuhIMnTp/lAUfZU34v7lBGapQ+E31QVyBuJuFXBdC3qxQlLhp1nOYzU59IVb59vr
	qHWAZm0dAnht445g1YOeXe225nslEOm+u1WLwDRA+YUvzZJKu+esffZp9CTx6ItCUbi/Hi
	wkFC0O0yJS20zSkhRVjgeVXV1ID1OMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1648201160;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7G9EIXoAPdb1ajdlPCiZb3cMqrCwY++/iRz3nA26Srs=;
	b=daqCe2EBtod8UxeysNTu59gPb0sRGX5kVAUZWcN3AzuDd9B12Qa6LQal/8t4G51rokqHPC
	pcVe61f+efTC3WBA==
Received: from quack3.suse.cz (unknown [10.100.200.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id ADABEA3B89;
	Fri, 25 Mar 2022 09:39:20 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 5FD76A0610; Fri, 25 Mar 2022 10:39:20 +0100 (CET)
Date: Fri, 25 Mar 2022 10:39:20 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH 01/13] nbd: use the correct block_device in nbd_ioctl
Message-ID: <20220325093920.l3hjhed2babptxbz@quack3.lan>
References: <20220324075119.1556334-1-hch@lst.de>
 <20220324075119.1556334-2-hch@lst.de>
 <20220324122041.itc55zladc5sax5p@quack3.lan>
 <20220324132322.2t3y4evcxunlpvzm@quack3.lan>
 <20220324171148.GA28007@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324171148.GA28007@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jzafnBOX2pC.A.nYB.1HZPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1798
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220325093920.l3hjhed2babptxbz@quack3.lan
Resent-Date: Fri, 25 Mar 2022 09:57:09 +0000 (UTC)

On Thu 24-03-22 18:11:48, Christoph Hellwig wrote:
> On Thu, Mar 24, 2022 at 02:23:22PM +0100, Jan Kara wrote:
> > Should't we call __invalidate_device() for the partition bdev here? Because
> > if the NBD device has partitions, filesystem will be mounted on this
> > partition and we want to invalidate it. Similarly the partition buffer
> > cache is different from the buffer cache of the whole device and we should
> > invalidate the partition one. In fact in cases like this I think we need
> > to invalidate all the partitions and filesystems that are there on this
> > disk so neither the old, nor the new code looks quite correct to me. Am I
> > missing something?
> 
> Well, that assumes just one partition is used, which kinda defeats the
> purpose of partitions.  I can exclude the __invalidate_device to not
> change from one kind of broken to another, but I suspect the real
> question is why we have this __invalidate_device call at all.

I suppose it tries to cleanup after effectively hot-unplugging the device.
But I think we don't need to untangle that in this patch set. I'd just
prefer we would not change one questionable behavior for another similarly
questionable one...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

