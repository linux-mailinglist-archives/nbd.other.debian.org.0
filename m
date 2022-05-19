Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E8952C932
	for <lists+nbd@lfdr.de>; Thu, 19 May 2022 03:24:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AB8AF203CF; Thu, 19 May 2022 01:24:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 19 01:24:06 2022
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=4.0 tests=MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E8244203C6
	for <lists-other-nbd@bendel.debian.org>; Thu, 19 May 2022 01:06:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.389 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MIME_CHARSET_FARAWAY=0.02, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-2.119, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id NB32NcrGxncu for <lists-other-nbd@bendel.debian.org>;
	Thu, 19 May 2022 01:06:28 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1D5CA203BE
	for <nbd@other.debian.org>; Thu, 19 May 2022 01:06:27 +0000 (UTC)
Received: from kwepemi100022.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L3WrB0D1jzhZ13;
	Thu, 19 May 2022 09:05:46 +0800 (CST)
Received: from kwepemm600009.china.huawei.com (7.193.23.164) by
 kwepemi100022.china.huawei.com (7.221.188.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 19 May 2022 09:06:22 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 kwepemm600009.china.huawei.com (7.193.23.164) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 19 May 2022 09:06:21 +0800
Subject: Re: [PATCH -next v2 6/6] nbd: use pr_err to output error message
To: Joe Perches <joe@perches.com>, <josef@toxicpanda.com>, <axboe@kernel.dk>,
	<ming.lei@redhat.com>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yi.zhang@huawei.com>
References: <20220518122618.1702997-1-yukuai3@huawei.com>
 <20220518122618.1702997-7-yukuai3@huawei.com>
 <f0acebb66b9b46ad472e0d0989dc0f5810cac3dd.camel@perches.com>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <65fe63ed-91d4-35bd-3e25-39c4457295d0@huawei.com>
Date: Thu, 19 May 2022 09:06:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f0acebb66b9b46ad472e0d0989dc0f5810cac3dd.camel@perches.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600009.china.huawei.com (7.193.23.164)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4TuGPqKeSfB.A.apB.2wZhiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2084
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/65fe63ed-91d4-35bd-3e25-39c4457295d0@huawei.com
Resent-Date: Thu, 19 May 2022 01:24:06 +0000 (UTC)

ÔÚ 2022/05/19 2:12, Joe Perches Ð´µÀ:
> On Wed, 2022-05-18 at 20:26 +0800, Yu Kuai wrote:
>> Instead of using the long printk(KERN_ERR "nbd: ...") to
>> output error message, defining pr_fmt and using
>> the short pr_err("") to do that. The replacemen is done
>> by using the following command:
>>
>>    sed -i 's/printk(KERN_ERR "nbd: /pr_err("/g' \
>> 		  drivers/block/nbd.c
> 
> It's also good to rewrap to 80 columns where possible.
> 
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> []
>> @@ -2130,13 +2130,13 @@ static int nbd_genl_disconnect(struct sk_buff *skb, struct genl_info *info)
>>   	nbd = idr_find(&nbd_index_idr, index);
>>   	if (!nbd) {
>>   		mutex_unlock(&nbd_index_mutex);
>> -		printk(KERN_ERR "nbd: couldn't find device at index %d\n",
>> +		pr_err("couldn't find device at index %d\n",
>>   		       index);
> 
> like here
> 
>>   		return -EINVAL;
>>   	}
>>   	if (!refcount_inc_not_zero(&nbd->refs)) {
>>   		mutex_unlock(&nbd_index_mutex);
>> -		printk(KERN_ERR "nbd: device at index %d is going down\n",
>> +		pr_err("device at index %d is going down\n",
>>   		       index);
> 
> and here and below...
Hi, Josef

Thanks for your advice, I'll send a new version.
> 
>> @@ -2170,7 +2170,7 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
>>   	nbd = idr_find(&nbd_index_idr, index);
>>   	if (!nbd) {
>>   		mutex_unlock(&nbd_index_mutex);
>> -		printk(KERN_ERR "nbd: couldn't find a device at index %d\n",
>> +		pr_err("couldn't find a device at index %d\n",
>>   		       index);
>>   		return -EINVAL;
>>   	}
>> @@ -2192,7 +2192,7 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
>>   	}
>>   	if (!refcount_inc_not_zero(&nbd->refs)) {
>>   		mutex_unlock(&nbd_index_mutex);
>> -		printk(KERN_ERR "nbd: device at index %d is going down\n",
>> +		pr_err("device at index %d is going down\n",
>>   		       index);
>>   		return -EINVAL;
>>   	}
> 
> 
> 
> .
> 

