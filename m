Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6504C57EB95
	for <lists+nbd@lfdr.de>; Sat, 23 Jul 2022 04:51:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8F1AD20582; Sat, 23 Jul 2022 02:51:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Jul 23 02:51:10 2022
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1B9FD20579
	for <lists-other-nbd@bendel.debian.org>; Sat, 23 Jul 2022 02:33:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.291 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ziOSxrbybuQz for <lists-other-nbd@bendel.debian.org>;
	Sat, 23 Jul 2022 02:33:47 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 1144 seconds by postgrey-1.36 at bendel; Sat, 23 Jul 2022 02:33:47 UTC
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3F76D2051D
	for <nbd@other.debian.org>; Sat, 23 Jul 2022 02:33:47 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LqVC62XznzWf1x;
	Sat, 23 Jul 2022 10:10:42 +0800 (CST)
Received: from kwepemm600009.china.huawei.com (7.193.23.164) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 23 Jul 2022 10:14:32 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 kwepemm600009.china.huawei.com (7.193.23.164) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 23 Jul 2022 10:14:31 +0800
Subject: Re: [PATCH] nbd: add missing definition of pr_fmt
To: Yu Kuai <yukuai1@huaweicloud.com>, Joe Perches <joe@perches.com>,
	<josef@toxicpanda.com>, <axboe@kernel.dk>, <houtao1@huawei.com>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yi.zhang@huawei.com>
References: <20220706093320.1962871-1-yukuai1@huaweicloud.com>
 <853a5164-78cf-1ccb-8e18-cff5b5bce4ff@huaweicloud.com>
 <49a8099eb7dd01e9d2d190056171341d87cd442b.camel@perches.com>
 <0dba2f0c-ba02-853e-60e7-873eabedcd80@huaweicloud.com>
From: Yu Kuai <yukuai3@huawei.com>
Message-ID: <4e6a80cb-63fa-660c-8acf-f25062800238@huawei.com>
Date: Sat, 23 Jul 2022 10:14:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0dba2f0c-ba02-853e-60e7-873eabedcd80@huaweicloud.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600009.china.huawei.com (7.193.23.164)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Yzadec5qyUB.A.FaF.eI22iB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2199
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/4e6a80cb-63fa-660c-8acf-f25062800238@huawei.com
Resent-Date: Sat, 23 Jul 2022 02:51:10 +0000 (UTC)

Hi!

在 2022/07/20 19:46, Yu Kuai 写道:
> Hi !
> 
> 在 2022/07/18 22:32, Joe Perches 写道:
>> On Mon, 2022-07-18 at 21:52 +0800, Yu Kuai wrote:
>>> 在 2022/07/06 17:33, Yu Kuai 写道:
>>>> From: Yu Kuai <yukuai3@huawei.com>
>>>>
>>>> commit 1243172d5894 ("nbd: use pr_err to output error message") tries
>>>> to define pr_fmt and use short pr_err() to output error message,
>>>> however, the definition is missed.
>>> friendly ping ...
>> []
>>>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> []
>>>> @@ -44,6 +44,9 @@
>>>>    #include <linux/nbd-netlink.h>
>>>>    #include <net/genetlink.h>
>>>> +#undef pr_fmt
>>>> +#define pr_fmt(fmt) "nbd: " fmt
>>>> +

I tried to remove the #undef:

--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -44,7 +44,6 @@
  #include <linux/nbd-netlink.h>
  #include <net/genetlink.h>

  #define pr_fmt(fmt) "nbd: " fmt

And then following warning is triggered:

drivers/block/nbd.c:47: warning: "pr_fmt" redefined
    47 | #define pr_fmt(fmt) "nbd: " fmt

It semms that keeping that #undef is the right thing to do.

Thanks,
Kuai
>> Typically, this #define is place before all #include lines
>> so there is no need for an #undef
> 
> Thanks for you advice, I'll do that in v2.
> 
> Kuai
> 
> .
> 

