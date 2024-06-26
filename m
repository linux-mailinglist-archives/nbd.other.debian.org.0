Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BCB917704
	for <lists+nbd@lfdr.de>; Wed, 26 Jun 2024 05:57:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3C34B206AA; Wed, 26 Jun 2024 03:57:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun 26 03:57:14 2024
Old-Return-Path: <BATV+6ef32e7df62b9ce2c558+7612+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,JOBS,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 60E45206AA
	for <lists-other-nbd@bendel.debian.org>; Wed, 26 Jun 2024 03:40:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.51 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, JOBS=1,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VhWSpL-w5xgN for <lists-other-nbd@bendel.debian.org>;
	Wed, 26 Jun 2024 03:40:05 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 64BC0206A6
	for <nbd@other.debian.org>; Wed, 26 Jun 2024 03:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=q35hat2STPhlr4DAn4+ABXn/NxJWaK5wgb5DlM6xpCg=; b=v38aUgExch/0roE+EfRJ2Glql8
	NJM5fN+YEIB1TYrzijSpWBKOBPz4ePJWBmxAeIq8Vy0dgCM+B8D7e2Uu/8N8Um6Vr/QojQ2rgIn5c
	kZ0Qn4LEY3fOdOmfyKwMWEDOh9Ymv1GdTyRuFBajkXiPOidtU70du4sEE9xKuUof+3qQcWAWRaj21
	Q277QHf25k5Hs4ZG2a3z7KhsZxdHv16NmcJJI6IIXWv8/dTL6K+es5s2mnReHc51vjem7WfsNQ2Oh
	GFZANqqhPdUBbop3nLGkV+BdHz5dumNmTIDB8b0TUPLkhRAW/U3MN14I64qofM3LTvdEoRKFoAPJn
	ZHT0K0YA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMJVe-00000005Ecx-3HCZ;
	Wed, 26 Jun 2024 03:39:50 +0000
Date: Tue, 25 Jun 2024 20:39:50 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>, Christoph Hellwig <hch@lst.de>,
	oe-lkp@lists.linux.dev, lkp@intel.com, Jens Axboe <axboe@kernel.dk>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
	linux-block@vger.kernel.org, linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	nvdimm@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, ying.huang@intel.com,
	feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [axboe-block:for-next] [block]  1122c0c1cc:  aim7.jobs-per-min
 22.6% improvement
Message-ID: <ZnuNhkH26nZi8fz6@infradead.org>
References: <202406250948.e0044f1d-oliver.sang@intel.com>
 <ZnqGf49cvy6W-xWf@infradead.org>
 <Znt4qTr/NdeIPyNp@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Znt4qTr/NdeIPyNp@xsang-OptiPlex-9020>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Gfzn71FJ33K.A.yVDD.aG5emB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3083
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZnuNhkH26nZi8fz6@infradead.org
Resent-Date: Wed, 26 Jun 2024 03:57:14 +0000 (UTC)

On Wed, Jun 26, 2024 at 10:10:49AM +0800, Oliver Sang wrote:
> I'm not sure I understand this test request. as in title, we see a good
> improvement of aim7 for 1122c0c1cc, and we didn't observe other issues for
> this commit.

The improvement suggests we are not sending cache flushes when we should
send them, or at least just handle them in md.

> do you mean this improvement is not expected or exposes some problems instead?
> then by below patch, should the performance back to the level of parent of
> 1122c0c1cc?
> 
> sure! it's our great pleasure to test your patches. I noticed there are
> [1]
> https://lore.kernel.org/all/20240625110603.50885-2-hch@lst.de/
> which includes "[PATCH 1/7] md: set md-specific flags for all queue limits"
> [2]
> https://lore.kernel.org/all/20240625145955.115252-2-hch@lst.de/
> which includes "[PATCH 1/8] md: set md-specific flags for all queue limits"
> 
> which one you suggest us to test?
> do we only need to apply the first patch "md: set md-specific flags for all queue limits"
> upon 1122c0c1cc?
> then is the expectation the performance back to parent of 1122c0c1cc?

Either just the patch in reply or the entire [2] series would be fine.

Thanks!

