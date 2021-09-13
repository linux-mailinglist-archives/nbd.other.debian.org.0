Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E61E4097D7
	for <lists+nbd@lfdr.de>; Mon, 13 Sep 2021 17:51:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 11E73203E7; Mon, 13 Sep 2021 15:51:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 13 15:51:10 2021
Old-Return-Path: <BATV+1254e52a5895aee8e62a+6595+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E28502039A
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Sep 2021 15:35:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id UckwY0vHRJNf for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Sep 2021 15:35:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5C3EA203DB
	for <nbd@other.debian.org>; Mon, 13 Sep 2021 15:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Nkfa8MwxM6Nj1LLWeK2CkNG59h1RbMMNklrqm7CaNzw=; b=Z/xhKylwA6D36vLVrEMyr9Trvn
	dcacxWftwcy5KE7QZ3zNb5QrmjjTPf86CjuSD6+/9NYNgUrTH5N2bfE8hrStOsVDgMBiGDv6GQLde
	7qNC9Nv10xX52MXZkJuKGwJkVe4FJbGM0gVmpKcQPx5W9kSVMWWc8rY55JcWDyxdX8iXQZe2O4OUG
	TwNuheOXopIqy8Q8NY8pJBG+nw3AzPDUz/IlFjMkweKK7rBZf/oBnT3Xf0iNPm6Sb/eyCyWM94ihx
	m4NXX/3zIBDdlpYJEeBCaVeHwWan6QHVlfuTpdh35HFjJKq7sb8IoT/1uQ/i6N88Oi48w2ZP6+lpA
	bUaahU8g==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPnwf-00DhY1-Nc; Mon, 13 Sep 2021 15:32:45 +0000
Date: Mon, 13 Sep 2021 16:32:33 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Yongji Xie <xieyongji@bytedance.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org, yixingchen@bytedance.com
Subject: Re: [PATCH 3/3] nbd: Use invalidate_gendisk() helper on disconnect
Message-ID: <YT9vEVF0BxIv5qDS@infradead.org>
References: <20210913112557.191-1-xieyongji@bytedance.com>
 <20210913112557.191-4-xieyongji@bytedance.com>
 <YT9HFOTnBFWMUE74@infradead.org>
 <CACycT3uo6GqLx8i=rtn9P2kaSGHjnNnamX3KR0Xgq_5QEhWWUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACycT3uo6GqLx8i=rtn9P2kaSGHjnNnamX3KR0Xgq_5QEhWWUA@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EqhF8fXH34M.A.g1D.tN3PhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1445
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YT9vEVF0BxIv5qDS@infradead.org
Resent-Date: Mon, 13 Sep 2021 15:51:10 +0000 (UTC)

On Mon, Sep 13, 2021 at 09:04:12PM +0800, Yongji Xie wrote:
> On Mon, Sep 13, 2021 at 8:43 PM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Mon, Sep 13, 2021 at 07:25:57PM +0800, Xie Yongji wrote:
> > > +             invalidate_gendisk(nbd->disk);
> > > +             if (nbd->config->bytesize)
> > > +                     kobject_uevent(&nbd_to_dev(nbd)->kobj, KOBJ_CHANGE);
> >
> > I wonder if the invalidate helper should just use
> > set_capacity_and_notify to take care of the notification in the proper
> > way.  This adds an uevent to loop, and adds the RESIZE=1 argument to
> > nbd, but it feels like the right thing to do.
> 
> Looks like set_capacity_and_notify() would not do notification if we
> set capacity to zero.

True.

> How about calling kobject_uevent() directly in
> the helper?

That's probably and improvement over letting the driver do it, so let's
go with that for now instead of adding ever more work to your plate.

