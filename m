Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B900C40BD8F
	for <lists+nbd@lfdr.de>; Wed, 15 Sep 2021 04:12:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5DD7120742; Wed, 15 Sep 2021 02:12:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 15 02:12:10 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A966320723
	for <lists-other-nbd@bendel.debian.org>; Wed, 15 Sep 2021 01:54:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.25 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HegSKZJbFlD0 for <lists-other-nbd@bendel.debian.org>;
	Wed, 15 Sep 2021 01:54:19 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huawei. - helo: .szxga03-in.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C531820730
	for <nbd@other.debian.org>; Wed, 15 Sep 2021 01:54:16 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4H8NXt1jF2z8t84;
	Wed, 15 Sep 2021 09:53:34 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Wed, 15 Sep 2021 09:54:11 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Wed, 15 Sep 2021 09:54:10 +0800
Subject: Re: [PATCH v5 5/6] nbd: convert to use blk_mq_find_and_get_req()
To: Ming Lei <ming.lei@redhat.com>
CC: <axboe@kernel.dk>, <josef@toxicpanda.com>, <hch@infradead.org>,
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, <yi.zhang@huawei.com>
References: <20210909141256.2606682-1-yukuai3@huawei.com>
 <20210909141256.2606682-6-yukuai3@huawei.com> <YT/2z4PSeW5oJWMq@T590>
 <c6af73a2-f12d-eeef-616e-ae0cdb4f6f2d@huawei.com> <YUBE4BJ7+kN1c4l8@T590>
 <374c6b37-b4b2-fe01-66be-ca2dbbc283e9@huawei.com> <YUBTVBioqJ7qas2R@T590>
 <b8301834-5541-76ee-13a9-0fa565fce7e3@huawei.com> <YUCzr2ysb+vJ1x0W@T590>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <8f1849a3-6bf2-6b14-7ef9-4969a9a5425b@huawei.com>
Date: Wed, 15 Sep 2021 09:54:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YUCzr2ysb+vJ1x0W@T590>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JDRchTNHu2G.A.onD.6ZVQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1462
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/8f1849a3-6bf2-6b14-7ef9-4969a9a5425b@huawei.com
Resent-Date: Wed, 15 Sep 2021 02:12:10 +0000 (UTC)

On 2021/09/14 22:37, Ming Lei wrote:
> On Tue, Sep 14, 2021 at 05:19:31PM +0800, yukuai (C) wrote:
>> On 在 2021/09/14 15:46, Ming Lei wrote:
>>
>>> If the above can happen, blk_mq_find_and_get_req() may not fix it too, just
>>> wondering why not take the following simpler way for avoiding the UAF?
>>>
>>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>>> index 5170a630778d..dfa5cce71f66 100644
>>> --- a/drivers/block/nbd.c
>>> +++ b/drivers/block/nbd.c
>>> @@ -795,9 +795,13 @@ static void recv_work(struct work_struct *work)
>>>    						     work);
>>>    	struct nbd_device *nbd = args->nbd;
>>>    	struct nbd_config *config = nbd->config;
>>> +	struct request_queue *q = nbd->disk->queue;
>>>    	struct nbd_cmd *cmd;
>>>    	struct request *rq;
>>> +	if (!percpu_ref_tryget(&q->q_usage_counter))
>>> +                return;
>>> +
>>>    	while (1) {
>>>    		cmd = nbd_read_stat(nbd, args->index);
>>>    		if (IS_ERR(cmd)) {
>>> @@ -813,6 +817,7 @@ static void recv_work(struct work_struct *work)
>>>    		if (likely(!blk_should_fake_timeout(rq->q)))
>>>    			blk_mq_complete_request(rq);
>>>    	}
>>> +	blk_queue_exit(q);
>>>    	nbd_config_put(nbd);
>>>    	atomic_dec(&config->recv_threads);
>>>    	wake_up(&config->recv_wq);
>>>
>>
>> Hi, Ming
>>
>> This apporch is wrong.
>>
>> If blk_mq_freeze_queue() is called, and nbd is waiting for all
>> request to complete. percpu_ref_tryget() will fail here, and deadlock
>> will occur because request can't complete in recv_work().
> 
> No, percpu_ref_tryget() won't fail until ->q_usage_counter is zero, when
> it is perfectly fine to do nothing in recv_work().
> 

Hi Ming

This apporch is a good idea, however we should not get q_usage_counter
in reccv_work(), because It will block freeze queue.

How about get q_usage_counter in nbd_read_stat(), and put in error path
or after request completion?

Thanks
Kuai

