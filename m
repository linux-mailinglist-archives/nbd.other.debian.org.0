Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0154019BC
	for <lists+nbd@lfdr.de>; Mon,  6 Sep 2021 12:27:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CA428213E3; Mon,  6 Sep 2021 10:27:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep  6 10:27:09 2021
Old-Return-Path: <houtao1@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4A744213D7
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Sep 2021 10:09:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.486 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ZndL-bECiUZC for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Sep 2021 10:09:06 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CD63821386
	for <nbd@other.debian.org>; Mon,  6 Sep 2021 10:09:05 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H33xl3c6YzVqsq;
	Mon,  6 Sep 2021 18:08:11 +0800 (CST)
Received: from dggpeml500025.china.huawei.com (7.185.36.35) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Mon, 6 Sep 2021 18:08:58 +0800
Received: from [10.174.176.117] (10.174.176.117) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Mon, 6 Sep 2021 18:08:55 +0800
Subject: Re: [PATCH v2 3/3] nbd: fix race between nbd_alloc_config() and
 module removal
To: Christoph Hellwig <hch@lst.de>
CC: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	<linux-block@vger.kernel.org>, <nbd@other.debian.org>
References: <20210904122519.1963983-1-houtao1@huawei.com>
 <20210904122519.1963983-4-houtao1@huawei.com> <20210906093051.GC30790@lst.de>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <ce3e1ea8-ebda-4372-42ce-e8a4b2d12514@huawei.com>
Date: Mon, 6 Sep 2021 18:08:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210906093051.GC30790@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.176.117]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DCqGqIf9W3D.A.rBB.9zeNhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1392
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ce3e1ea8-ebda-4372-42ce-e8a4b2d12514@huawei.com
Resent-Date: Mon,  6 Sep 2021 10:27:09 +0000 (UTC)

Hi,

On 9/6/2021 5:30 PM, Christoph Hellwig wrote:
> On Sat, Sep 04, 2021 at 08:25:19PM +0800, Hou Tao wrote:
>> When nbd module is being removing, nbd_alloc_config() may be
>> called concurrently by nbd_genl_connect(), although try_module_get()
>> will return false, but nbd_alloc_config() doesn't handle it.
>>
>> The race may lead to the leak of nbd_config and its related
>> resources (e.g, recv_workq) and oops in nbd_read_stat() due
>> to the unload of nbd module as shown below:
>>
>>   BUG: kernel NULL pointer dereference, address: 0000000000000040
>>   Oops: 0000 [#1] SMP PTI
>>   CPU: 5 PID: 13840 Comm: kworker/u17:33 Not tainted 5.14.0+ #1
>>   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
>>   Workqueue: knbd16-recv recv_work [nbd]
>>   RIP: 0010:nbd_read_stat.cold+0x130/0x1a4 [nbd]
>>   Call Trace:
>>    recv_work+0x3b/0xb0 [nbd]
>>    process_one_work+0x1ed/0x390
>>    worker_thread+0x4a/0x3d0
>>    kthread+0x12a/0x150
>>    ret_from_fork+0x22/0x30
>>
>> Fixing it by checking the return value of try_module_get()
>> in nbd_alloc_config(). As nbd_alloc_config() may return ERR_PTR(-ENODEV),
>> assign nbd->config only when nbd_alloc_config() succeeds to ensure
>> the value of nbd->config is binary (valid or NULL).
>>
>> Also adding a debug message to check the reference counter
>> of nbd_config during module removal.
>>
>> Signed-off-by: Hou Tao <houtao1@huawei.com>
>> ---
>>  drivers/block/nbd.c | 28 +++++++++++++++++++---------
>>  1 file changed, 19 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> index cedd3648e1a7..fa6c069b79dc 100644
>> --- a/drivers/block/nbd.c
>> +++ b/drivers/block/nbd.c
>> @@ -1473,15 +1473,20 @@ static struct nbd_config *nbd_alloc_config(void)
>>  {
>>  	struct nbd_config *config;
>>  
>> +	if (!try_module_get(THIS_MODULE))
>> +		return ERR_PTR(-ENODEV);
> try_module_get(THIS_MODULE) is an indicator for an unsafe pattern.  If
> we don't already have a reference it could never close the race.
>
> Looking at the callers:
>
>  - nbd_open like all block device operations must have a reference
>    already.
Yes. nbd_open() has already taken a reference in dentry_open().
>  - for nbd_genl_connect I'm not an expert, but given that struct
>    nbd_genl_family has a module member I suspect the networkinh
>    code already takes a reference.

That was my original though, but the fact is netlink code doesn't take a module reference

in genl_family_rcv_msg_doit() and netlink uses genl_lock_all() to serialize between module removal

and nbd_connect_genl_ops calling, so I think use try_module_get() is OK here.

Regards,

Tao


> So this should be able to use __module_get.

> .

