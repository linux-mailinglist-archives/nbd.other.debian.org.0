Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C309BC44ECB
	for <lists+nbd@lfdr.de>; Mon, 10 Nov 2025 05:42:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 51D2120505; Mon, 10 Nov 2025 04:42:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 10 04:42:14 2025
Old-Return-Path: <zhengqixing@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8EE4F204CA
	for <lists-other-nbd@bendel.debian.org>; Mon, 10 Nov 2025 04:26:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.898 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rQiFIlNy1LDa for <lists-other-nbd@bendel.debian.org>;
	Mon, 10 Nov 2025 04:26:04 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 1190 seconds by postgrey-1.36 at bendel; Mon, 10 Nov 2025 04:26:03 UTC
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id DC2F9204AB
	for <nbd@other.debian.org>; Mon, 10 Nov 2025 04:26:03 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wX2mOYwb+MegAjrRKvNO6FT3ETpFUSjsdZcrt+5LHv8=;
	b=a7USyjRmWWpR1Be6G2EEy/lNN8xVjlyspc1/0Xxm01+J8s7yn6Kw2b3duTCu+1MLx/ICbc57g
	l1m98FTsiy4BAKaDuAW7NI6vKcrjYkMFBLkPAU627Dgf3CiqcVnO1L+JnYAXNDjiZdQ7vjqIE2R
	nsfX435YOMYhWvz6he1Z0Z0=
Received: from canpmsgout08.his.huawei.com (unknown [172.19.92.156])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4d4bgH75SXz1BFwX
	for <nbd@other.debian.org>; Mon, 10 Nov 2025 12:05:47 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wX2mOYwb+MegAjrRKvNO6FT3ETpFUSjsdZcrt+5LHv8=;
	b=a7USyjRmWWpR1Be6G2EEy/lNN8xVjlyspc1/0Xxm01+J8s7yn6Kw2b3duTCu+1MLx/ICbc57g
	l1m98FTsiy4BAKaDuAW7NI6vKcrjYkMFBLkPAU627Dgf3CiqcVnO1L+JnYAXNDjiZdQ7vjqIE2R
	nsfX435YOMYhWvz6he1Z0Z0=
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4d4bd33h7wzmV7F;
	Mon, 10 Nov 2025 12:03:51 +0800 (CST)
Received: from kwepemh100003.china.huawei.com (unknown [7.202.181.85])
	by mail.maildlp.com (Postfix) with ESMTPS id C737B180043;
	Mon, 10 Nov 2025 12:05:29 +0800 (CST)
Received: from [10.174.178.72] (10.174.178.72) by
 kwepemh100003.china.huawei.com (7.202.181.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 10 Nov 2025 12:05:28 +0800
Message-ID: <f5a2e5e7-d46e-45fa-bd28-c58bd7134d8e@huawei.com>
Date: Mon, 10 Nov 2025 12:05:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nbd: defer config put in recv_work
To: Lizhi Xu <lizhi.xu@windriver.com>, <zhengqixing@huaweicloud.com>
CC: <axboe@kernel.dk>, <houtao1@huawei.com>, <josef@toxicpanda.com>,
	<linan122@h-partners.com>, <linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <nbd@other.debian.org>, <xiubli@redhat.com>,
	<yangerkun@huawei.com>, <yi.zhang@huawei.com>
References: <20251108070202.1816004-1-zhengqixing@huaweicloud.com>
 <20251110005453.546675-1-lizhi.xu@windriver.com>
From: Zheng Qixing <zhengqixing@huawei.com>
In-Reply-To: <20251110005453.546675-1-lizhi.xu@windriver.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.72]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemh100003.china.huawei.com (7.202.181.85)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xMNW6oMOTiD.A.TqND.m0WEpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3469
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f5a2e5e7-d46e-45fa-bd28-c58bd7134d8e@huawei.com
Resent-Date: Mon, 10 Nov 2025 04:42:14 +0000 (UTC)

Hi,


在 2025/11/10 8:54, Lizhi Xu 写道:
> On Sat,  8 Nov 2025 15:02:02 +0800, Zheng Qixing wrote:
>> Reported-by: syzbot+56fbf4c7ddf65e95c7cc@syzkaller.appspotmail.com
>> Closes: https://lore.kernel.org/all/6907edce.a70a0220.37351b.0014.GAE@google.com/T/
>> Fixes: 87aac3a80af5 ("nbd: make the config put is called before the notifying the waiter")
>> Depends-on: e2daec488c57 ("nbd: Fix hungtask when nbd_config_put")
>> Signed-off-by: Zheng Qixing <zhengqixing@huawei.com>
>> ---
>>   drivers/block/nbd.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> index a853c65ac65d..215fc18115b7 100644
>> --- a/drivers/block/nbd.c
>> +++ b/drivers/block/nbd.c
>> @@ -1024,9 +1024,9 @@ static void recv_work(struct work_struct *work)
>>   	nbd_mark_nsock_dead(nbd, nsock, 1);
>>   	mutex_unlock(&nsock->tx_lock);
>>
>> -	nbd_config_put(nbd);
>>   	atomic_dec(&config->recv_threads);
>>   	wake_up(&config->recv_wq);
>> +	nbd_config_put(nbd);
>>   	kfree(args);
>>   }
> This only makes the problem more hidden, and that's far from enough.
> I tested the same patch on syzbot on October 3rd before you did; you
> can check it out here [1].
>
> [1] https://syzkaller.appspot.com/bug?extid=56fbf4c7ddf65e95c7cc


The same patch was triggered by eslam.medhat1993 on Nov 5 via syzbot,

but it didn't produce the same stack trace. Is this stack trace necessarily

related to the UAF issue in nbd? It seems more likely to be a memory

corruption problem, but I'm not certain.


In addition, this issue arises from the mixed use of netlink and ioctl. 
Since

user-space tools generally do not mix these two interfaces, I believe a 
simple

solution along these lines could effectively avoid the UAF problem.


Regards,

Qixing


