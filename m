Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9B9408B59
	for <lists+nbd@lfdr.de>; Mon, 13 Sep 2021 14:51:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1A196203D3; Mon, 13 Sep 2021 12:51:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 13 12:51:12 2021
Old-Return-Path: <BATV+1254e52a5895aee8e62a+6595+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E192620367
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Sep 2021 12:35:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id sR0tQKPhQ6Hq for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Sep 2021 12:35:45 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8473520355
	for <nbd@other.debian.org>; Mon, 13 Sep 2021 12:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ouLFyNfLBm4Dk36viGOwYm8Tka9E+hmUQ7R27zeY3VU=; b=KF3m4F8zNaePid0owuuXCVVxn6
	edWyWHdhgR3bnWhwowRy8FD3i2LKbTQwA6qNGTJAerIjyuqZwOGWu607biklebLu3RMqlNy44y4Uf
	QQPY0lyC7Avm5VGPU4D4RQJVge5Z95SVT8wnwHAZHkUXS1Vqa4fIJrGfrKykeHNBPfc75/8JDyh8q
	09Oq/JH8FdLSFOv2KIGYeyl0+cCRYPnjuok8eYgvBisT3jmbu7UL9OjBIbgfAf89wjgm7DQbLo8kt
	FWKPhLIr8ovsfSvjV4MhpVKR4eJ0Zstjhc+FspWb9PyAK5pNGt0NccS4YMWL56PaPoDKwbaLdpKwg
	v0aybTNA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPlAM-00DT8L-Hd; Mon, 13 Sep 2021 12:34:38 +0000
Date: Mon, 13 Sep 2021 13:34:30 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, hch@infradead.org,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	yixingchen@bytedance.com
Subject: Re: [PATCH 2/3] loop: Use invalidate_gendisk() helper to invalidate
 gendisk
Message-ID: <YT9FVrXcaUdaXlu6@infradead.org>
References: <20210913112557.191-1-xieyongji@bytedance.com>
 <20210913112557.191-3-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913112557.191-3-xieyongji@bytedance.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <05YgLdSDTT.A.mv.Al0PhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1438
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YT9FVrXcaUdaXlu6@infradead.org
Resent-Date: Mon, 13 Sep 2021 12:51:12 +0000 (UTC)

On Mon, Sep 13, 2021 at 07:25:56PM +0800, Xie Yongji wrote:
> Use invalidate_gendisk() helper to simplify the code for gendisk
> invalidation.

bdev can't be null here so this looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

Can you also add a cleanup patch to remove the bdev checks and the
entire bdev variable in __loop_clr_fd?

