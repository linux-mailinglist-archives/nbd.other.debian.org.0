Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4487C3E3D81
	for <lists+nbd@lfdr.de>; Mon,  9 Aug 2021 03:27:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DFE1B203B7; Mon,  9 Aug 2021 01:27:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug  9 01:27:10 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EE082203AE
	for <lists-other-nbd@bendel.debian.org>; Mon,  9 Aug 2021 01:11:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.282 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Z4yHTb717vmP for <lists-other-nbd@bendel.debian.org>;
	Mon,  9 Aug 2021 01:11:14 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id BD8EE203A2
	for <nbd@other.debian.org>; Mon,  9 Aug 2021 01:11:13 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GjdFH25Hwz84D3;
	Mon,  9 Aug 2021 09:06:11 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 9 Aug 2021 09:11:07 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 9 Aug 2021 09:11:05 +0800
Subject: Re: [PATCH 1/2] blk-mq: add two interfaces to lock/unlock
 blk_mq_tags->lock
To: Bart Van Assche <bvanassche@acm.org>, <axboe@kernel.dk>,
	<josef@toxicpanda.com>, <ming.lei@redhat.com>
CC: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, <yi.zhang@huawei.com>
References: <20210808031752.579882-1-yukuai3@huawei.com>
 <20210808031752.579882-2-yukuai3@huawei.com>
 <1e6b1a1e-eb45-f6c7-a8ce-e534b8cda710@acm.org>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <115d97bf-8c7f-44e5-7665-9f7f2c8c3c2b@huawei.com>
Date: Mon, 9 Aug 2021 09:11:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1e6b1a1e-eb45-f6c7-a8ce-e534b8cda710@acm.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <TuisWOtXgLM.A.8kB.uRIEhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1251
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/115d97bf-8c7f-44e5-7665-9f7f2c8c3c2b@huawei.com
Resent-Date: Mon,  9 Aug 2021 01:27:10 +0000 (UTC)

On 2021/08/09 0:44, Bart Van Assche wrote:
> On 8/7/21 8:17 PM, Yu Kuai wrote:
>> +void blk_mq_tags_lock(struct blk_mq_tags *tags, unsigned long *flags)
>> +{
>> +	spin_lock_irqsave(&tags->lock, *flags);
>> +}
>> +EXPORT_SYMBOL(blk_mq_tags_lock);
>> +
>> +void blk_mq_tags_unlock(struct blk_mq_tags *tags, unsigned long *flags)
>> +{
>> +	spin_unlock_irqrestore(&tags->lock, *flags);
>> +}
>> +EXPORT_SYMBOL(blk_mq_tags_unlock);
> 
> The tag map lock is an implementation detail and hence this lock must
> not be used directly by block drivers. I propose to introduce and export
> a new function to block drivers that does the following:
> * Lock tags->lock.
> * Call blk_mq_tag_to_rq().
> * Check whether the request is in the started state. If so, increment
> its reference count.
> * Unlock tags->lock.

Hi, Bart

Thanks for your advice, will do this in next iteration.

Best regards
Kuai

