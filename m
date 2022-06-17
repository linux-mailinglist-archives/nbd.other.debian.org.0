Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F00554FBD1
	for <lists+nbd@lfdr.de>; Fri, 17 Jun 2022 19:01:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F3642203E0; Fri, 17 Jun 2022 17:01:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 17 17:01:23 2022
Old-Return-Path: <john.garry@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	TO_TOO_MANY,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4E7E520274
	for <lists-other-nbd@bendel.debian.org>; Fri, 17 Jun 2022 16:44:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.319 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.228, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001, TO_TOO_MANY=1, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id MLApdQI_K3jL for <lists-other-nbd@bendel.debian.org>;
	Fri, 17 Jun 2022 16:44:00 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 23B34203E6
	for <nbd@other.debian.org>; Fri, 17 Jun 2022 16:42:42 +0000 (UTC)
Received: from fraeml705-chm.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LPlCq5xZPz67PvV;
	Sat, 18 Jun 2022 00:40:55 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml705-chm.china.huawei.com (10.206.15.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Fri, 17 Jun 2022 18:42:38 +0200
Received: from [10.195.32.202] (10.195.32.202) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 17 Jun 2022 17:42:37 +0100
Message-ID: <a18fa379-5a9b-ff45-3be4-b253efd96a50@huawei.com>
Date: Fri, 17 Jun 2022 17:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 5/5] blk-mq: Drop 'reserved' member of busy_tag_iter_fn
To: Bart Van Assche <bvanassche@acm.org>, <axboe@kernel.dk>,
	<damien.lemoal@opensource.wdc.com>, <hch@lst.de>, <jejb@linux.ibm.com>,
	<martin.petersen@oracle.com>, <hare@suse.de>, <satishkh@cisco.com>,
	<sebaddel@cisco.com>, <kartilak@cisco.com>
CC: <linux-rdma@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-nvme@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-scsi@vger.kernel.org>, <mpi3mr-linuxdrv.pdl@broadcom.com>,
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>
References: <1655463320-241202-1-git-send-email-john.garry@huawei.com>
 <1655463320-241202-6-git-send-email-john.garry@huawei.com>
 <017cae1e-b45f-04fd-d34c-22ae736b28e5@acm.org>
From: John Garry <john.garry@huawei.com>
In-Reply-To: <017cae1e-b45f-04fd-d34c-22ae736b28e5@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.195.32.202]
X-ClientProxiedBy: lhreml740-chm.china.huawei.com (10.201.108.190) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6p_u0_A9uwL.A.r0H.jNLriB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2157
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/a18fa379-5a9b-ff45-3be4-b253efd96a50@huawei.com
Resent-Date: Fri, 17 Jun 2022 17:01:23 +0000 (UTC)

On 17/06/2022 17:33, Bart Van Assche wrote:
> On 6/17/22 03:55, John Garry wrote:
>> We no longer use the 'reserved' member in for any iter function so it
>                                           ^^^^^^
> One of these two words probably should be removed.

Yeah, it's a typo - I can fix it.

> 
>> diff --git a/block/blk-mq-tag.c b/block/blk-mq-tag.c
>> index 2dcd738c6952..b8cc8b41553f 100644
>> --- a/block/blk-mq-tag.c
>> +++ b/block/blk-mq-tag.c
>> @@ -266,7 +266,6 @@ static bool bt_iter(struct sbitmap *bitmap, 
>> unsigned int bitnr, void *data)
>>       struct blk_mq_hw_ctx *hctx = iter_data->hctx;
>>       struct request_queue *q = iter_data->q;
>>       struct blk_mq_tag_set *set = q->tag_set;
>> -    bool reserved = iter_data->reserved;
>>       struct blk_mq_tags *tags;
>>       struct request *rq;
>>       bool ret = true;
>> @@ -276,7 +275,7 @@ static bool bt_iter(struct sbitmap *bitmap, 
>> unsigned int bitnr, void *data)
>>       else
>>           tags = hctx->tags;
>> -    if (!reserved)
>> +    if (!iter_data->reserved)
>>           bitnr += tags->nr_reserved_tags;
>>       /*
>>        * We can hit rq == NULL here, because the tagging functions
> 
> Is the above change really necessary?

It's not totally necessary. Since local variable 'reserved' would now 
only be used once I thought it was better to get rid of it.

I can keep it if you really think that is better.

>> @@ -337,12 +336,11 @@ static bool bt_tags_iter(struct sbitmap *bitmap, 
>> unsigned int bitnr, void *data)
>>   {
>>       struct bt_tags_iter_data *iter_data = data;
>>       struct blk_mq_tags *tags = iter_data->tags;
>> -    bool reserved = iter_data->flags & BT_TAG_ITER_RESERVED;
>>       struct request *rq;
>>       bool ret = true;
>>       bool iter_static_rqs = !!(iter_data->flags & 
>> BT_TAG_ITER_STATIC_RQS);
>> -    if (!reserved)
>> +    if (!(iter_data->flags & BT_TAG_ITER_RESERVED))
>>           bitnr += tags->nr_reserved_tags;
>>       /*
> 
> Same question here: is the above change really necessary?

As above.

Thanks,
john

