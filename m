Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 324EC4097A5
	for <lists+nbd@lfdr.de>; Mon, 13 Sep 2021 17:42:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C98EE203DF; Mon, 13 Sep 2021 15:42:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 13 15:42:23 2021
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=MURPHY_DRUGS_REL8 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A2511203D5
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Sep 2021 15:26:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id c0NQxCaACLHA for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Sep 2021 15:26:02 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 21207203DB
	for <nbd@other.debian.org>; Mon, 13 Sep 2021 15:26:01 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7281F67357; Mon, 13 Sep 2021 17:25:58 +0200 (CEST)
Date: Mon, 13 Sep 2021 17:25:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hou Tao <houtao1@huawei.com>
Cc: Christoph Hellwig <hch@lst.de>, Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH v2 3/3] nbd: fix race between nbd_alloc_config() and
 module removal
Message-ID: <20210913152558.GA3998@lst.de>
References: <20210904122519.1963983-1-houtao1@huawei.com> <20210904122519.1963983-4-houtao1@huawei.com> <20210906093051.GC30790@lst.de> <ce3e1ea8-ebda-4372-42ce-e8a4b2d12514@huawei.com> <20210906102521.GA3082@lst.de> <730dae5e-5af8-3554-18bf-e22ff576e2b1@huawei.com> <20210909064035.GA26290@lst.de> <6434d4e8-984d-97df-34e5-b86a0e69cf58@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6434d4e8-984d-97df-34e5-b86a0e69cf58@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DDOYwd9SUMO.A.U-C.fF3PhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1444
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210913152558.GA3998@lst.de
Resent-Date: Mon, 13 Sep 2021 15:42:23 +0000 (UTC)

On Mon, Sep 13, 2021 at 12:32:37PM +0800, Hou Tao wrote:
> > Did you try just removing the extra module refcounting?
> Yes, removing the module refcounting in nbd_alloc_config() and cleaning
> the nbd_config in nbd_cleanup() also work, but not sure whether or not
> it will break some nbd user-case which depends on the extra module
> reference count. I prefer to keep the extra module refcounting considering
> that loop driver does it as well, so what is your suggestion ?

Can you respin the patch with a comment explaining this in detail
so that the next person tripping over it doesn't have to do the research
again?

