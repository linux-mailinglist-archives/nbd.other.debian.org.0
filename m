Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E00F40A762
	for <lists+nbd@lfdr.de>; Tue, 14 Sep 2021 09:30:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D4A5F20451; Tue, 14 Sep 2021 07:30:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 14 07:30:10 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=4.0 tests=MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7DAB020441
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Sep 2021 07:13:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.25 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.969,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qkh1gnw3cXvJ for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Sep 2021 07:13:47 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 069C52030C
	for <nbd@other.debian.org>; Tue, 14 Sep 2021 07:13:46 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H7vbz4N7rzR1Ml;
	Tue, 14 Sep 2021 15:09:35 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Tue, 14 Sep 2021 15:13:39 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Tue, 14 Sep 2021 15:13:38 +0800
Subject: Re: [PATCH v5 5/6] nbd: convert to use blk_mq_find_and_get_req()
To: Ming Lei <ming.lei@redhat.com>
CC: <axboe@kernel.dk>, <josef@toxicpanda.com>, <hch@infradead.org>,
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, <yi.zhang@huawei.com>
References: <20210909141256.2606682-1-yukuai3@huawei.com>
 <20210909141256.2606682-6-yukuai3@huawei.com> <YT/2z4PSeW5oJWMq@T590>
 <c6af73a2-f12d-eeef-616e-ae0cdb4f6f2d@huawei.com> <YUBE4BJ7+kN1c4l8@T590>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <374c6b37-b4b2-fe01-66be-ca2dbbc283e9@huawei.com>
Date: Tue, 14 Sep 2021 15:13:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YUBE4BJ7+kN1c4l8@T590>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0Zfz9dkJ2KK.A.NPD.C-EQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1454
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/374c6b37-b4b2-fe01-66be-ca2dbbc283e9@huawei.com
Resent-Date: Tue, 14 Sep 2021 07:30:10 +0000 (UTC)

On 2021/09/14 14:44, Ming Lei wrote:
> On Tue, Sep 14, 2021 at 11:11:06AM +0800, yukuai (C) wrote:
>> On 2021/09/14 9:11, Ming Lei wrote:
>>> On Thu, Sep 09, 2021 at 10:12:55PM +0800, Yu Kuai wrote:
>>>> blk_mq_tag_to_rq() can only ensure to return valid request in
>>>> following situation:
>>>>
>>>> 1) client send request message to server first
>>>> submit_bio
>>>> ...
>>>>    blk_mq_get_tag
>>>>    ...
>>>>    blk_mq_get_driver_tag
>>>>    ...
>>>>    nbd_queue_rq
>>>>     nbd_handle_cmd
>>>>      nbd_send_cmd
>>>>
>>>> 2) client receive respond message from server
>>>> recv_work
>>>>    nbd_read_stat
>>>>     blk_mq_tag_to_rq
>>>>
>>>> If step 1) is missing, blk_mq_tag_to_rq() will return a stale
>>>> request, which might be freed. Thus convert to use
>>>> blk_mq_find_and_get_req() to make sure the returned request is not
>>>> freed.
>>>
>>> But NBD_CMD_INFLIGHT has been added for checking if the reply is
>>> expected, do we still need blk_mq_find_and_get_req() for covering
>>> this issue? BTW, request and its payload is pre-allocated, so there
>>> isn't real use-after-free.
>>
>> Hi, Ming
>>
>> Checking NBD_CMD_INFLIGHT relied on the request founded by tag is valid,
>> not the other way round.
>>
>> nbd_read_stat
>>   req = blk_mq_tag_to_rq()
>>   cmd = blk_mq_rq_to_pdu(req)
>>   mutex_lock(cmd->lock)
>>   checking NBD_CMD_INFLIGHT
> 
> Request and its payload is pre-allocated, and either req->ref or cmd->lock can
> serve the same purpose here. Once cmd->lock is held, you can check if the cmd is
> inflight or not. If it isn't inflight, just return -ENOENT. Is there any
> problem to handle in this way?

Hi, Ming

in nbd_read_stat:

1) get a request by tag first
2) get nbd_cmd by the request
3) hold cmd->lock and check if cmd is inflight

If we want to check if the cmd is inflight in step 3), we have to do
setp 1) and 2) first. As I explained in patch 0, blk_mq_tag_to_rq()
can't make sure the returned request is not freed:

nbd_read_stat
			blk_mq_sched_free_requests
			 blk_mq_free_rqs
   blk_mq_tag_to_rq
   -> get rq before clear mapping
			  blk_mq_clear_rq_mapping
			  __free_pages -> rq is freed
   blk_mq_request_started -> UAF


Thanks,
Kuai




