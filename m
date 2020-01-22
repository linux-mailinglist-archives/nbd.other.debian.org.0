Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C59144A27
	for <lists+nbd@lfdr.de>; Wed, 22 Jan 2020 04:03:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A944F2050D; Wed, 22 Jan 2020 03:03:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan 22 03:03:09 2020
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3F69920509
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Jan 2020 02:45:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.26 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FVGT_m_MULTI_ODD=0.02,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6qzQFHhnRMWf for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Jan 2020 02:45:46 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id AA9C520508
	for <nbd@other.debian.org>; Wed, 22 Jan 2020 02:45:46 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id A014D63E922200D617CC;
	Wed, 22 Jan 2020 10:45:41 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.66) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Wed, 22 Jan 2020
 10:45:40 +0800
Subject: Re: [PATCH] nbd: add a flush_workqueue in nbd_start_device
To: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	<mchristi@redhat.com>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>
References: <20200121124813.13332-1-sunke32@huawei.com>
 <82a3eb7e-883c-a091-feec-27f3937491ab@toxicpanda.com>
 <83d21549-66a0-0e76-89e5-1303c5b19102@kernel.dk>
From: "sunke (E)" <sunke32@huawei.com>
Message-ID: <a180649a-d73b-24ad-14d5-d3ed992bba0d@huawei.com>
Date: Wed, 22 Jan 2020 10:45:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <83d21549-66a0-0e76-89e5-1303c5b19102@kernel.dk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.222.66]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <sKvXI96bJYD.A.mjD.tt7JeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/781
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/a180649a-d73b-24ad-14d5-d3ed992bba0d@huawei.com
Resent-Date: Wed, 22 Jan 2020 03:03:09 +0000 (UTC)



在 2020/1/22 5:25, Jens Axboe 写道:
> On 1/21/20 7:00 AM, Josef Bacik wrote:
>> On 1/21/20 7:48 AM, Sun Ke wrote:
>>> When kzalloc fail, may cause trying to destroy the
>>> workqueue from inside the workqueue.
>>>
>>> If num_connections is m (2 < m), and NO.1 ~ NO.n
>>> (1 < n < m) kzalloc are successful. The NO.(n + 1)
>>> failed. Then, nbd_start_device will return ENOMEM
>>> to nbd_start_device_ioctl, and nbd_start_device_ioctl
>>> will return immediately without running flush_workqueue.
>>> However, we still have n recv threads. If nbd_release
>>> run first, recv threads may have to drop the last
>>> config_refs and try to destroy the workqueue from
>>> inside the workqueue.
>>>
>>> To fix it, add a flush_workqueue in nbd_start_device.
>>>
>>> Fixes: e9e006f5fcf2 ("nbd: fix max number of supported devs")
>>> Signed-off-by: Sun Ke <sunke32@huawei.com>
>>> ---
>>>    drivers/block/nbd.c | 7 ++++++-
>>>    1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>>> index b4607dd96185..dd1f8c2c6169 100644
>>> --- a/drivers/block/nbd.c
>>> +++ b/drivers/block/nbd.c
>>> @@ -1264,7 +1264,12 @@ static int nbd_start_device(struct nbd_device *nbd)
>>>    
>>>    		args = kzalloc(sizeof(*args), GFP_KERNEL);
>>>    		if (!args) {
>>> -			sock_shutdown(nbd);
>>> +			if (i == 0)
>>> +				sock_shutdown(nbd);
>>> +			else {
>>> +				sock_shutdown(nbd);
>>> +				flush_workqueue(nbd->recv_workq);
>>> +			}
>>
>> Just for readability sake why don't we just flush_workqueue()
>> unconditionally, and add a comment so we know why in the future.
> 
> Or maybe just make it:
> 
> 	sock_shutdown(nbd);
> 	if (i)
> 		flush_workqueue(nbd->recv_workq);
> 
> which does the same thing, but is still readable. The current code with
> the shutdown duplication is just a bit odd. Needs a comment either way.
> 

OK, I will improve it in my v2 patch.

Thanks,

Sun Ke

