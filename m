Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A204340A681
	for <lists+nbd@lfdr.de>; Tue, 14 Sep 2021 08:12:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 71DE8203FB; Tue, 14 Sep 2021 06:12:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 14 06:12:23 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=4.0 tests=DIGITS_LETTERS,
	FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0DAD220342
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Sep 2021 05:56:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.23 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FVGT_m_MULTI_ODD=0.02,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mR-JOS4NA-ay for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Sep 2021 05:56:12 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 83C6C202E9
	for <nbd@other.debian.org>; Tue, 14 Sep 2021 05:56:12 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H7pDg4ZNPz8ySQ;
	Tue, 14 Sep 2021 11:07:31 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Tue, 14 Sep 2021 11:11:57 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Tue, 14 Sep 2021 11:11:56 +0800
Subject: Re: [PATCH v5 2/6] nbd: make sure request completion won't concurrent
To: Ming Lei <ming.lei@redhat.com>
CC: <axboe@kernel.dk>, <josef@toxicpanda.com>, <hch@infradead.org>,
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, <yi.zhang@huawei.com>
References: <20210909141256.2606682-1-yukuai3@huawei.com>
 <20210909141256.2606682-3-yukuai3@huawei.com> <YT/zkdoXG+awaVbm@T590>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <74f3f2d9-fd85-f1d8-1f40-5319e247c5e1@huawei.com>
Date: Tue, 14 Sep 2021 11:11:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YT/zkdoXG+awaVbm@T590>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2XE_xvQ1uKC.A.-QF.H1DQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1449
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/74f3f2d9-fd85-f1d8-1f40-5319e247c5e1@huawei.com
Resent-Date: Tue, 14 Sep 2021 06:12:23 +0000 (UTC)

On 2021/09/14 8:57, Ming Lei wrote:
> On Thu, Sep 09, 2021 at 10:12:52PM +0800, Yu Kuai wrote:
>> commit cddce0116058 ("nbd: Aovid double completion of a request")
>> try to fix that nbd_clear_que() and recv_work() can complete a
>> request concurrently. However, the problem still exists:
>>
>> t1                    t2                     t3
>>
>> nbd_disconnect_and_put
>>   flush_workqueue
>>                        recv_work
>>                         blk_mq_complete_request
>>                          blk_mq_complete_request_remote -> this is true
>>                           WRITE_ONCE(rq->state, MQ_RQ_COMPLETE)
>>                            blk_mq_raise_softirq
>>                                               blk_done_softirq
>>                                                blk_complete_reqs
>>                                                 nbd_complete_rq
>>                                                  blk_mq_end_request
>>                                                   blk_mq_free_request
>>                                                    WRITE_ONCE(rq->state, MQ_RQ_IDLE)
>>    nbd_clear_que
>>     blk_mq_tagset_busy_iter
>>      nbd_clear_req
>>                                                     __blk_mq_free_request
>>                                                      blk_mq_put_tag
>>       blk_mq_complete_request -> complete again
>>
>> There are three places where request can be completed in nbd:
>> recv_work(), nbd_clear_que() and nbd_xmit_timeout(). Since they
>> all hold cmd->lock before completing the request, it's easy to
>> avoid the problem by setting and checking a cmd flag.
>>
>> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
>> ---
>>   drivers/block/nbd.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> index 04861b585b62..550c8dc438ac 100644
>> --- a/drivers/block/nbd.c
>> +++ b/drivers/block/nbd.c
>> @@ -406,7 +406,11 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
>>   	if (!mutex_trylock(&cmd->lock))
>>   		return BLK_EH_RESET_TIMER;
>>   
>> -	__clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
>> +	if (!__test_and_clear_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
>> +		mutex_unlock(&cmd->lock);
>> +		return BLK_EH_DONE;
>> +	}
>> +
>>   	if (!refcount_inc_not_zero(&nbd->config_refs)) {
>>   		cmd->status = BLK_STS_TIMEOUT;
>>   		mutex_unlock(&cmd->lock);
>> @@ -842,7 +846,10 @@ static bool nbd_clear_req(struct request *req, void *data, bool reserved)
>>   
>>   	mutex_lock(&cmd->lock);
>>   	cmd->status = BLK_STS_IOERR;
>> -	__clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
>> +	if (!__test_and_clear_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
>> +		mutex_unlock(&cmd->lock);
>> +		return true;
>> +	}
>>   	mutex_unlock(&cmd->lock);
> 
> If this request has completed from other code paths, ->status shouldn't be
> updated here, maybe it is done successfully.

Hi, Ming

Will change this in next iteration.

Thanks,
Kuai

