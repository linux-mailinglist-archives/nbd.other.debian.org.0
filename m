Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1AF7B17F4
	for <lists+nbd@lfdr.de>; Thu, 28 Sep 2023 11:57:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 07D952066A; Thu, 28 Sep 2023 09:57:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 28 09:57:12 2023
Old-Return-Path: <yukuai1@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=CC_TOO_MANY,NICE_REPLY_A,
	RCVD_IN_MSPIKE_H2,RDNS_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9913D204F0
	for <lists-other-nbd@bendel.debian.org>; Thu, 28 Sep 2023 09:41:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.319 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, NICE_REPLY_A=-1.473,
	RCVD_IN_MSPIKE_H2=-0.001, RDNS_NONE=0.793]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eRhzTc_YN72R for <lists-other-nbd@bendel.debian.org>;
	Thu, 28 Sep 2023 09:40:51 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id EABF3204D8
	for <nbd@other.debian.org>; Thu, 28 Sep 2023 09:40:50 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.30.67.143])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Rx7ky4s4Lz4f3nKW
	for <nbd@other.debian.org>; Thu, 28 Sep 2023 17:40:42 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP4 (Coremail) with SMTP id gCh0CgB3BdUbShVlGaViBg--.11343S3;
	Thu, 28 Sep 2023 17:40:44 +0800 (CST)
Subject: Re: [PATCH] nbd: pass nbd_sock to nbd_read_reply() instead of index
To: Ming Lei <ming.lei@redhat.com>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: linan666@huaweicloud.com, josef@toxicpanda.com, axboe@kernel.dk,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org, linan122@huawei.com, yi.zhang@huawei.com,
 houtao1@huawei.com, yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20230911023308.3467802-1-linan666@huaweicloud.com>
 <ZRT7cVFcE6QMHfie@fedora>
 <47669fb6-3700-e327-11af-93a92b0984a0@huaweicloud.com>
 <ZRUt/vAQNGNp6Ugx@fedora>
 <41161d21-299c-3657-6020-0a3a9cf109ec@huaweicloud.com>
 <ZRU/7Bx1ZJSX3Qg3@fedora>
 <60f9a88b-b750-3579-bdfd-5421f2040406@huaweicloud.com>
 <ZRVGWkCzKAVVL9bV@fedora>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <bbadaad4-172e-af7b-2a47-52f7e7c83423@huaweicloud.com>
Date: Thu, 28 Sep 2023 17:40:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ZRVGWkCzKAVVL9bV@fedora>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgB3BdUbShVlGaViBg--.11343S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZr1UXr1UZF4DuFyrKrW7urg_yoWrJF43pF
	4UJF1UCr4UJr1aywsYqw4xWr1Yqw17Kw13Ww1UG347Aryqvr13Ar47GFyF9F9rtr1UXr1j
	qr4UWFy3A348Jr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWr
	Zr1UMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJb
	IYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5DJ6Ra5TM_F.A.OfH.43UFlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2653
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/bbadaad4-172e-af7b-2a47-52f7e7c83423@huaweicloud.com
Resent-Date: Thu, 28 Sep 2023 09:57:13 +0000 (UTC)

Hi,

