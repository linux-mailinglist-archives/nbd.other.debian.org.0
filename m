Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC9740C23F
	for <lists+nbd@lfdr.de>; Wed, 15 Sep 2021 11:00:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C08042072E; Wed, 15 Sep 2021 09:00:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 15 09:00:12 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=4.0 tests=MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6224420756
	for <lists-other-nbd@bendel.debian.org>; Wed, 15 Sep 2021 08:44:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.25 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.969,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1rPl7ENVTb_J for <lists-other-nbd@bendel.debian.org>;
	Wed, 15 Sep 2021 08:44:06 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id BCFF720777
	for <nbd@other.debian.org>; Wed, 15 Sep 2021 08:44:06 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H8YYN0B6Yz8yZR;
	Wed, 15 Sep 2021 16:39:36 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Wed, 15 Sep 2021 16:44:02 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Wed, 15 Sep 2021 16:44:01 +0800
Subject: Re: [PATCH v6 6/6] nbd: fix uaf in nbd_handle_reply()
To: Christoph Hellwig <hch@infradead.org>
CC: <axboe@kernel.dk>, <josef@toxicpanda.com>, <ming.lei@redhat.com>,
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, <yi.zhang@huawei.com>
References: <20210915081537.1684327-1-yukuai3@huawei.com>
 <20210915081537.1684327-7-yukuai3@huawei.com>
 <YUGswNyMnFHxigsW@infradead.org>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <e933a436-52a7-2faa-63f9-3fa3f6eae610@huawei.com>
Date: Wed, 15 Sep 2021 16:44:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YUGswNyMnFHxigsW@infradead.org>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ELiK7swxQxC.A._UE.cYbQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1476
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/e933a436-52a7-2faa-63f9-3fa3f6eae610@huawei.com
Resent-Date: Wed, 15 Sep 2021 09:00:12 +0000 (UTC)

On 2021/09/15 16:20, Christoph Hellwig wrote:
> On Wed, Sep 15, 2021 at 04:15:37PM +0800, Yu Kuai wrote:
>> +++ b/block/blk-core.c
>> @@ -489,6 +489,7 @@ void blk_queue_exit(struct request_queue *q)
>>   {
>>   	percpu_ref_put(&q->q_usage_counter);
>>   }
>> +EXPORT_SYMBOL(blk_queue_exit);
> 
> These needs to be an EXPORT_SYMBOL_GPL.  But more importantly it
> needs to be a separate properly documented patch, and this function
> needs to grow a kerneldoc comment as well.
> 
>> +		/*
>> +		 * Get q_usage_counter can prevent accessing freed request
>> +		 * through blk_mq_tag_to_rq() in nbd_handle_reply(). If
>> +		 * q_usage_counter is zero, then no request is inflight, which
>> +		 * means something is wrong since we expect to find a request to
>> +		 * complete here.
>> +		 */
>> +		if (!percpu_ref_tryget(&q->q_usage_counter)) {
>> +			dev_err(disk_to_dev(nbd->disk), "%s: no io inflight\n",
>> +				__func__);
>> +			break;
>> +		}
> 
> And this needs a properly documented wrapper as well.
> 
>> +
>>   		cmd = nbd_handle_reply(nbd, args->index, &reply);
>> -		if (IS_ERR(cmd))
>> +		if (IS_ERR(cmd)) {
>> +			blk_queue_exit(q);
>>   			break;
>> +		}
>>   
>>   		rq = blk_mq_rq_from_pdu(cmd);
>>   		if (likely(!blk_should_fake_timeout(rq->q)))
>>   			blk_mq_complete_request(rq);
>> +		blk_queue_exit(q);
> 
> That being said I can't say I like how this exposed block layer
> internals.  We don't really need a reference to the queue here
> anywhere, you just use it as a dumb debug check.  If we really want to
> reuse (abuse?) q_usage_counter a helper to just grab a reference and
> immediately drop it might be a better fit.
> .

Hi,

The uaf is because blk_mq_sched_free_requests() can concurrent with
nbd_read_stat(), and hold the ref during nbd_read_stat() can break the
concurrency, thus the ref can't be dropped immediately.

I'll use percpu_ref_put() directly as Ming suggestted.

Thanks,
Kuai

