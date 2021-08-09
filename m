Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 511D83E476A
	for <lists+nbd@lfdr.de>; Mon,  9 Aug 2021 16:21:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 102032036C; Mon,  9 Aug 2021 14:21:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug  9 14:21:10 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=FVGT_m_MULTI_ODD,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id ED2212034C
	for <lists-other-nbd@bendel.debian.org>; Mon,  9 Aug 2021 14:04:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.262 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FVGT_m_MULTI_ODD=0.02, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9mXu3cp_DmrO for <lists-other-nbd@bendel.debian.org>;
	Mon,  9 Aug 2021 14:04:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id BEF3920342
	for <nbd@other.debian.org>; Mon,  9 Aug 2021 14:04:39 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GjyRC3s7NzclyL;
	Mon,  9 Aug 2021 22:00:55 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 9 Aug 2021 22:04:33 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 9 Aug 2021 22:04:32 +0800
Subject: Re: [PATCH v2 2/2] nbd: convert to use blk_mq_get_rq_by_tag()
To: Ming Lei <ming.lei@redhat.com>
CC: <axboe@kernel.dk>, <josef@toxicpanda.com>, <bvanassche@acm.org>,
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, <yi.zhang@huawei.com>
References: <20210809030927.1946162-1-yukuai3@huawei.com>
 <20210809030927.1946162-3-yukuai3@huawei.com> <YRDK9tBFscK5ScK8@T590>
 <47e5faa8-f8e5-86db-05a1-559e3b3c04b5@huawei.com> <YRD5krmF/C7JxchE@T590>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <3adf6183-bf40-10cd-b8ed-552120028ca3@huawei.com>
Date: Mon, 9 Aug 2021 22:04:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YRD5krmF/C7JxchE@T590>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zZyAdsQshrM.A.y8B.WnTEhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1258
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/3adf6183-bf40-10cd-b8ed-552120028ca3@huawei.com
Resent-Date: Mon,  9 Aug 2021 14:21:11 +0000 (UTC)

On 2021/08/09 17:46, Ming Lei wrote:
> On Mon, Aug 09, 2021 at 03:08:26PM +0800, yukuai (C) wrote:
>> On 2021/08/09 14:28, Ming Lei wrote:
>>> On Mon, Aug 09, 2021 at 11:09:27AM +0800, Yu Kuai wrote:
>>>> blk_mq_tag_to_rq() might return freed request, use
>>>> blk_mq_get_rq_by_tag() instead.
>>>>
>>>> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
>>>> ---
>>>>    drivers/block/nbd.c | 11 ++++++-----
>>>>    1 file changed, 6 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>>>> index c38317979f74..9e56975a8eee 100644
>>>> --- a/drivers/block/nbd.c
>>>> +++ b/drivers/block/nbd.c
>>>> @@ -713,11 +713,10 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
>>>>    	tag = nbd_handle_to_tag(handle);
>>>>    	hwq = blk_mq_unique_tag_to_hwq(tag);
>>>>    	if (hwq < nbd->tag_set.nr_hw_queues)
>>>> -		req = blk_mq_tag_to_rq(nbd->tag_set.tags[hwq],
>>>> -				       blk_mq_unique_tag_to_tag(tag));
>>>> -	if (!req || !blk_mq_request_started(req)) {
>>>> -		dev_err(disk_to_dev(nbd->disk), "Unexpected reply (%d) %p\n",
>>>> -			tag, req);
>>>> +		req = blk_mq_get_rq_by_tag(nbd->tag_set.tags[hwq],
>>>> +					   blk_mq_unique_tag_to_tag(tag));
>>>> +	if (!req) {
>>>> +		dev_err(disk_to_dev(nbd->disk), "Unexpected reply %d\n", tag);
>>>>    		return ERR_PTR(-ENOENT);
>>>>    	}
>>>>    	trace_nbd_header_received(req, handle);
>>>> @@ -779,6 +778,8 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
>>>>    	}
>>>>    out:
>>>>    	trace_nbd_payload_received(req, handle);
>>>> +	if (req)
>>>> +		blk_mq_put_rq_ref(req);
>>>>    	mutex_unlock(&cmd->lock);
>>>>    	return ret ? ERR_PTR(ret) : cmd;
>>>
>>> After blk_mq_put_rq_ref() returns, this request may have been freed,
>>> so the returned 'cmd' may have been freed too.
>>>
>>> As I replied in your another thread, it is driver's responsibility to
>>> cover race between normal completion and timeout/error handling, that
>>> means the caller of blk_mq_tag_to_rq need to make sure that the request
>>> represented by the passed 'tag' can't be freed.
>>
>> Hi, Ming
>>
>> There are two problems here in nbd, both reported by our syzkaller.
>>
>> The first is that blk_mq_tag_to_rq() returned a freed request, which is
>> because tags->static_rq[] is freed without clearing tags->rq[].
>> Syzkaller log shows that a reply package is sent to client without
>> the client's request package. And this patch is trying to solve this
>> problem.
> 
> It is still driver's problem:
> 
> ->static_rq is freed in blk_mq_free_tag_set() which is called after
> blk_cleanup_disk() returns. Once blk_cleanup_disk() returns, there
> shouldn't be any driver activity, including calling blk_mq_tag_to_rq()
> by passing one invalid tag.
> 

Hi, Ming

I understand if static_rq is freed through blk_mq_free_tag_set(),
drivers should not use static_rq anymore.

By the way, I was thinking about another path:

blk_mq_update_nr_requests
  if (!hctx->sched_tags) -> if this is true
   ret = blk_mq_tag_update_depth(hctx, &hctx->tags, nr, false)
    blk_mq_free_rqs -> static_rq is freed here

If this path concurrent with nbd_read_stat(), nbd_read_stat() can
get a freed request by blk_mq_tag_to_rq(), since tags->lock is not
held.

t1: nbd_read_stat	  t2: blk_mq_update_nr_requests
rq = blk_mq_tag_to_rq()
			  blk_mq_free_rqs

By holding tags->lock, we can check that rq state is idle, and it's
ref is 0.

Thanks
Kuai

