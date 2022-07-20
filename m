Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D927157B610
	for <lists+nbd@lfdr.de>; Wed, 20 Jul 2022 14:03:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B3CF2203BA; Wed, 20 Jul 2022 12:03:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jul 20 12:03:09 2022
Old-Return-Path: <yukuai1@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=4.0 tests=MURPHY_DRUGS_REL8,NICE_REPLY_A,
	RDNS_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7861A203CB
	for <lists-other-nbd@bendel.debian.org>; Wed, 20 Jul 2022 11:46:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.198 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RDNS_NONE=0.793, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QFrq72KBwLmE for <lists-other-nbd@bendel.debian.org>;
	Wed, 20 Jul 2022 11:46:52 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7A875203D3
	for <nbd@other.debian.org>; Wed, 20 Jul 2022 11:46:52 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.30.67.153])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Lnv5x3DZMzKBFB
	for <nbd@other.debian.org>; Wed, 20 Jul 2022 19:45:41 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP3 (Coremail) with SMTP id _Ch0CgAHamkm69diMo_sAw--.2462S3;
	Wed, 20 Jul 2022 19:46:46 +0800 (CST)
Subject: Re: [PATCH] nbd: add missing definition of pr_fmt
To: Joe Perches <joe@perches.com>, josef@toxicpanda.com, axboe@kernel.dk,
 houtao1@huawei.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com
References: <20220706093320.1962871-1-yukuai1@huaweicloud.com>
 <853a5164-78cf-1ccb-8e18-cff5b5bce4ff@huaweicloud.com>
 <49a8099eb7dd01e9d2d190056171341d87cd442b.camel@perches.com>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <0dba2f0c-ba02-853e-60e7-873eabedcd80@huaweicloud.com>
Date: Wed, 20 Jul 2022 19:46:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <49a8099eb7dd01e9d2d190056171341d87cd442b.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgAHamkm69diMo_sAw--.2462S3
X-Coremail-Antispam: 1UD129KBjvdXoWrur15WF4UCw13WFyUur43trb_yoW3Xwc_uw
	nF9ws7CwnrGFyIyrsFyFW3ZrZIyw48Jr93Xr1a9rnxCa4kXay7AF17A395Gw4DGw4ktFn5
	Cw1qgr13Jw4rWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbzkYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_JFC_Wr1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UGYL9UUUUU=
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JqHjdEWTQnO.A.ffH.97-1iB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2196
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/0dba2f0c-ba02-853e-60e7-873eabedcd80@huaweicloud.com
Resent-Date: Wed, 20 Jul 2022 12:03:09 +0000 (UTC)

Hi !

在 2022/07/18 22:32, Joe Perches 写道:
> On Mon, 2022-07-18 at 21:52 +0800, Yu Kuai wrote:
>> 在 2022/07/06 17:33, Yu Kuai 写道:
>>> From: Yu Kuai <yukuai3@huawei.com>
>>>
>>> commit 1243172d5894 ("nbd: use pr_err to output error message") tries
>>> to define pr_fmt and use short pr_err() to output error message,
>>> however, the definition is missed.
>> friendly ping ...
> []
>>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> []
>>> @@ -44,6 +44,9 @@
>>>    #include <linux/nbd-netlink.h>
>>>    #include <net/genetlink.h>
>>>    
>>> +#undef pr_fmt
>>> +#define pr_fmt(fmt) "nbd: " fmt
>>> +
> Typically, this #define is place before all #include lines
> so there is no need for an #undef

Thanks for you advice, I'll do that in v2.

Kuai

