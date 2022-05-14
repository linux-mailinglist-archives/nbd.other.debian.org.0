Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEBD526DFA
	for <lists+nbd@lfdr.de>; Sat, 14 May 2022 05:57:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F37A8203DE; Sat, 14 May 2022 03:57:05 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat May 14 03:57:05 2022
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MD5_SHA1_SUM,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 71B0C203DD
	for <lists-other-nbd@bendel.debian.org>; Sat, 14 May 2022 03:39:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.417 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, MD5_SHA1_SUM=-1,
	MIME_CHARSET_FARAWAY=0.02, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-3.247, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HBV-8SNk1FFq for <lists-other-nbd@bendel.debian.org>;
	Sat, 14 May 2022 03:39:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 862B920386
	for <nbd@other.debian.org>; Sat, 14 May 2022 03:39:32 +0000 (UTC)
Received: from kwepemi500011.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L0WQW5THvzGpgL;
	Sat, 14 May 2022 11:36:35 +0800 (CST)
Received: from kwepemm600009.china.huawei.com (7.193.23.164) by
 kwepemi500011.china.huawei.com (7.221.188.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 14 May 2022 11:39:26 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 kwepemm600009.china.huawei.com (7.193.23.164) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 14 May 2022 11:39:26 +0800
Subject: Re: [PROBLEM] nbd requests become stuck when devices watched by
 inotify emit udev uevent changes
To: Josef Bacik <josef@toxicpanda.com>, Matthew Ruffell
	<matthew.ruffell@canonical.com>
CC: Jens Axboe <axboe@kernel.dk>, linux-block <linux-block@vger.kernel.org>,
	nbd <nbd@other.debian.org>, Linux Kernel <linux-kernel@vger.kernel.org>
References: <20220422054224.19527-1-matthew.ruffell@canonical.com>
 <CAEzrpqe=LD3DQcEeLXmmFuq7cX_dAQ6DOCuJYWBoZWKKTmoTzA@mail.gmail.com>
 <CAKAwkKt3yMOOW3NXcE91WkGr+8xj050CYP2pLoQVHt_2wXq=-w@mail.gmail.com>
 <CAKAwkKvfFn18RjupuqGpx4QeAiMYKSq7QUTd3wEL=pkZ+BENpQ@mail.gmail.com>
 <Yn5Zf6lONff1AoOA@localhost.localdomain>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <6efae367-12fa-1a58-7438-1b39dc0d6ef8@huawei.com>
Date: Sat, 14 May 2022 11:39:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <Yn5Zf6lONff1AoOA@localhost.localdomain>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600009.china.huawei.com (7.193.23.164)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <wgM9i3rnP7H.A.wuE.RiyfiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2067
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6efae367-12fa-1a58-7438-1b39dc0d6ef8@huawei.com
Resent-Date: Sat, 14 May 2022 03:57:05 +0000 (UTC)

ÔÚ 2022/05/13 21:13, Josef Bacik Ð´µÀ:
> On Fri, May 13, 2022 at 02:56:18PM +1200, Matthew Ruffell wrote:
>> Hi Josef,
>>
>> Just a friendly ping, I am more than happy to test a patch, if you send it
>> inline in the email, since the pastebin you used expired after 1 day, and I
>> couldn't access it.
>>
>> I came across and tested Yu Kuai's patches [1][2] which are for the same issue,
>> and they indeed fix the hang. Thank you Yu.
>>
>> [1] nbd: don't clear 'NBD_CMD_INFLIGHT' flag if request is not completed
>> https://lists.debian.org/nbd/2022/04/msg00212.html
>>
>> [2] nbd: fix io hung while disconnecting device
>> https://lists.debian.org/nbd/2022/04/msg00207.html
>>
>> I am also happy to test any patches to fix the I/O errors.
>>
> 
> Sorry, you caught me on vacation before and I forgot to reply.  Here's part one
> of the patch I wanted you to try which fixes the io hung part.  Thanks,
> 
> Josef
> 
>   
>>From 0a6123520380cb84de8ccefcccc5f112bce5efb6 Mon Sep 17 00:00:00 2001
> Message-Id: <0a6123520380cb84de8ccefcccc5f112bce5efb6.1652447517.git.josef@toxicpanda.com>
> From: Josef Bacik <josef@toxicpanda.com>
> Date: Sat, 23 Apr 2022 23:51:23 -0400
> Subject: [PATCH] timeout thing
> 
> ---
>   drivers/block/nbd.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 526389351784..ab365c0e9c04 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1314,7 +1314,10 @@ static void nbd_config_put(struct nbd_device *nbd)
>   		kfree(nbd->config);
>   		nbd->config = NULL;
>   
> -		nbd->tag_set.timeout = 0;
> +		/* Reset our timeout to something sane. */
> +		nbd->tag_set.timeout = 30 * HZ;
> +		blk_queue_rq_timeout(nbd->disk->queue, 30 * HZ);
> +
>   		nbd->disk->queue->limits.discard_granularity = 0;
>   		nbd->disk->queue->limits.discard_alignment = 0;
>   		blk_queue_max_discard_sectors(nbd->disk->queue, 0);
> 
Hi, Josef

This seems to try to fix the same problem that I described here:

nbd: fix io hung while disconnecting device
https://lists.debian.org/nbd/2022/04/msg00207.html

There are still some io that are stuck, which means the devcie is
probably still opened. Thus nbd_config_put() can't reach here.
I'm afraid this patch can't fix the io hung.

Matthew, can you try a test with this patch together with my patch below
to comfirm my thought?

nbd: don't clear 'NBD_CMD_INFLIGHT' flag if request is not completed
https://lists.debian.org/nbd/2022/04/msg00212.html.

Thanks,
Kuai

