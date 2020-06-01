Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 680341EA399
	for <lists+nbd@lfdr.de>; Mon,  1 Jun 2020 14:15:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4B51D2039C; Mon,  1 Jun 2020 12:15:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun  1 12:15:10 2020
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BB6D620434
	for <lists-other-nbd@bendel.debian.org>; Mon,  1 Jun 2020 11:57:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.678 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rXwkhtbt5J5d for <lists-other-nbd@bendel.debian.org>;
	Mon,  1 Jun 2020 11:57:47 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
X-Greylist: delayed 976 seconds by postgrey-1.36 at bendel; Mon, 01 Jun 2020 11:57:47 UTC
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 044DB20412
	for <nbd@other.debian.org>; Mon,  1 Jun 2020 11:57:46 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id DBA51F7082F7FAC56BB6;
	Mon,  1 Jun 2020 19:41:22 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.221) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Mon, 1 Jun 2020
 19:41:19 +0800
Subject: Re: [v3] nbd: fix potential NULL pointer fault in nbd_genl_disconnect
From: Sun Ke <sunke32@huawei.com>
To: Mike Christie <mchristi@redhat.com>, <josef@toxicpanda.com>,
	<axboe@kernel.dk>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>
References: <20200210073241.41813-1-sunke32@huawei.com>
 <5E418D62.8090102@redhat.com>
 <c3531fc5-73b3-6ef4-816e-97f491f45c18@huawei.com> <5E42D8B1.406@redhat.com>
 <1b1110b2-1db6-9781-89cf-82b1403b1641@huawei.com>
Message-ID: <1123bbfe-bcf5-99a7-6ee5-5cc12b693377@huawei.com>
Date: Mon, 1 Jun 2020 19:41:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1b1110b2-1db6-9781-89cf-82b1403b1641@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.166.215.221]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Rm8azlVgATE.A.8mF.OFP1eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/895
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1123bbfe-bcf5-99a7-6ee5-5cc12b693377@huawei.com
Resent-Date: Mon,  1 Jun 2020 12:15:10 +0000 (UTC)



在 2020/2/12 10:00, sunke (E) 写道:
> 
> 
> 在 2020/2/12 0:39, Mike Christie 写道:
>> On 02/10/2020 10:12 PM, sunke (E) wrote:
>>>
>>>
>>> 在 2020/2/11 1:05, Mike Christie 写道:
>>>> On 02/10/2020 01:32 AM, Sun Ke wrote:
>>>>> Open /dev/nbdX first, the config_refs will be 1 and
>>>>> the pointers in nbd_device are still null. Disconnect
>>>>> /dev/nbdX, then reference a null recv_workq. The
>>>>> protection by config_refs in nbd_genl_disconnect is useless.
>>>>>
>>>>> To fix it, just add a check for a non null task_recv in
>>>>> nbd_genl_disconnect.
>>>>>
>>>>> Signed-off-by: Sun Ke <sunke32@huawei.com>
>>>>> ---
>>>>> v1 -> v2:
>>>>> Add an omitted mutex_unlock.
>>>>>
>>>>> v2 -> v3:
>>>>> Add nbd->config_lock, suggested by Josef.
>>>>> ---
>>>>>    drivers/block/nbd.c | 8 ++++++++
>>>>>    1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>>>>> index b4607dd96185..870b3fd0c101 100644
>>>>> --- a/drivers/block/nbd.c
>>>>> +++ b/drivers/block/nbd.c
>>>>> @@ -2008,12 +2008,20 @@ static int nbd_genl_disconnect(struct sk_buff
>>>>> *skb, struct genl_info *info)
>>>>>                   index);
>>>>>            return -EINVAL;
>>>>>        }
>>>>> +    mutex_lock(&nbd->config_lock);
>>>>>        if (!refcount_inc_not_zero(&nbd->refs)) {
>>>>> +        mutex_unlock(&nbd->config_lock);
>>>>>            mutex_unlock(&nbd_index_mutex);
>>>>>            printk(KERN_ERR "nbd: device at index %d is going down\n",
>>>>>                   index);
>>>>>            return -EINVAL;
>>>>>        }
>>>>> +    if (!nbd->recv_workq) {
>>>>> +        mutex_unlock(&nbd->config_lock);
>>>>> +        mutex_unlock(&nbd_index_mutex);
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +    mutex_unlock(&nbd->config_lock);
>>>>>        mutex_unlock(&nbd_index_mutex);
>>>>>        if (!refcount_inc_not_zero(&nbd->config_refs)) {
>>>>>            nbd_put(nbd);
>>>>>
>>>>
>>>> With my other patch then we will not need this right? It handles your
>>>> case by just being integrated with the existing checks in:
>>>>
>>>> nbd_disconnect_and_put->nbd_clear_sock->sock_shutdown
>>>>
>>>> ...
>>>>
>>>> static void sock_shutdown(struct nbd_device *nbd)
>>>> {
>>>>
>>>> ....
>>>>
>>>>           if (config->num_connections == 0)
>>>>                   return;
>>>>
>>>>
>>>> num_connections is zero for your case since we never did a
>>>> nbd_genl_disconnect so we would return here.
>>>>
>>>>
>>>> .
>>>>
>>> Hi Mike
>>>
>>> Your point is not right totally.
>>>
>>> Yes, config->num_connections is 0 and will return in sock_shutdown. Then
>>> it will back to nbd_disconnect_and_put and do flush_workqueue
>>> (nbd->recv_workq).
>>>
>>> nbd_disconnect_and_put
>>>      ->nbd_clear_sock
>>>          ->sock_shutdown
>>>      ->flush_workqueue
>>>
>>
>> My patch removed that extra flush_workqueue in nbd_disconnect_and_put.
>>
>> The idea of the patch was to move the flush calls to when we do
>> sock_shutdown in the config (connect, disconnect, clear sock) code
>> paths, because that is the time we know we will need to kill the recv
>> workers and wait for them to complete so we know they are not still
>> running when userspace does a new config operation.
>>
> Yes, I see.
> 

Hi Mike

Have you sent your patch?

