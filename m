Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A162414CAE
	for <lists+nbd@lfdr.de>; Wed, 22 Sep 2021 17:06:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2F39B20BDB; Wed, 22 Sep 2021 15:06:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 22 15:06:09 2021
Old-Return-Path: <BATV+1b7d5aa89e7f306d9e0e+6604+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B4B1820C27
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Sep 2021 14:49:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id iOu5-z5tWnyK for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Sep 2021 14:49:52 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6587C2054E
	for <nbd@other.debian.org>; Wed, 22 Sep 2021 14:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NFcz2hy9ApyAue6R/MxGoz0rnoxrobESWO5tYq8yA5c=; b=Wxh8PGMGd5lPYi9PRPK/Arg6pe
	1dEGBpf0xksMzh5Fo5bjJbjsEBs+7hGX+Hogey9xUYlneWH1+iO47IdV3E1M7GeInt86vA86y2L7x
	WZ4tlcmZMX/Nxlkw/Z1/2G87nE/nycoSNLFhWTzDJtSBJXHs/yi84ofOn3RC9Rb2vjFJA9HX6lP7I
	dvHze0K3bvE4NuSFVHguj3yxcfGnySosEpgpC7T0iHtiB1abH2M3EhU1z0SZUuPyfMIB7N/eo6Hk8
	QAfUNY7mwuo75Wqdd9EruYFOnSCps8FPwuGammBj4oDkPWBGPAaTw7DTtJdaZt00QHokOCUTBwUjV
	7cTmDqUw==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mT3Wu-004sWj-U6; Wed, 22 Sep 2021 14:47:44 +0000
Date: Wed, 22 Sep 2021 15:47:24 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, hch@infradead.org,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	yixingchen@bytedance.com
Subject: Re: [PATCH v2 4/4] nbd: Use invalidate_disk() helper on disconnect
Message-ID: <YUtB/NtF8BJ7afwj@infradead.org>
References: <20210922123711.187-1-xieyongji@bytedance.com>
 <20210922123711.187-5-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922123711.187-5-xieyongji@bytedance.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <BZoOtM-5KFO.A.PjH.hZ0ShB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1525
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YUtB/NtF8BJ7afwj@infradead.org
Resent-Date: Wed, 22 Sep 2021 15:06:09 +0000 (UTC)

On Wed, Sep 22, 2021 at 08:37:11PM +0800, Xie Yongji wrote:
> When a nbd device encounters a writeback error, that error will
> get propagated to the bd_inode's wb_err field. Then if this nbd
> device's backend is disconnected and another is attached, we will
> get back the previous writeback error on fsync, which is unexpected.
> 
> To fix it, let's use invalidate_disk() helper to invalidate the
> disk on disconnect instead of just setting disk's capacity to zero.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

