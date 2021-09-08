Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D1B4038AA
	for <lists+nbd@lfdr.de>; Wed,  8 Sep 2021 13:21:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 267962082C; Wed,  8 Sep 2021 11:21:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep  8 11:21:14 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=4.0 tests=MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 34DA220808
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Sep 2021 11:03:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.586 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.305,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id dxG3fkxa4QYq for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Sep 2021 11:03:31 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A4FB62080E
	for <nbd@other.debian.org>; Wed,  8 Sep 2021 11:03:31 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4H4K404n04z8spQ;
	Wed,  8 Sep 2021 19:02:56 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Wed, 8 Sep 2021 19:03:26 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Wed, 8 Sep 2021 19:03:25 +0800
Subject: Re: [PATCH v4 2/6] nbd: convert to use blk_mq_find_and_get_req()
To: Ming Lei <ming.lei@redhat.com>
CC: <axboe@kernel.dk>, <josef@toxicpanda.com>, <linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <nbd@other.debian.org>, <yi.zhang@huawei.com>
References: <20210907140154.2134091-1-yukuai3@huawei.com>
 <20210907140154.2134091-3-yukuai3@huawei.com> <YThmhhI1/fZd29b1@T590>
 <e295605c-bc8e-cbb9-ca51-1355fdfc0264@huawei.com> <YThtq154oyROxBj9@T590>
 <2cfb6701-6e58-3e13-be85-472437a5b2ed@huawei.com> <YTiB8TLQ7ZJWvS7Y@T590>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <ab425fba-0d6c-b2eb-480d-2e8e90daac1e@huawei.com>
Date: Wed, 8 Sep 2021 19:03:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YTiB8TLQ7ZJWvS7Y@T590>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <VeoBwOgNY6E.A.GQB.qyJOhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1415
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ab425fba-0d6c-b2eb-480d-2e8e90daac1e@huawei.com
Resent-Date: Wed,  8 Sep 2021 11:21:14 +0000 (UTC)

On 2021/09/08 17:27, Ming Lei wrote:
> On Wed, Sep 08, 2021 at 04:29:57PM +0800, yukuai (C) wrote:
>> On 2021/09/08 16:00, Ming Lei wrote:
>>> On Wed, Sep 08, 2021 at 03:37:06PM +0800, yukuai (C) wrote:
>>>> On 2021/09/08 15:30, Ming Lei wrote:
>>>>
>>>>>> +put_req:
>>>>>> +	if (req)
>>>>>> +		blk_mq_put_rq_ref(req);
>>>>>>     	return ret ? ERR_PTR(ret) : cmd;
>>>>>
>>>>> After the request's refcnt is dropped, it can be freed immediately, then
>>>>> one stale command is returned to caller.
>>>>
>>>> Hi, Ming
>>>>
>>>> It's right this patch leave this problem. Please take a look at patch 3
>>>> and patch 4, the problem should be fixed with these patches.
>>>
>>> Not see it is addressed in patch 3 & 4, and it is one obvious fault in
>>> patch 2, please fix it from beginning by moving the refcnt drop
>>> into recv_work().
>>
>> Hi, Ming
>>
>> With patch 3 & 4:
>>
>> if nbd_read_stat() return a valid cmd, then the refcnt should not drop
>> to 0 before blk_mq_complete_request() in recv_work().
> 
> The valid cmd won't be timed out just between nbd_read_stat() and
> calling blk_mq_complete_request()?
> 
> Yeah, the issue is addressed by patch 4, then please put 2 after
> 3 & 4, and suggest to add comment why request ref won't drop to zero
> in recv_work().

Hi, Ming

Thanks for the advice, will do this in next iteration.

Best regards
Kuai
> 
>>
>> if nbd_read_stat() failed, it won't be a problem if the request is freed
>> immediately when refcnt is dropped in nbd_read_stat().
>>
>> That's why I said that the problem will be fixed.
>>
>> BTW, if we move the refcnt drop into recv_work, we can only do that if
>> nbd_read_stat() return a valid cmd. If we get a valid rq and failed in
>> the following checkings in nbd_read_stat(), it's better to drop the
>> refcnt in nbd_read_stat().
> 
> The usual pattern is to drop the refcnt on when the object isn't used
> any more, so it is perfectly fine to hold the ref until that time.
> 
> 
> Thanks,
> Ming
> 
> .
> 

