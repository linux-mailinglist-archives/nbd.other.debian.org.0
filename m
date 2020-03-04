Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 170C7178849
	for <lists+nbd@lfdr.de>; Wed,  4 Mar 2020 03:27:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AE77D2019C; Wed,  4 Mar 2020 02:27:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar  4 02:27:09 2020
Old-Return-Path: <yuyufen@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 603612017B
	for <lists-other-nbd@bendel.debian.org>; Wed,  4 Mar 2020 02:10:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.78 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id NzjFrH3-yWkI for <lists-other-nbd@bendel.debian.org>;
	Wed,  4 Mar 2020 02:10:14 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 05C9C20172
	for <nbd@other.debian.org>; Wed,  4 Mar 2020 02:10:13 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 1DC294C4CB9512ADFBC6;
	Wed,  4 Mar 2020 10:10:07 +0800 (CST)
Received: from [10.173.220.74] (10.173.220.74) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 4 Mar 2020 10:10:05 +0800
Subject: Re: [PATCH] nbd: make starting request more reasonable
To: Josef Bacik <josef@toxicpanda.com>, <axboe@kernel.dk>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>
References: <20200303130843.12065-1-yuyufen@huawei.com>
 <2976065c-ae72-08d4-32ca-89b0f24ded74@toxicpanda.com>
From: Yufen Yu <yuyufen@huawei.com>
Message-ID: <5ef229b8-bd78-b635-a01f-0e6e06bdbf4e@huawei.com>
Date: Wed, 4 Mar 2020 10:10:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <2976065c-ae72-08d4-32ca-89b0f24ded74@toxicpanda.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.220.74]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xYlfbd7J66D.A.Z9F.9HxXeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/846
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5ef229b8-bd78-b635-a01f-0e6e06bdbf4e@huawei.com
Resent-Date: Wed,  4 Mar 2020 02:27:09 +0000 (UTC)

Hi, Josef

On 2020/3/4 5:18, Josef Bacik wrote:
> On 3/3/20 8:08 AM, Yufen Yu wrote:
>> Our test robot reported a warning for refcount_dec trying to decrease
>> value '0'. The reason is that blk_mq_dispatch_rq_list() try to complete
>> the failed request from nbd driver, while the request have finished in
>> nbd timeout handle function. The race as following:
>>
>> CPU1                             CPU2
>>
>> //req->ref = 1
>> blk_mq_dispatch_rq_list
>> nbd_queue_rq
>>    nbd_handle_cmd
>>      blk_mq_start_request
>>                                   blk_mq_check_expired
>>                                     //req->ref = 2
>>                                     blk_mq_rq_timed_out
>>                                       nbd_xmit_timeout
>>                                         blk_mq_complete_request
>>                                           //req->ref = 1
>>                                           refcount_dec_and_test(&req->ref)
>>
>>                                     refcount_dec_and_test(&req->ref)
>>                                     //req->ref = 0
>>                                       __blk_mq_free_request(req)
>>    ret = BLK_STS_IOERR
>> blk_mq_end_request
>> // req->ref = 0, req have been free
>> refcount_dec_and_test(&rq->ref)
>>
>> In fact, the bug also have been reported by syzbot:
>>    https://lkml.org/lkml/2018/12/5/1308
>>
>> Since the request have been freed by timeout handle, it can be reused
>> by others. Then, blk_mq_end_request() may get the re-initialized request
>> and free it, which is unexpected.
>>
>> To fix the problem, we move blk_mq_start_request() down until the driver
>> will handle the request actully. If .queue_rq return something error in
>> preparation phase, timeout handle may don't need. Thus, moving start
>> request down may be more reasonable. Then, nbd_queue_rq() will not return
>> BLK_STS_IOERR after starting request.
>>
> 
> This won't work, you have to have the request started if you return an error because of this in blk_mq_dispatch_rq_list >
>                  if (unlikely(ret != BLK_STS_OK)) {
>                          errors++;
>                          blk_mq_end_request(rq, BLK_STS_IOERR);
>                          continue;
>                  }
> 
> The request has to be started before we return an error, pushing it down means we have all of these error cases where we haven't started the reques
IMO, the reason that we need to start request after issuing is for timeout
handle function could trace the request. Here, we should make sure the request
started before the driver process (e.g sock_xmit()). Right?

Before that, if something errors occur in nbd_handle_cmd(), like -EIO, -EINVAL,
that means the request have not actually been handled. So, we also don't need
timeout handler trace it. And the dispatcher function blk_mq_dispatch_rq_list()
or blk_mq_try_issue_directly() is responsible for ending the request.

BTW, other drivers, such as nvme_queue_rq(), scsi_queue_rq(), also start request
before processing it actually. If I get it wrong, please point it out.

Thanks,
Yufen


