Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK/WEPFxFmrZmQcAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Wed, 27 May 2026 06:24:17 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA6C5DF264
	for <lists+nbd@lfdr.de>; Wed, 27 May 2026 06:24:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id ED90E20567; Wed, 27 May 2026 04:24:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 27 04:24:15 2026
Old-Return-Path: <yangerkun@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MD5_SHA1_SUM,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CF1472072B
	for <lists-other-nbd@bendel.debian.org>; Wed, 27 May 2026 04:08:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.5 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ZO2GfthX8DlJ for <lists-other-nbd@bendel.debian.org>;
	Wed, 27 May 2026 04:08:51 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 930 seconds by postgrey-1.36 at bendel; Wed, 27 May 2026 04:08:51 UTC
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 240E7206A2
	for <nbd@other.debian.org>; Wed, 27 May 2026 04:08:50 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RB8V7hcKY/bxo8qZrnz1kBrq6dvXt64MiANiM1jN/qA=;
	b=AgM1hy8AkkFrr7j7TZNENvgwImFMEhEgv5mp2KJPAojIU30hL4oyaDtM4+Fx+HfNGvXX5bZ4N
	5349HlitP8quWKsCu0vUUqb7RiIk+x/rkyDbhhpFojiGSH+C/o/QgtEQ9m8PigfH7a5oW2iulK/
	akXY3rPmSvGvQjb0A9SiMmg=
Received: from canpmsgout12.his.huawei.com (unknown [172.19.92.144])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4gQG0S6CVhz1BGLT
	for <nbd@other.debian.org>; Wed, 27 May 2026 11:52:24 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RB8V7hcKY/bxo8qZrnz1kBrq6dvXt64MiANiM1jN/qA=;
	b=AgM1hy8AkkFrr7j7TZNENvgwImFMEhEgv5mp2KJPAojIU30hL4oyaDtM4+Fx+HfNGvXX5bZ4N
	5349HlitP8quWKsCu0vUUqb7RiIk+x/rkyDbhhpFojiGSH+C/o/QgtEQ9m8PigfH7a5oW2iulK/
	akXY3rPmSvGvQjb0A9SiMmg=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gQFqW2pb7znTWb;
	Wed, 27 May 2026 11:44:39 +0800 (CST)
Received: from kwepemf100006.china.huawei.com (unknown [7.202.181.220])
	by mail.maildlp.com (Postfix) with ESMTPS id A4A8940539;
	Wed, 27 May 2026 11:52:36 +0800 (CST)
Received: from [10.174.176.240] (10.174.176.240) by
 kwepemf100006.china.huawei.com (7.202.181.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 27 May 2026 11:52:36 +0800
Message-ID: <9bd7c679-b5b4-4274-95ba-f2e3da1a531e@huawei.com>
Date: Wed, 27 May 2026 11:52:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "nbd: freeze the queue while we're adding
 connections"
From: yangerkun <yangerkun@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>, yangerkun
	<yangerkun@huawei.com>
References: <20260526115253.746625-1-yangerkun@huawei.com>
In-Reply-To: <20260526115253.746625-1-yangerkun@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.240]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf100006.china.huawei.com (7.202.181.220)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <t51OOpmPnrC.A.pmqF.vHnFqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3545
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/9bd7c679-b5b4-4274-95ba-f2e3da1a531e@huawei.com
Resent-Date: Wed, 27 May 2026 04:24:15 +0000 (UTC)
X-Spamd-Result: default: False [-1.11 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:yangerkun@huawei.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[yangerkun@huawei.com,bounce-nbd=lists@other.debian.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,huawei.com:mid,huawei.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[yangerkun@huawei.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[nbd];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2CA6C5DF264
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



在 2026/5/26 19:52, Yang Erkun 写道:
> This reverts commit b98e762e3d71e893b221f871825dc64694cfb258.
> 
> Commit b98e762e3d71 ("nbd: freeze the queue while we're adding
> connections") added blk_mq_freeze_queue/blk_mq_unfreeze_queue in
> nbd_add_socket() to protect krealloc(config->socks) from concurrent I/O
> that could cause a Use-After-Free.
> 
> However, analysis shows that in all current code paths, concurrent I/O
> cannot actually reach nbd_add_socket():
> 
> 1. nbd_genl_connect() path:
>     nbd_add_socket() is called first, and nbd_start_device() -- which
>     starts the queue and enables I/O -- is called only after all sockets
>     have been added. So the freeze/unfreeze runs against an idle queue,
>     marking then waiting on a percpu_ref that is already zero, and then
>     resurrecting it -- a pure no-op that burns an RCU grace period per
>     socket on multi-core systems.
> 
> 2. nbd_ioctl(NBD_SET_SOCK) path:
>     The task_setup check enforces that only the thread which performed
>     the first NBD_SET_SOCK can call NBD_SET_SOCK again. That thread is
>     blocked in NBD_DO_IT's wait_event_interruptible, so it cannot issue
>     another NBD_SET_SOCK concurrently with I/O. Other threads are
>     rejected by the task_setup != current check.

Apologies, but the analysis provided here is inadequate. A 
use-after-free (UAF) can still occur in the following scenario:

task A: ioctl NBD_SET_SOCK => task_setup = A
task B: ioctl NBD_DO_IT    => nbd_start_device_ioctl, nbd can receive IO
task A: ioctl NBD_SET_SOCK => task_setup == A, so racer can happend with
concurrent IO!

This patch is misleading, please disregard it. Sorry once again.

> 
> 3. nbd_genl_reconfigure() does not call nbd_add_socket() at all; it
>     uses nbd_reconnect_socket() which replaces a dead socket in-place
>     without reallocating config->socks.
> 
> Therefore the freeze/unfreeze provides no actual protection in any
> reachable code path, while imposing the cost of blk_mq_freeze_queue
> (percpu_ref_kill + RCU grace period wait + percpu_ref_resurrect) on
> every socket addition during device setup[1].
> 
> Revert the change to eliminate the unnecessary overhead.
> 
> Link: https://lore.kernel.org/all/20260327091223.4147956-1-leo.lilong@huaweicloud.com/ [1]
> Signed-off-by: Yang Erkun <yangerkun@huawei.com>
> ---
>   drivers/block/nbd.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index fe63f3c55d0d..9033d996c9a9 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1245,22 +1245,16 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
>   	struct socket *sock;
>   	struct nbd_sock **socks;
>   	struct nbd_sock *nsock;
> -	unsigned int memflags;
>   	int err;
>   
>   	/* Arg will be cast to int, check it to avoid overflow */
>   	if (arg > INT_MAX)
>   		return -EINVAL;
> +
>   	sock = nbd_get_socket(nbd, arg, &err);
>   	if (!sock)
>   		return err;
>   
> -	/*
> -	 * We need to make sure we don't get any errant requests while we're
> -	 * reallocating the ->socks array.
> -	 */
> -	memflags = blk_mq_freeze_queue(nbd->disk->queue);
> -
>   	if (!netlink && !nbd->task_setup &&
>   	    !test_bit(NBD_RT_BOUND, &config->runtime_flags))
>   		nbd->task_setup = current;
> @@ -1300,12 +1294,9 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
>   	INIT_WORK(&nsock->work, nbd_pending_cmd_work);
>   	socks[config->num_connections++] = nsock;
>   	atomic_inc(&config->live_connections);
> -	blk_mq_unfreeze_queue(nbd->disk->queue, memflags);
> -
>   	return 0;
>   
>   put_socket:
> -	blk_mq_unfreeze_queue(nbd->disk->queue, memflags);
>   	sockfd_put(sock);
>   	return err;
>   }

