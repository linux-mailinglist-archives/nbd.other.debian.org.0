Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D98BE919ECB
	for <lists+nbd@lfdr.de>; Thu, 27 Jun 2024 07:39:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B7B4B2072C; Thu, 27 Jun 2024 05:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 27 05:39:09 2024
Old-Return-Path: <BATV+b68173646e9cfe1398de+7613+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,JOBS,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 63153205AC
	for <lists-other-nbd@bendel.debian.org>; Thu, 27 Jun 2024 05:23:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.11 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_INVALID=0.1, DKIM_SIGNED=0.1,
	JOBS=1, RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id K_o9rLg6T-qb for <lists-other-nbd@bendel.debian.org>;
	Thu, 27 Jun 2024 05:23:21 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5ACD7205A2
	for <nbd@other.debian.org>; Thu, 27 Jun 2024 05:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/fzE2yWElnzU7XRficmyE9tfka6WnF3hLS24PJakxl4=; b=uzcGPgconVlUhJahqA4o0y4rP2
	YDkQfdW0m0w2u8N8BRaxbwBTF1twTy53aPn4xBPj/AfBrb0WxTzWJH8wD6oR43WzK3V70db4qXtWY
	0IIZI+2mDcUbXHX9Anl5SaO8PZqQtBzUCFGUjAdJ7ExnkxJgGk1kclJpDyt1NPlhJH6k1SD2KJv1r
	Y/aWT38dOOUqqw6WO2aC6zoYnYWj+859j2ETzBrnZoTEbtU0f3blIKoRcb5DyUh8Hm74KMCv5zkZg
	gzrN7RVyue7JLzZcBns6ISX0k4yPom7ZauQBJlbkxj+mZ51Z3qG2KMut3g2uFWJoxlvZFyPWvc2cp
	37dKQmlg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMh93-00000009D8d-4Br2;
	Thu, 27 Jun 2024 04:54:06 +0000
Date: Wed, 26 Jun 2024 21:54:05 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Jens Axboe <axboe@kernel.dk>,
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
Message-ID: <ZnzwbYSaIlT0SIEy@infradead.org>
References: <202406250948.e0044f1d-oliver.sang@intel.com>
 <ZnqGf49cvy6W-xWf@infradead.org>
 <Znt4qTr/NdeIPyNp@xsang-OptiPlex-9020>
 <ZnuNhkH26nZi8fz6@infradead.org>
 <ZnzP+nUrk8+9bANK@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnzP+nUrk8+9bANK@xsang-OptiPlex-9020>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ZAfybL_hpz.A.z6VL.9rPfmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3088
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZnzwbYSaIlT0SIEy@infradead.org
Resent-Date: Thu, 27 Jun 2024 05:39:09 +0000 (UTC)

On Thu, Jun 27, 2024 at 10:35:38AM +0800, Oliver Sang wrote:
> 
> I failed to apply patch in your previous reply to 1122c0c1cc or current tip
> of axboe-block/for-next:
> c1440ed442a58 (axboe-block/for-next) Merge branch 'for-6.11/block' into for-next

That already includes it.

> 
> but it's ok to apply upon next:
> * 0fc4bfab2cd45 (tag: next-20240625) Add linux-next specific files for 20240625
> 
> I've already started the test based on this applyment.
> is the expectation that patch should not introduce performance change comparing
> to 0fc4bfab2cd45?
> 
> or if this applyment is not ok, please just give me guidance. Thanks!

The expectation is that the latest block branch (and thus linux-next)
doesn't see this performance change.

