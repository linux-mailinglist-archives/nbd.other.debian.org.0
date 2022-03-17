Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D074F4DC76F
	for <lists+nbd@lfdr.de>; Thu, 17 Mar 2022 14:21:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AA1072023B; Thu, 17 Mar 2022 13:21:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 17 13:21:10 2022
Old-Return-Path: <zhangwensheng5@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,PHONENUMBER,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 441792039C
	for <lists-other-nbd@bendel.debian.org>; Thu, 17 Mar 2022 13:05:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.289 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DIGITS_LETTERS=1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001, PHONENUMBER=1.5,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001,
	RCVD_IN_MSPIKE_WL=0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id V6GRVo5rUaIE for <lists-other-nbd@bendel.debian.org>;
	Thu, 17 Mar 2022 13:05:37 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huawei. - helo: .szxga03-in.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7BE5320398
	for <nbd@other.debian.org>; Thu, 17 Mar 2022 13:05:36 +0000 (UTC)
Received: from dggeme756-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KK6hy4lDNz9smw;
	Thu, 17 Mar 2022 21:01:22 +0800 (CST)
Received: from [10.174.176.103] (10.174.176.103) by
 dggeme756-chm.china.huawei.com (10.3.19.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Thu, 17 Mar 2022 21:05:11 +0800
Message-ID: <8139ea99-09fa-eb84-e9ef-f1fb470b5b88@huawei.com>
Date: Thu, 17 Mar 2022 21:05:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH -next] nbd: fix possible overflow on 'first_minor' in
 nbd_dev_add()
From: "zhangwensheng (E)" <zhangwensheng5@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>
CC: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, <yukuai3@huawei.com>
References: <20220310093224.4002895-1-zhangwensheng5@huawei.com>
 <0e5faf35-5adb-3ea1-9f7f-7c4f61a623b2@huawei.com>
In-Reply-To: <0e5faf35-5adb-3ea1-9f7f-7c4f61a623b2@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.103]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <sCcJxfMWn6G.A.YxG.GXzMiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1735
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/8139ea99-09fa-eb84-e9ef-f1fb470b5b88@huawei.com
Resent-Date: Thu, 17 Mar 2022 13:21:10 +0000 (UTC)

friendly ping...

在 2022/3/11 10:43, zhangwensheng (E) 写道:
> friendly ping...
>
> 在 2022/3/10 17:32, Zhang Wensheng 写道:
>> When 'index' is a big numbers, it may become negative which forced
>> to 'int'. then 'index << part_shift' might overflow to a positive
>> value that is not greater than '0xfffff', then sysfs might complains
>> about duplicate creation. Because of this, move the 'index' judgment
>> to the front will fix it and be better.
>>
>> Fixes: b0d9111a2d53 ("nbd: use an idr to keep track of nbd devices")
>> Fixes: 940c264984fd ("nbd: fix possible overflow for 'first_minor' in 
>> nbd_dev_add()")
>> Signed-off-by: Zhang Wensheng <zhangwensheng5@huawei.com>
>> ---
>>   drivers/block/nbd.c | 24 ++++++++++++------------
>>   1 file changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> index 5a1f98494ddd..b3cdfc0ffb98 100644
>> --- a/drivers/block/nbd.c
>> +++ b/drivers/block/nbd.c
>> @@ -1800,17 +1800,6 @@ static struct nbd_device *nbd_dev_add(int 
>> index, unsigned int refs)
>>       refcount_set(&nbd->refs, 0);
>>       INIT_LIST_HEAD(&nbd->list);
>>       disk->major = NBD_MAJOR;
>> -
>> -    /* Too big first_minor can cause duplicate creation of
>> -     * sysfs files/links, since index << part_shift might overflow, or
>> -     * MKDEV() expect that the max bits of first_minor is 20.
>> -     */
>> -    disk->first_minor = index << part_shift;
>> -    if (disk->first_minor < index || disk->first_minor > MINORMASK) {
>> -        err = -EINVAL;
>> -        goto out_free_work;
>> -    }
>> -
>>       disk->minors = 1 << part_shift;
>>       disk->fops = &nbd_fops;
>>       disk->private_data = nbd;
>> @@ -1915,8 +1904,19 @@ static int nbd_genl_connect(struct sk_buff 
>> *skb, struct genl_info *info)
>>       if (!netlink_capable(skb, CAP_SYS_ADMIN))
>>           return -EPERM;
>>   -    if (info->attrs[NBD_ATTR_INDEX])
>> +    if (info->attrs[NBD_ATTR_INDEX]) {
>>           index = nla_get_u32(info->attrs[NBD_ATTR_INDEX]);
>> +
>> +        /*
>> +         * Too big first_minor can cause duplicate creation of
>> +         * sysfs files/links, since index << part_shift might 
>> overflow, or
>> +         * MKDEV() expect that the max bits of first_minor is 20.
>> +         */
>> +        if (index < 0 || index > MINORMASK >> part_shift) {
>> +            printk(KERN_ERR "nbd: illegal input index %d\n", index);
>> +            return -EINVAL;
>> +        }
>> +    }
>>       if (!info->attrs[NBD_ATTR_SOCKETS]) {
>>           printk(KERN_ERR "nbd: must specify at least one socket\n");
>>           return -EINVAL;
> .

