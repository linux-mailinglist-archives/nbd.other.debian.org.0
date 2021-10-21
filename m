Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D314362EF
	for <lists+nbd@lfdr.de>; Thu, 21 Oct 2021 15:30:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5DC7B2019C; Thu, 21 Oct 2021 13:30:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Oct 21 13:30:12 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=4.0 tests=MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6470920257
	for <lists-other-nbd@bendel.debian.org>; Thu, 21 Oct 2021 13:13:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.282 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id EJsePDdfUuhQ for <lists-other-nbd@bendel.debian.org>;
	Thu, 21 Oct 2021 13:13:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A097520251
	for <nbd@other.debian.org>; Thu, 21 Oct 2021 13:13:18 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HZnv14Wskz8tqw;
	Thu, 21 Oct 2021 21:11:57 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Thu, 21 Oct 2021 21:13:13 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Thu, 21 Oct 2021 21:13:12 +0800
Subject: Re: [PATCH 0/2] nbd: fix sanity check for first_minor
To: Pavel Skripkin <paskripkin@gmail.com>, <josef@toxicpanda.com>,
	<axboe@kernel.dk>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yi.zhang@huawei.com>,
	<luomeng12@huawei.com>, Christoph Hellwig <hch@lst.de>
References: <20211021122936.758221-1-yukuai3@huawei.com>
 <72fb140d-609b-c035-bdd6-d2b8639c116b@gmail.com>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <17182476-e5bf-f493-9d9b-fedb2d9c8e1a@huawei.com>
Date: Thu, 21 Oct 2021 21:13:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <72fb140d-609b-c035-bdd6-d2b8639c116b@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <OPUun2EQF2P.A.-gB.ktWchB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1557
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/17182476-e5bf-f493-9d9b-fedb2d9c8e1a@huawei.com
Resent-Date: Thu, 21 Oct 2021 13:30:12 +0000 (UTC)

On 2021/10/21 20:35, Pavel Skripkin wrote:
> On 10/21/21 15:29, Yu Kuai wrote:
>> Yu Kuai (2):
>>    nbd: fix max value for 'first_minor'
>>    nbd: fix possible overflow for 'first_minor' in nbd_dev_add()
>>
>>   drivers/block/nbd.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
> 
> Hi, Yu!
> 
> Thank you for the fix, but this wrong check should be just removed, 
> since root case of wrong sysfs file creation was fixed, as Christoph 
> said [1]

Hi, Pavel

Thanks for your response, with the root cause fixed, patch 1 is not
needed anymore. However, the overflow case in patch 2 is still
possible.

Does anyone plan to remove the checking?

Thanks,
Kuai
> 
> 
> 
> 
> [1] https://lore.kernel.org/lkml/20211011073556.GA10735@lst.de/
> 
> 
> 
> With regards,
> Pavel Skripkin
> .
> 

