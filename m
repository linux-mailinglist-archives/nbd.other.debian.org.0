Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A32403648
	for <lists+nbd@lfdr.de>; Wed,  8 Sep 2021 10:46:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AC37F20723; Wed,  8 Sep 2021 08:46:44 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep  8 08:46:44 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=4.0 tests=FOURLA,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 12D5E20694
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Sep 2021 08:30:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.486 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id wvsgA2_cFRbc for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Sep 2021 08:30:04 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6C9DF20804
	for <nbd@other.debian.org>; Wed,  8 Sep 2021 08:30:04 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H4FZs2Y91zQrX5;
	Wed,  8 Sep 2021 16:25:57 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Wed, 8 Sep 2021 16:29:58 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Wed, 8 Sep 2021 16:29:57 +0800
Subject: Re: [PATCH v4 2/6] nbd: convert to use blk_mq_find_and_get_req()
To: Ming Lei <ming.lei@redhat.com>
CC: <axboe@kernel.dk>, <josef@toxicpanda.com>, <linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <nbd@other.debian.org>, <yi.zhang@huawei.com>
References: <20210907140154.2134091-1-yukuai3@huawei.com>
 <20210907140154.2134091-3-yukuai3@huawei.com> <YThmhhI1/fZd29b1@T590>
 <e295605c-bc8e-cbb9-ca51-1355fdfc0264@huawei.com> <YThtq154oyROxBj9@T590>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <2cfb6701-6e58-3e13-be85-472437a5b2ed@huawei.com>
Date: Wed, 8 Sep 2021 16:29:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YThtq154oyROxBj9@T590>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6QU-vek1CfB.A.yHE.0hHOhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1413
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2cfb6701-6e58-3e13-be85-472437a5b2ed@huawei.com
Resent-Date: Wed,  8 Sep 2021 08:46:44 +0000 (UTC)

On 2021/09/08 16:00, Ming Lei wrote:
> On Wed, Sep 08, 2021 at 03:37:06PM +0800, yukuai (C) wrote:
>> On 2021/09/08 15:30, Ming Lei wrote:
>>
>>>> +put_req:
>>>> +	if (req)
>>>> +		blk_mq_put_rq_ref(req);
>>>>    	return ret ? ERR_PTR(ret) : cmd;
>>>
>>> After the request's refcnt is dropped, it can be freed immediately, then
>>> one stale command is returned to caller.
>>
>> Hi, Ming
>>
>> It's right this patch leave this problem. Please take a look at patch 3
>> and patch 4, the problem should be fixed with these patches.
> 
> Not see it is addressed in patch 3 & 4, and it is one obvious fault in
> patch 2, please fix it from beginning by moving the refcnt drop
> into recv_work().

Hi, Ming

With patch 3 & 4:

if nbd_read_stat() return a valid cmd, then the refcnt should not drop
to 0 before blk_mq_complete_request() in recv_work().

if nbd_read_stat() failed, it won't be a problem if the request is freed
immediately when refcnt is dropped in nbd_read_stat().

That's why I said that the problem will be fixed.

BTW, if we move the refcnt drop into recv_work, we can only do that if
nbd_read_stat() return a valid cmd. If we get a valid rq and failed in
the following checkings in nbd_read_stat(), it's better to drop the
refcnt in nbd_read_stat().

> 
> BTW, the approach in patch 3 looks fine, which is very similar with
> SCSI's handling.

Thanks for taking time reviewing these patches.
Kuai
> 
> Thanks,
> Ming
> 
> .
> 

