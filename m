Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ED840A680
	for <lists+nbd@lfdr.de>; Tue, 14 Sep 2021 08:12:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E36C220413; Tue, 14 Sep 2021 06:12:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 14 06:12:12 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=4.0 tests=MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A4E0420039
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Sep 2021 05:55:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.25 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.969,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JjLw4JDXBL3W for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Sep 2021 05:55:49 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huawei. - helo: .szxga02-in.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4F8FF2010E
	for <nbd@other.debian.org>; Tue, 14 Sep 2021 05:55:46 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H7pDJ74X3zR5xN;
	Tue, 14 Sep 2021 11:07:12 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Tue, 14 Sep 2021 11:11:13 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Tue, 14 Sep 2021 11:11:06 +0800
Subject: Re: [PATCH v5 5/6] nbd: convert to use blk_mq_find_and_get_req()
To: Ming Lei <ming.lei@redhat.com>
CC: <axboe@kernel.dk>, <josef@toxicpanda.com>, <hch@infradead.org>,
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, <yi.zhang@huawei.com>
References: <20210909141256.2606682-1-yukuai3@huawei.com>
 <20210909141256.2606682-6-yukuai3@huawei.com> <YT/2z4PSeW5oJWMq@T590>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <c6af73a2-f12d-eeef-616e-ae0cdb4f6f2d@huawei.com>
Date: Tue, 14 Sep 2021 11:11:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YT/2z4PSeW5oJWMq@T590>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <iU7ErZa7QLB.A.7OF.80DQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1448
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/c6af73a2-f12d-eeef-616e-ae0cdb4f6f2d@huawei.com
Resent-Date: Tue, 14 Sep 2021 06:12:12 +0000 (UTC)

On 2021/09/14 9:11, Ming Lei wrote:
> On Thu, Sep 09, 2021 at 10:12:55PM +0800, Yu Kuai wrote:
>> blk_mq_tag_to_rq() can only ensure to return valid request in
>> following situation:
>>
>> 1) client send request message to server first
>> submit_bio
>> ...
>>   blk_mq_get_tag
>>   ...
>>   blk_mq_get_driver_tag
>>   ...
>>   nbd_queue_rq
>>    nbd_handle_cmd
>>     nbd_send_cmd
>>
>> 2) client receive respond message from server
>> recv_work
>>   nbd_read_stat
>>    blk_mq_tag_to_rq
>>
>> If step 1) is missing, blk_mq_tag_to_rq() will return a stale
>> request, which might be freed. Thus convert to use
>> blk_mq_find_and_get_req() to make sure the returned request is not
>> freed.
> 
> But NBD_CMD_INFLIGHT has been added for checking if the reply is
> expected, do we still need blk_mq_find_and_get_req() for covering
> this issue? BTW, request and its payload is pre-allocated, so there
> isn't real use-after-free.

Hi, Ming

Checking NBD_CMD_INFLIGHT relied on the request founded by tag is valid,
not the other way round.

nbd_read_stat
  req = blk_mq_tag_to_rq()
  cmd = blk_mq_rq_to_pdu(req)
  mutex_lock(cmd->lock)
  checking NBD_CMD_INFLIGHT

The checking doesn't have any effect on blk_mq_tag_to_rq().

Thanks,
Kuai