在 2023/09/28 17:24, Ming Lei 写道:
> On Thu, Sep 28, 2023 at 05:06:40PM +0800, Yu Kuai wrote:
>> Hi,
>>
>> 在 2023/09/28 16:57, Ming Lei 写道:
>>> On Thu, Sep 28, 2023 at 04:55:03PM +0800, Yu Kuai wrote:
>>>> Hi,
>>>>
>>>> 在 2023/09/28 15:40, Ming Lei 写道:
>>>>> On Thu, Sep 28, 2023 at 02:03:28PM +0800, Yu Kuai wrote:
>>>>>> Hi,
>>>>>>
>>>>>> 在 2023/09/28 12:05, Ming Lei 写道:
>>>>>>> On Mon, Sep 11, 2023 at 10:33:08AM +0800, linan666@huaweicloud.com wrote:
>>>>>>>> From: Li Nan <linan122@huawei.com>
>>>>>>>>
>>>>>>>> If a socket is processing ioctl 'NBD_SET_SOCK', config->socks might be
>>>>>>>> krealloc in nbd_add_socket(), and a garbage request is received now, a UAF
>>>>>>>> may occurs.
>>>>>>>>
>>>>>>>>       T1
>>>>>>>>       nbd_ioctl
>>>>>>>>        __nbd_ioctl
>>>>>>>>         nbd_add_socket
>>>>>>>>          blk_mq_freeze_queue
>>>>>>>> 				T2
>>>>>>>>       				recv_work
>>>>>>>>       				 nbd_read_reply
>>>>>>>>       				  sock_xmit
>>>>>>>>          krealloc config->socks
>>>>>>>> 				   def config->socks
>>>>>>>>
>>>>>>>> Pass nbd_sock to nbd_read_reply(). And introduce a new function
>>>>>>>> sock_xmit_recv(), which differs from sock_xmit only in the way it get
>>>>>>>> socket.
>>>>>>>>
>>>>>>>
>>>>>>> I am wondering why not grab queue usage counter before calling nbd_read_reply()
>>>>>>> for avoiding such issue, something like the following change:
>>>>>>>
>>>>>>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>>>>>>> index df1cd0f718b8..09215b605b12 100644
>>>>>>> --- a/drivers/block/nbd.c
>>>>>>> +++ b/drivers/block/nbd.c
>>>>>>> @@ -837,9 +837,6 @@ static void recv_work(struct work_struct *work)
>>>>>>>      	while (1) {
>>>>>>>      		struct nbd_reply reply;
>>>>>>> -		if (nbd_read_reply(nbd, args->index, &reply))
>>>>>>> -			break;
>>>>>>> -
>>>>>>>      		/*
>>>>>>>      		 * Grab .q_usage_counter so request pool won't go away, then no
>>>>>>>      		 * request use-after-free is possible during nbd_handle_reply().
>>>>>>> @@ -852,6 +849,9 @@ static void recv_work(struct work_struct *work)
>>>>>>>      			break;
>>>>>>>      		}
>>>>>>
>>>>>> This break how nbd works, if there is no reply yet, recv_work() will
>>>>>> wait for reply in:
>>>>>>
>>>>>> nbd_read_reply
>>>>>>     sock_xmit
>>>>>>      sock_recvmsg
>>>>>>
>>>>>> After this change, recv_work() will just return if there is no io.
>>>>>
>>>>> OK, got it, thanks for the input.
>>>>>
>>>>> But I feel it isn't necessary & fragile to store one extra reference of nsock in
>>>>> `recv_thread_args`.
>>>>>
>>>>> Just run a quick look, the only potential UAF on config->socks should be recv_work(),
>>>>> so you can retrieve the `nsock` reference at the entry of recv_work(),
>>>>
>>>> I don't understand what you mean retrieve the 'nsock', is following what
>>>> you expected?
>>>>
>>>> blk_queue_enter() -> prevent concurrent with nbd_add_socket
>>>> nsock = config->socks[args->index]
>>>> blk_queue_exit()
>>>
>>> Yeah, turns out you do understand, :-)
>>
>> Ok, I was not sure about this blk_queue_enter(). By the way, this
> 
> blk_queue_enter() isn't exported, but you can grab ->config_lock
> for getting the `nsock`.
> 
>> remind me of what you did to fix uaf of access queue->mq_hctx[] by
>> convert the array to xarray.
>>
>>
>> Maybe it's better to covert config->socks[] to xarray to fix this uaf as
>> well?
> 
> ->socks[idx] is needed in nbd fast path, so xarray may not be one good idea
> since xarray_load() introduces extra load, especially ->socks[] uaf
> should exist in recv_work() very likely. For other cases, the active
> block request holds queue usage counter.

Thanks for the explanation, grab 'config_lock' to get 'nsock' in the
begining sounds good to me.

Kuai

> 
> 
> Thanks,
> Ming
> 
> .
> 

