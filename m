Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EE818F6B8
	for <lists+nbd@lfdr.de>; Mon, 23 Mar 2020 15:24:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8908E20CAF; Mon, 23 Mar 2020 14:24:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Mar 23 14:24:15 2020
Old-Return-Path: <yuyufen@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1C3A820CA4
	for <lists-other-nbd@bendel.debian.org>; Mon, 23 Mar 2020 14:09:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.28 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vvndKD43d3eX for <lists-other-nbd@bendel.debian.org>;
	Mon, 23 Mar 2020 14:09:02 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CB41B20C9E
	for <nbd@other.debian.org>; Mon, 23 Mar 2020 14:09:01 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id F15DA89CAE8D36E7464F;
	Mon, 23 Mar 2020 22:08:56 +0800 (CST)
Received: from [10.173.220.74] (10.173.220.74) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Mon, 23 Mar 2020 22:08:51 +0800
Subject: Re: [PATCH] nbd: make starting request more reasonable
To: Ming Lei <ming.lei@redhat.com>
CC: <josef@toxicpanda.com>, <axboe@kernel.dk>, <linux-block@vger.kernel.org>,
	<nbd@other.debian.org>, Christoph Hellwig <hch@lst.de>
References: <20200303130843.12065-1-yuyufen@huawei.com>
 <9cdba8b1-f0e5-a079-8d44-0078478dd4d8@huawei.com>
 <20200316153033.GA11016@ming.t460p>
From: Yufen Yu <yuyufen@huawei.com>
Message-ID: <b990c260-ddf6-efa9-0856-9110aa4dd8a4@huawei.com>
Date: Mon, 23 Mar 2020 22:08:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200316153033.GA11016@ming.t460p>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.220.74]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <cZmXCf-e13G.A.s0C.PaMeeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/868
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b990c260-ddf6-efa9-0856-9110aa4dd8a4@huawei.com
Resent-Date: Mon, 23 Mar 2020 14:24:15 +0000 (UTC)

Hi, Ming

On 2020/3/16 23:30, Ming Lei wrote:
> On Mon, Mar 16, 2020 at 08:26:35PM +0800, Yufen Yu wrote:
>> Ping and Cc to more expert in blk-mq.
>>
>> On 2020/3/3 21:08, Yufen Yu wrote:
>>> Our test robot reported a warning for refcount_dec trying to decrease
>>> value '0'. The reason is that blk_mq_dispatch_rq_list() try to complete
>>> the failed request from nbd driver, while the request have finished in
>>> nbd timeout handle function. The race as following:
>>>
>>> CPU1                             CPU2
>>>
>>> //req->ref = 1
>>> blk_mq_dispatch_rq_list
>>> nbd_queue_rq
>>>     nbd_handle_cmd
>>>       blk_mq_start_request
>>>                                    blk_mq_check_expired
>>>                                      //req->ref = 2
>>>                                      blk_mq_rq_timed_out
>>>                                        nbd_xmit_timeout
> 
> This shouldn't happen in reality, given rq->deadline is just updated
> in blk_mq_start_request(), suppose you use the default 30 sec timeout.
> How can the race be triggered in so short time? >
> Could you explain a bit your test case?
>
In fact, this is reported by syzkaller. We have not actually test case.
But, I think nbd driver should not start request in case of failure. So fix it.

Thanks,
Yufen

