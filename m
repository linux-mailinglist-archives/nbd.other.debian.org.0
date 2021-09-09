Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A27E14045E1
	for <lists+nbd@lfdr.de>; Thu,  9 Sep 2021 08:57:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5A8A020704; Thu,  9 Sep 2021 06:57:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep  9 06:57:09 2021
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E03F5207DF
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Sep 2021 06:40:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id l0a5Obs-ttEe for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Sep 2021 06:40:39 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id AEF53207A9
	for <nbd@other.debian.org>; Thu,  9 Sep 2021 06:40:39 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0B88D67373; Thu,  9 Sep 2021 08:40:36 +0200 (CEST)
Date: Thu, 9 Sep 2021 08:40:35 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hou Tao <houtao1@huawei.com>
Cc: Christoph Hellwig <hch@lst.de>, Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH v2 3/3] nbd: fix race between nbd_alloc_config() and
 module removal
Message-ID: <20210909064035.GA26290@lst.de>
References: <20210904122519.1963983-1-houtao1@huawei.com> <20210904122519.1963983-4-houtao1@huawei.com> <20210906093051.GC30790@lst.de> <ce3e1ea8-ebda-4372-42ce-e8a4b2d12514@huawei.com> <20210906102521.GA3082@lst.de> <730dae5e-5af8-3554-18bf-e22ff576e2b1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <730dae5e-5af8-3554-18bf-e22ff576e2b1@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <yS3JvDrCxKG.A.baH.FBbOhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1421
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210909064035.GA26290@lst.de
Resent-Date: Thu,  9 Sep 2021 06:57:09 +0000 (UTC)

On Tue, Sep 07, 2021 at 11:04:16AM +0800, Hou Tao wrote:
> Let me explain first. The reason it works is due to genl_lock_all() in netlink code.

Btw, please properly format your mail.  These overly long lines are really
hard to read.

> If the module removal happens before calling try_module_get(), nbd_cleanup() will
> 
> call genl_unregister_family() first, and then genl_lock_all(). genl_lock_all() will
> 
> prevent ops in nbd_connect_genl_ops() from being called, because the calling
> 
> of nbd ops happens in genl_rcv() which needs to acquire cb_lock first.

Good.

> I have checked multiple genl_ops, it seems that the reason why these genl_ops
> 
> don't need try_module_get() is that these ops don't create new object through
> 
> genl_ops and just control it. However genl_family_rcv_msg_dumpit() will try to
> 
> call try_module_get(), but according to the history (6dc878a8ca39 "netlink: add reference of module in netlink_dump_start"),
> 
> it is because inet_diag_handler_cmd() will call __netlink_dump_start().

And now taking a step back:  Why do we even need this extra module
reference?  For the case where nbd_alloc_config is called from nbd_open
we obviously don't need it.  In the case where it is called from
nbd_genl_connect that prevents unloading nbd when there is a configured
but not actually nbd device.  Which isn't reallyed need and counter to
how other drivers work.

Did you try just removing the extra module refcounting?

