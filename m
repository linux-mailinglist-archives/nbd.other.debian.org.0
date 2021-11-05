Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB80445DC2
	for <lists+nbd@lfdr.de>; Fri,  5 Nov 2021 03:03:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0DCEE206E2; Fri,  5 Nov 2021 02:03:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Nov  5 02:03:10 2021
Old-Return-Path: <wubo40@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=4.0 tests=MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 61EAB206DB
	for <lists-other-nbd@bendel.debian.org>; Fri,  5 Nov 2021 01:46:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.282 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id v5LkTB3IUMS0 for <lists-other-nbd@bendel.debian.org>;
	Fri,  5 Nov 2021 01:46:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4BCAB206D6
	for <nbd@other.debian.org>; Fri,  5 Nov 2021 01:46:26 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hljyp0lktz90VB;
	Fri,  5 Nov 2021 09:46:10 +0800 (CST)
Received: from dggpeml500019.china.huawei.com (7.185.36.137) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 5 Nov 2021 09:46:19 +0800
Received: from [10.174.179.189] (10.174.179.189) by
 dggpeml500019.china.huawei.com (7.185.36.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 5 Nov 2021 09:46:18 +0800
Subject: Re: [PATCH RESEND] nbd: code clean for nbd_genl_status()
To: Christoph Hellwig <hch@infradead.org>
CC: <josef@toxicpanda.com>, <axboe@kernel.dk>, <linux-block@vger.kernel.org>,
	<nbd@other.debian.org>, <linux-kernel@vger.kernel.org>,
	<linfeilong@huawei.com>
References: <1636000703-13217-1-git-send-email-wubo40@huawei.com>
 <YYOeYwPlLnn7JR+W@infradead.org>
From: Wu Bo <wubo40@huawei.com>
Message-ID: <6cdbd618-918a-3674-122f-039180ea316b@huawei.com>
Date: Fri, 5 Nov 2021 09:46:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <YYOeYwPlLnn7JR+W@infradead.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.189]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500019.china.huawei.com (7.185.36.137)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3QqvrA2OXcG.A.bvH.eDJhhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1611
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6cdbd618-918a-3674-122f-039180ea316b@huawei.com
Resent-Date: Fri,  5 Nov 2021 02:03:10 +0000 (UTC)

On 2021/11/4 16:48, Christoph Hellwig wrote:
> On Thu, Nov 04, 2021 at 12:38:23PM +0800, Wu Bo wrote:
>>   	if (!reply_head) {
>> -		nlmsg_free(reply);
>>   		goto out;
>>   	}
> 
> Please also drop the now pointless braces.
> 
ok. Will do in v2.
>>   out:
>> +	if (reply)
>> +		nlmsg_free(reply);
> 
> Please just use a different label for just unlocking vs also freeing
> the reply.
> .
ok. Will do in v2.

Thanks.

Wu Bo

