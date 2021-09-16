Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B925640DC9E
	for <lists+nbd@lfdr.de>; Thu, 16 Sep 2021 16:21:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8FABB208EE; Thu, 16 Sep 2021 14:21:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 16 14:21:13 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B7AF620063
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Sep 2021 14:05:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.25 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id MHUH2M4aW7kT for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Sep 2021 14:05:52 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1F65920952
	for <nbd@other.debian.org>; Thu, 16 Sep 2021 14:05:51 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H9Jf6474tz8yPn;
	Thu, 16 Sep 2021 22:01:18 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Thu, 16 Sep 2021 22:05:46 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Thu, 16 Sep 2021 22:05:45 +0800
Subject: Re: [patch v8 7/7] nbd: fix uaf in nbd_handle_reply()
To: Ming Lei <ming.lei@redhat.com>
CC: <josef@toxicpanda.com>, <axboe@kernel.dk>, <hch@infradead.org>,
	<linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yi.zhang@huawei.com>
References: <20210916093350.1410403-1-yukuai3@huawei.com>
 <20210916093350.1410403-8-yukuai3@huawei.com> <YUM/cNzr6PTXFVAX@T590>
 <f0a72b72-19c9-f01d-806d-d27f854dea8f@huawei.com> <YUNMtcDYG+Uk/gzO@T590>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <66441ad9-629e-e50b-5d81-67edb79e51f2@huawei.com>
Date: Thu, 16 Sep 2021 22:05:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YUNMtcDYG+Uk/gzO@T590>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Lx4I95hK1IC.A.i-D.ZL1QhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1509
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/66441ad9-629e-e50b-5d81-67edb79e51f2@huawei.com
Resent-Date: Thu, 16 Sep 2021 14:21:13 +0000 (UTC)

On 2021/09/16 21:55, Ming Lei write:
> On Thu, Sep 16, 2021 at 09:10:37PM +0800, yukuai (C) wrote:
>> On 2021/09/16 20:58, Ming Lei wrote:
>>> On Thu, Sep 16, 2021 at 05:33:50PM +0800, Yu Kuai wrote:
>>>> There is a problem that nbd_handle_reply() might access freed request:
>>>>
>>>> 1) At first, a normal io is submitted and completed with scheduler:
>>>>
>>>> internel_tag = blk_mq_get_tag -> get tag from sched_tags
>>>>    blk_mq_rq_ctx_init
>>>>     sched_tags->rq[internel_tag] = sched_tag->static_rq[internel_tag]
>>>> ...
>>>> blk_mq_get_driver_tag
>>>>    __blk_mq_get_driver_tag -> get tag from tags
>>>>    tags->rq[tag] = sched_tag->static_rq[internel_tag]
>>>>
>>>> So, both tags->rq[tag] and sched_tags->rq[internel_tag] are pointing
>>>> to the request: sched_tags->static_rq[internal_tag]. Even if the
>>>> io is finished.
>>>>
>>>> 2) nbd server send a reply with random tag directly:
>>>>
>>>> recv_work
>>>>    nbd_handle_reply
>>>>     blk_mq_tag_to_rq(tags, tag)
>>>>      rq = tags->rq[tag]
>>>>
>>>> 3) if the sched_tags->static_rq is freed:
>>>>
>>>> blk_mq_sched_free_requests
>>>>    blk_mq_free_rqs(q->tag_set, hctx->sched_tags, i)
>>>>     -> step 2) access rq before clearing rq mapping
>>>>     blk_mq_clear_rq_mapping(set, tags, hctx_idx);
>>>>     __free_pages() -> rq is freed here
>>>>
>>>> 4) Then, nbd continue to use the freed request in nbd_handle_reply
>>>>
>>>> Fix the problem by get 'q_usage_counter' before blk_mq_tag_to_rq(),
>>>> thus request is ensured not to be freed because 'q_usage_counter' is
>>>> not zero.
>>>>
>>>> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
>>>> ---
>>>>    drivers/block/nbd.c | 14 ++++++++++++++
>>>>    1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>>>> index 69dc5eac9ad3..b3a47fc6237f 100644
>>>> --- a/drivers/block/nbd.c
>>>> +++ b/drivers/block/nbd.c
>>>> @@ -825,6 +825,7 @@ static void recv_work(struct work_struct *work)
>>>>    						     work);
>>>>    	struct nbd_device *nbd = args->nbd;
>>>>    	struct nbd_config *config = nbd->config;
>>>> +	struct request_queue *q = nbd->disk->queue;
>>>>    	struct nbd_sock *nsock;
>>>>    	struct nbd_cmd *cmd;
>>>>    	struct request *rq;
>>>> @@ -835,7 +836,20 @@ static void recv_work(struct work_struct *work)
>>>>    		if (nbd_read_reply(nbd, args->index, &reply))
>>>>    			break;
>>>> +		/*
>>>> +		 * Grab .q_usage_counter so request pool won't go away, then no
>>>> +		 * request use-after-free is possible during nbd_handle_reply().
>>>> +		 * If queue is frozen, there won't be any inflight requests, we
>>>> +		 * needn't to handle the incoming garbage message.
>>>> +		 */
>>>> +		if (!percpu_ref_tryget(&q->q_usage_counter)) {
>>>> +			dev_err(disk_to_dev(nbd->disk), "%s: no io inflight\n",
>>>> +				__func__);
>>>> +			break;
>>>> +		}
>>>> +
>>>>    		cmd = nbd_handle_reply(nbd, args->index, &reply);
>>>> +		percpu_ref_put(&q->q_usage_counter);
>>>>    		if (IS_ERR(cmd))
>>>>    			break;
>>>
>>> The refcount needs to be grabbed when completing the request because
>>> the request may be completed from other code path, then the request pool
>>> will be freed from that code path when the request is referred.
>>
>> Hi,
>>
>> The request can't complete concurrently, thus put ref here is safe.
>>
>> There used to be a commet here that I tried to explain it... It's fine
>> to me to move it behind anyway.
> 
> Never see such comment. cmd->lock isn't held here, so I believe
> concurrent completion is possible here.
> 

After patch 2, __test_and_clear_bit(NBD_CMD_INFLIGHT) must pass
while cmd->lock is held before completing the request, thus request
completion won't concurrent...

Thanks,
Kuai

