Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B484340D641
	for <lists+nbd@lfdr.de>; Thu, 16 Sep 2021 11:33:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 57CC9208C0; Thu, 16 Sep 2021 09:33:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 16 09:33:09 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2AE0C208C7
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Sep 2021 09:15:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.247 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qFfHNuH14bSS for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Sep 2021 09:15:02 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E7E29208C6
	for <nbd@other.debian.org>; Thu, 16 Sep 2021 09:15:01 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4H9BGW01Vxz1DGmw;
	Thu, 16 Sep 2021 17:13:55 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Thu, 16 Sep 2021 17:14:56 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Thu, 16 Sep 2021 17:14:56 +0800
Subject: Re: [PATCH v7 6/6] nbd: fix uaf in nbd_handle_reply()
To: Ming Lei <ming.lei@redhat.com>
CC: <josef@toxicpanda.com>, <axboe@kernel.dk>, <hch@infradead.org>,
	<linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yi.zhang@huawei.com>
References: <20210915092010.2087371-1-yukuai3@huawei.com>
 <20210915092010.2087371-7-yukuai3@huawei.com> <YUL6gJhaNy58Il3v@T590>
 <cb03c008-432e-2b4c-c675-ea2e8f9105dd@huawei.com> <YUMJHPa5o74G+RS9@T590>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <c7f56d98-7927-689a-d6c2-f781badf4372@huawei.com>
Date: Thu, 16 Sep 2021 17:14:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YUMJHPa5o74G+RS9@T590>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-8NyOueGpQC.A.TVE.V9wQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1494
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/c7f56d98-7927-689a-d6c2-f781badf4372@huawei.com
Resent-Date: Thu, 16 Sep 2021 09:33:09 +0000 (UTC)

On 2021/09/16 17:06, Ming Lei wrote:
> On Thu, Sep 16, 2021 at 04:47:08PM +0800, yukuai (C) wrote:
>> On 2021/09/16 16:04, Ming Lei wrote:
>>> On Wed, Sep 15, 2021 at 05:20:10PM +0800, Yu Kuai wrote:
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
>>>>    drivers/block/nbd.c | 18 ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>>>> index 9a7bbf8ebe74..3e8b70b5d4f9 100644
>>>> --- a/drivers/block/nbd.c
>>>> +++ b/drivers/block/nbd.c
>>>> @@ -824,6 +824,7 @@ static void recv_work(struct work_struct *work)
>>>>    						     work);
>>>>    	struct nbd_device *nbd = args->nbd;
>>>>    	struct nbd_config *config = nbd->config;
>>>> +	struct request_queue *q = nbd->disk->queue;
>>>>    	struct nbd_sock *nsock;
>>>>    	struct nbd_cmd *cmd;
>>>>    	struct request *rq;
>>>> @@ -834,7 +835,24 @@ static void recv_work(struct work_struct *work)
>>>>    		if (nbd_read_reply(nbd, args->index, &reply))
>>>>    			break;
>>>> +		/*
>>>> +		 * Grab ref of q_usage_counter can prevent request being freed
>>>> +		 * during nbd_handle_reply(). If q_usage_counter is zero, then
>>>> +		 * no request is inflight, which means something is wrong since
>>>> +		 * we expect to find a request to complete here.
>>>> +		 */
>>>
>>> The above comment is wrong, the purpose is simply for avoiding request
>>> pool freed, such as elevator switching won't happen once
>>> ->q_usage_counter is grabbed. So no any request UAF can be triggered
>>> when calling into nbd_handle_reply().
>>
>> Do you mean the comment about q_usage_counter is zero is wrong ?
> 
> How about the following words?
> 
> /*
>   * Grab .q_usage_counter so request pool won't go away, then no request
>   * use-after-free is possible during nbd_handle_reply(). If queue is frozen,
>   * there won't be any inflight requests, we needn't to handle the incoming
>   * garbage message
>   */

Will use these words.

Thanks,
Kuai

