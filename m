Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 53518408B69
	for <lists+nbd@lfdr.de>; Mon, 13 Sep 2021 14:57:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 288B0203D5; Mon, 13 Sep 2021 12:57:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 13 12:57:22 2021
Old-Return-Path: <BATV+1254e52a5895aee8e62a+6595+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5835B203CA
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Sep 2021 12:41:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aE1x_xzKkcX4 for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Sep 2021 12:41:17 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C065D203C7
	for <nbd@other.debian.org>; Mon, 13 Sep 2021 12:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k9G/MyGr7rTLDGPkLzp8CXriGu+yTq0eNWCp4PwCYmM=; b=pA+MjBQUNSqOnXj19xJ727PPk1
	Yrmd4/XRm6xL/M+yE9QcZdjsw2Mshz1d9syWf5Og1A21sCxkVMss1NU/EuX3gRoxIE7KVx5MTW1NE
	pLF6HxjvlhE1khBRLlA4dAougSEjvjlq5aV38jkAGOzHHLheUKUvDoYegufr1EP2jpRzF2KbK3sBq
	SbwPZgPDgDkP13ElAeAGVBSj4aOPORiQu8Cto5kNMOXTAidBJ5R8e4awKik2884qwq+51D0TI7Uwy
	tdMj8ax5VIgdN1WMP1VZOCBnj712Rz1kxe+SGToZV6Z9tbUV4mEwlfrUWI4LvfbII0l/uLUuRIg56
	tly1drLQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPl7o-00DT20-7C; Mon, 13 Sep 2021 12:32:03 +0000
Date: Mon, 13 Sep 2021 13:31:52 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, hch@infradead.org,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	yixingchen@bytedance.com
Subject: Re: [PATCH 1/3] block: Add invalidate_gendisk() helper to invalidate
 the gendisk
Message-ID: <YT9EuMgnTQezWJSQ@infradead.org>
References: <20210913112557.191-1-xieyongji@bytedance.com>
 <20210913112557.191-2-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913112557.191-2-xieyongji@bytedance.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <FqT6dlU710N.A.fVB.yq0PhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1439
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YT9EuMgnTQezWJSQ@infradead.org
Resent-Date: Mon, 13 Sep 2021 12:57:22 +0000 (UTC)

On Mon, Sep 13, 2021 at 07:25:55PM +0800, Xie Yongji wrote:
>  
> +/**
> + * invalidate_gendisk - invalidate the gendisk
> + * @disk: the struct gendisk to invalidate
> + *
> + * A helper to invalidates the gendisk. It will clean the gendisk's associated
> + * buffer/page caches and reset its internal states so that the gendisk
> + * can be reused by the drivers.
> + *
> + * Context: can sleep
> + */
> +
> +void invalidate_gendisk(struct gendisk *disk)

No need for the empty line.  Also I wonder if invalidate_disk might be a
better name - except for del_gendisk we don't really use _gendisk in
function names at all.

> +extern void invalidate_gendisk(struct gendisk *gp);

No need for the extern.  Also I'd name the argument disk, just as in
the actual implementation.

The actual functionality looks good to me despite these nitpicks.

