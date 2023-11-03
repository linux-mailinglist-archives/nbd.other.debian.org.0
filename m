Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 716FF7DFFC0
	for <lists+nbd@lfdr.de>; Fri,  3 Nov 2023 09:30:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 541812067F; Fri,  3 Nov 2023 08:30:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Nov  3 08:30:13 2023
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=4.0 tests=CC_TOO_MANY,FOURLA,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8B635206B5
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Nov 2023 08:13:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, FOURLA=0.1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Sx4SkDFuzLbq for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Nov 2023 08:12:58 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id ADD5F2067F
	for <nbd@other.debian.org>; Fri,  3 Nov 2023 08:12:55 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id A6DFB67373; Fri,  3 Nov 2023 09:12:51 +0100 (CET)
Date: Fri, 3 Nov 2023 09:12:51 +0100
From: Christoph Hellwig <hch@lst.de>
To: Li Lingfeng <lilingfeng@huaweicloud.com>
Cc: josef@toxicpanda.com, linux-kernel@vger.kernel.org, hch@lst.de,
	linux-block@vger.kernel.org, nbd@other.debian.org, axboe@kernel.dk,
	chaitanya.kulkarni@wdc.com, yukuai1@huaweicloud.com,
	houtao1@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com,
	lilingfeng3@huawei.com
Subject: Re: [PATCH] nbd: fix uaf in nbd_open
Message-ID: <20231103081251.GB16854@lst.de>
References: <20231103101334.1750094-1-lilingfeng@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103101334.1750094-1-lilingfeng@huaweicloud.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WNZWJhRyO-N.A.i2F.V-KRlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2666
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20231103081251.GB16854@lst.de
Resent-Date: Fri,  3 Nov 2023 08:30:13 +0000 (UTC)

On Fri, Nov 03, 2023 at 06:13:34PM +0800, Li Lingfeng wrote:
> From: Li Lingfeng <lilingfeng3@huawei.com>
> 
> Commit 4af5f2e03013 ("nbd: use blk_mq_alloc_disk and
> blk_cleanup_disk") cleans up disk by blk_cleanup_disk() and it won't set
> disk->private_data as NULL as before. UAF may be triggered in nbd_open()
> if someone tries to open nbd device right after nbd_put() since refcount
> of nbd device is zero and private_data is not NULL.

I don't think this is the right fix.  nbd needs to move to ->free_disk
to free it's private data.

