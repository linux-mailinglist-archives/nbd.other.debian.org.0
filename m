Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B05408B95
	for <lists+nbd@lfdr.de>; Mon, 13 Sep 2021 15:03:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 340DA203BB; Mon, 13 Sep 2021 13:03:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 13 13:03:09 2021
Old-Return-Path: <BATV+1254e52a5895aee8e62a+6595+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 66EEA203CE
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Sep 2021 12:45:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eKGpH_0oW1Xd for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Sep 2021 12:45:17 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E14F1203CA
	for <nbd@other.debian.org>; Mon, 13 Sep 2021 12:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uCC25ADfudGen8eHagfsx5W4+kdd6B787Bb8bF/6FZs=; b=J1O2mgTgRxnExGeS3TAf5lLHt7
	rkQG9p/8stzbyX+YMt0Nh2SV+p3L8mDhK2wCjEMVcWFGohz1/EfJwfpesjYWY/ZHLfCttLrhCCOmf
	QfxhgG/InB1eQy0+EbanBzp7ZqLFoLC/dckTezRfB0skRyZSAIQI0IUKYpfGL6MdLqzAuK4zSer9M
	mZ1Sy6Beto7qExQXpbZbjp0bmMOc/u5FhmXa3xHipU9boPKQk/tnz6YNdjpbk/vs4kre8kPN9mUTy
	uYLkNZTumibm8Z4CTpFlloX6Dy5GbTA89wYlR9CJz8BfZT4iz2Wuw4grdHW54GajbOmAWjX8VvP16
	zBROjYFQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPlHY-00DTWF-7k; Mon, 13 Sep 2021 12:42:28 +0000
Date: Mon, 13 Sep 2021 13:41:56 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, hch@infradead.org,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	yixingchen@bytedance.com
Subject: Re: [PATCH 3/3] nbd: Use invalidate_gendisk() helper on disconnect
Message-ID: <YT9HFOTnBFWMUE74@infradead.org>
References: <20210913112557.191-1-xieyongji@bytedance.com>
 <20210913112557.191-4-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913112557.191-4-xieyongji@bytedance.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xJpVwg0k0oH.A.G1H.Nw0PhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1440
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YT9HFOTnBFWMUE74@infradead.org
Resent-Date: Mon, 13 Sep 2021 13:03:09 +0000 (UTC)

On Mon, Sep 13, 2021 at 07:25:57PM +0800, Xie Yongji wrote:
> +		invalidate_gendisk(nbd->disk);
> +		if (nbd->config->bytesize)
> +			kobject_uevent(&nbd_to_dev(nbd)->kobj, KOBJ_CHANGE);

I wonder if the invalidate helper should just use
set_capacity_and_notify to take care of the notification in the proper
way.  This adds an uevent to loop, and adds the RESIZE=1 argument to
nbd, but it feels like the right thing to do.

