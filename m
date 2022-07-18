Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2C25784D8
	for <lists+nbd@lfdr.de>; Mon, 18 Jul 2022 16:09:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 77EEB204CC; Mon, 18 Jul 2022 14:09:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul 18 14:09:06 2022
Old-Return-Path: <yukuai1@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EB398204BE
	for <lists-other-nbd@bendel.debian.org>; Mon, 18 Jul 2022 13:52:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.971 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MIME_CHARSET_FARAWAY=0.02,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 5I6skc7ABSVQ for <lists-other-nbd@bendel.debian.org>;
	Mon, 18 Jul 2022 13:52:43 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huaweicloud. - helo: .dggsgout12.his.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8D37E20499
	for <nbd@other.debian.org>; Mon, 18 Jul 2022 13:52:40 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.30.67.153])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Lmk010f5Mz6PmrR
	for <nbd@other.debian.org>; Mon, 18 Jul 2022 21:51:29 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP3 (Coremail) with SMTP id _Ch0CgAXemmfZdVijUahAw--.40633S3;
	Mon, 18 Jul 2022 21:52:32 +0800 (CST)
Subject: Re: [PATCH] nbd: add missing definition of pr_fmt
To: Yu Kuai <yukuai1@huaweicloud.com>, josef@toxicpanda.com, axboe@kernel.dk,
 houtao1@huawei.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com
References: <20220706093320.1962871-1-yukuai1@huaweicloud.com>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <853a5164-78cf-1ccb-8e18-cff5b5bce4ff@huaweicloud.com>
Date: Mon, 18 Jul 2022 21:52:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20220706093320.1962871-1-yukuai1@huaweicloud.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgAXemmfZdVijUahAw--.40633S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GrWDtrykuF4kJr43GFyrtFb_yoW3Kwb_C3
	s7Zw4xXws3Wr92kr4jyF13ZryFyw4rXrnYqrnIgrZxXFy7ZayxA3Z2ya95Gr47Ga1vq3Z3
	Aa1qvrsrC3WfXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
	r21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUU
	U==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vqyfPjGIuvJ.A.PMC.CmW1iB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2191
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/853a5164-78cf-1ccb-8e18-cff5b5bce4ff@huaweicloud.com
Resent-Date: Mon, 18 Jul 2022 14:09:06 +0000 (UTC)

ÔÚ 2022/07/06 17:33, Yu Kuai Ð´µÀ:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> commit 1243172d5894 ("nbd: use pr_err to output error message") tries
> to define pr_fmt and use short pr_err() to output error message,
> however, the definition is missed.

friendly ping ...
> 
> Fixes: 1243172d5894 ("nbd: use pr_err to output error message")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>   drivers/block/nbd.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 07f3c139a3d7..94a1602adab5 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -44,6 +44,9 @@
>   #include <linux/nbd-netlink.h>
>   #include <net/genetlink.h>
>   
> +#undef pr_fmt
> +#define pr_fmt(fmt) "nbd: " fmt
> +
>   #define CREATE_TRACE_POINTS
>   #include <trace/events/nbd.h>
>   
> 

