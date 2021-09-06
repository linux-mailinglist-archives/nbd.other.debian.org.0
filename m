Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 367D24019FB
	for <lists+nbd@lfdr.de>; Mon,  6 Sep 2021 12:42:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0668E213E0; Mon,  6 Sep 2021 10:42:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep  6 10:42:08 2021
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=MURPHY_DRUGS_REL8 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 26B4F213E1
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Sep 2021 10:25:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rzhP6eW22-Vt for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Sep 2021 10:25:25 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9E6242069C
	for <nbd@other.debian.org>; Mon,  6 Sep 2021 10:25:25 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 16A5F67373; Mon,  6 Sep 2021 12:25:22 +0200 (CEST)
Date: Mon, 6 Sep 2021 12:25:21 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hou Tao <houtao1@huawei.com>
Cc: Christoph Hellwig <hch@lst.de>, Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH v2 3/3] nbd: fix race between nbd_alloc_config() and
 module removal
Message-ID: <20210906102521.GA3082@lst.de>
References: <20210904122519.1963983-1-houtao1@huawei.com> <20210904122519.1963983-4-houtao1@huawei.com> <20210906093051.GC30790@lst.de> <ce3e1ea8-ebda-4372-42ce-e8a4b2d12514@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce3e1ea8-ebda-4372-42ce-e8a4b2d12514@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XpB_A-pCZSB.A.McG.ACfNhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1393
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210906102521.GA3082@lst.de
Resent-Date: Mon,  6 Sep 2021 10:42:09 +0000 (UTC)

On Mon, Sep 06, 2021 at 06:08:54PM +0800, Hou Tao wrote:
> >> +	if (!try_module_get(THIS_MODULE))
> >> +		return ERR_PTR(-ENODEV);
> > try_module_get(THIS_MODULE) is an indicator for an unsafe pattern.  If
> > we don't already have a reference it could never close the race.
> >
> > Looking at the callers:
> >
> >  - nbd_open like all block device operations must have a reference
> >    already.
> Yes. nbd_open() has already taken a reference in dentry_open().
> >  - for nbd_genl_connect I'm not an expert, but given that struct
> >    nbd_genl_family has a module member I suspect the networkinh
> >    code already takes a reference.
> 
> That was my original though, but the fact is netlink code doesn't take a module reference
> 
> in genl_family_rcv_msg_doit() and netlink uses genl_lock_all() to serialize between module removal
> 
> and nbd_connect_genl_ops calling, so I think use try_module_get() is OK here.

How it this going to work?  If there was a race you just shortened it,
but it can still happen before you call try_module_get.  So I think we
need to look into how the netlink calling conventions are supposed to
look and understand the issues there first.

