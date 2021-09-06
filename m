Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7A0401930
	for <lists+nbd@lfdr.de>; Mon,  6 Sep 2021 11:48:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A135C21370; Mon,  6 Sep 2021 09:48:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep  6 09:48:09 2021
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8D9B9212F8
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Sep 2021 09:30:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aAVqj7eQRzwk for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Sep 2021 09:30:55 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id DCAB2212F1
	for <nbd@other.debian.org>; Mon,  6 Sep 2021 09:30:55 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 46FEE67373; Mon,  6 Sep 2021 11:30:52 +0200 (CEST)
Date: Mon, 6 Sep 2021 11:30:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hou Tao <houtao1@huawei.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org, hch@lst.de
Subject: Re: [PATCH v2 3/3] nbd: fix race between nbd_alloc_config() and
 module removal
Message-ID: <20210906093051.GC30790@lst.de>
References: <20210904122519.1963983-1-houtao1@huawei.com> <20210904122519.1963983-4-houtao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210904122519.1963983-4-houtao1@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <uyXP0KTb_MI.A.5jC.ZPeNhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1391
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210906093051.GC30790@lst.de
Resent-Date: Mon,  6 Sep 2021 09:48:09 +0000 (UTC)

On Sat, Sep 04, 2021 at 08:25:19PM +0800, Hou Tao wrote:
> When nbd module is being removing, nbd_alloc_config() may be
> called concurrently by nbd_genl_connect(), although try_module_get()
> will return false, but nbd_alloc_config() doesn't handle it.
> 
> The race may lead to the leak of nbd_config and its related
> resources (e.g, recv_workq) and oops in nbd_read_stat() due
> to the unload of nbd module as shown below:
> 
>   BUG: kernel NULL pointer dereference, address: 0000000000000040
>   Oops: 0000 [#1] SMP PTI
>   CPU: 5 PID: 13840 Comm: kworker/u17:33 Not tainted 5.14.0+ #1
>   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
>   Workqueue: knbd16-recv recv_work [nbd]
>   RIP: 0010:nbd_read_stat.cold+0x130/0x1a4 [nbd]
>   Call Trace:
>    recv_work+0x3b/0xb0 [nbd]
>    process_one_work+0x1ed/0x390
>    worker_thread+0x4a/0x3d0
>    kthread+0x12a/0x150
>    ret_from_fork+0x22/0x30
> 
> Fixing it by checking the return value of try_module_get()
> in nbd_alloc_config(). As nbd_alloc_config() may return ERR_PTR(-ENODEV),
> assign nbd->config only when nbd_alloc_config() succeeds to ensure
> the value of nbd->config is binary (valid or NULL).
> 
> Also adding a debug message to check the reference counter
> of nbd_config during module removal.
> 
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> ---
>  drivers/block/nbd.c | 28 +++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index cedd3648e1a7..fa6c069b79dc 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1473,15 +1473,20 @@ static struct nbd_config *nbd_alloc_config(void)
>  {
>  	struct nbd_config *config;
>  
> +	if (!try_module_get(THIS_MODULE))
> +		return ERR_PTR(-ENODEV);

try_module_get(THIS_MODULE) is an indicator for an unsafe pattern.  If
we don't already have a reference it could never close the race.

Looking at the callers:

 - nbd_open like all block device operations must have a reference
   already.
 - for nbd_genl_connect I'm not an expert, but given that struct
   nbd_genl_family has a module member I suspect the networkinh
   code already takes a reference.

So this should be able to use __module_get.

