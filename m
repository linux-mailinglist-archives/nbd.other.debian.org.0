Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5B55320B3
	for <lists+nbd@lfdr.de>; Tue, 24 May 2022 04:09:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1BD6B20251; Tue, 24 May 2022 02:09:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 24 02:09:10 2022
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 33E472021D
	for <lists-other-nbd@bendel.debian.org>; Tue, 24 May 2022 01:51:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.118 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DIGITS_LETTERS=1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-3.328, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1bk9TeknP6Ol for <lists-other-nbd@bendel.debian.org>;
	Tue, 24 May 2022 01:51:14 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id DDE7120149
	for <nbd@other.debian.org>; Tue, 24 May 2022 01:51:13 +0000 (UTC)
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L6cXp2hSrzQkKB;
	Tue, 24 May 2022 09:48:10 +0800 (CST)
Received: from kwepemm600009.china.huawei.com (7.193.23.164) by
 kwepemi500013.china.huawei.com (7.221.188.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 24 May 2022 09:51:09 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 kwepemm600009.china.huawei.com (7.193.23.164) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 24 May 2022 09:51:08 +0800
Subject: Re: [PATCH -next v3 3/6] nbd: don't clear 'NBD_CMD_INFLIGHT' flag if
 request is not completed
From: Yu Kuai <yukuai3@huawei.com>
To: Josef Bacik <josef@toxicpanda.com>
CC: <axboe@kernel.dk>, <ming.lei@redhat.com>, <linux-block@vger.kernel.org>,
	<nbd@other.debian.org>, <linux-kernel@vger.kernel.org>, <yi.zhang@huawei.com>
References: <20220521073749.3146892-1-yukuai3@huawei.com>
 <20220521073749.3146892-4-yukuai3@huawei.com>
 <YouWXEcyoBNUXLb7@localhost.localdomain>
 <6a549193-909b-6f6e-532b-99cd2898ad80@huawei.com>
Message-ID: <ee5ee5f2-74ea-cac1-00e1-0645c04893ee@huawei.com>
Date: Tue, 24 May 2022 09:51:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6a549193-909b-6f6e-532b-99cd2898ad80@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600009.china.huawei.com (7.193.23.164)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <QYwEs1ySJ6L.A.RQG.G5DjiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2100
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ee5ee5f2-74ea-cac1-00e1-0645c04893ee@huawei.com
Resent-Date: Tue, 24 May 2022 02:09:11 +0000 (UTC)

在 2022/05/24 9:07, Yu Kuai 写道:
> 在 2022/05/23 22:12, Josef Bacik 写道:
>> On Sat, May 21, 2022 at 03:37:46PM +0800, Yu Kuai wrote:
>>> Otherwise io will hung because request will only be completed if the
>>> cmd has the flag 'NBD_CMD_INFLIGHT'.
>>>
>>> Fixes: 07175cb1baf4 ("nbd: make sure request completion won't 
>>> concurrent")
>>> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
>>> ---
>>>   drivers/block/nbd.c | 18 ++++++++++++++----
>>>   1 file changed, 14 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>>> index 2ee1e376d5c4..a0d0910dae2a 100644
>>> --- a/drivers/block/nbd.c
>>> +++ b/drivers/block/nbd.c
>>> @@ -403,13 +403,14 @@ static enum blk_eh_timer_return 
>>> nbd_xmit_timeout(struct request *req,
>>>       if (!mutex_trylock(&cmd->lock))
>>>           return BLK_EH_RESET_TIMER;
>>> -    if (!__test_and_clear_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
>>> +    if (!test_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
>>>           mutex_unlock(&cmd->lock);
>>>           return BLK_EH_DONE;
>>>       }
>>>       if (!refcount_inc_not_zero(&nbd->config_refs)) {
>>>           cmd->status = BLK_STS_TIMEOUT;
>>> +        __clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
>>>           mutex_unlock(&cmd->lock);
>>>           goto done;
>>>       }
>>> @@ -478,6 +479,7 @@ static enum blk_eh_timer_return 
>>> nbd_xmit_timeout(struct request *req,
>>>       dev_err_ratelimited(nbd_to_dev(nbd), "Connection timed out\n");
>>>       set_bit(NBD_RT_TIMEDOUT, &config->runtime_flags);
>>>       cmd->status = BLK_STS_IOERR;
>>> +    __clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
>>>       mutex_unlock(&cmd->lock);
>>>       sock_shutdown(nbd);
>>>       nbd_config_put(nbd);
>>> @@ -745,7 +747,7 @@ static struct nbd_cmd *nbd_handle_reply(struct 
>>> nbd_device *nbd, int index,
>>>       cmd = blk_mq_rq_to_pdu(req);
>>>       mutex_lock(&cmd->lock);
>>> -    if (!__test_and_clear_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
>>> +    if (!test_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
>>>           dev_err(disk_to_dev(nbd->disk), "Suspicious reply %d 
>>> (status %u flags %lu)",
>>>               tag, cmd->status, cmd->flags);
>>>           ret = -ENOENT;
>>> @@ -854,8 +856,16 @@ static void recv_work(struct work_struct *work)
>>>           }
>>>           rq = blk_mq_rq_from_pdu(cmd);
>>> -        if (likely(!blk_should_fake_timeout(rq->q)))
>>> -            blk_mq_complete_request(rq);
>>> +        if (likely(!blk_should_fake_timeout(rq->q))) {
>>> +            bool complete;
>>> +
>>> +            mutex_lock(&cmd->lock);
>>> +            complete = __test_and_clear_bit(NBD_CMD_INFLIGHT,
>>> +                            &cmd->flags);
>>> +            mutex_unlock(&cmd->lock);
>>> +            if (complete)
>>> +                blk_mq_complete_request(rq);
>>> +        }
>>
>> I'd rather this be handled in nbd_handle_reply.  We should return with it
>> cleared if it's ready to be completed.  Thanks,
> Hi,
> 
> Thanks for your advice, I'll do that in next version. I'll still have to
> hold the lock to set the bit again in case blk_should_fake_timeout()
> pass...

Hi, Josef

I just found out that this way is problematic:
t1:			t2:
recv_work
  nbd_handle_reply
   __clear_bit
			nbd_xmit_timeout
			 test_bit(NBD_CMD_INFLIGHT, &cmd->flags) -> fail
			 return BLK_EH_DONE -> rq can't complete
  blk_should_fake_timeout -> true
  __set_bit

__clear_bit and then __set_bit from recv_work leaves a window, and
concurrent nbd_xmit_timeout() may lead to that request can't be
completed through both timeout and recv_work().

Do you think it's ok to keep the current implementation with some
comments to explain the above scenario?

Thanks,
Kuai

