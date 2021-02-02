Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A29E030B4E3
	for <lists+nbd@lfdr.de>; Tue,  2 Feb 2021 02:54:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 890D0205A5; Tue,  2 Feb 2021 01:54:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb  2 01:54:09 2021
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=FOURLA,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C72612054C
	for <lists-other-nbd@bendel.debian.org>; Tue,  2 Feb 2021 01:37:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id RnqKojPXQfzG for <lists-other-nbd@bendel.debian.org>;
	Tue,  2 Feb 2021 01:37:06 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huawei. - helo: .szxga04-in.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 479AF20556
	for <nbd@other.debian.org>; Tue,  2 Feb 2021 01:37:02 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DV6p26rrnz162xB;
	Tue,  2 Feb 2021 09:35:38 +0800 (CST)
Received: from [10.174.179.80] (10.174.179.80) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Tue, 2 Feb 2021 09:36:54 +0800
Subject: Re: [PATCH v2] nbd: Fix NULL pointer in flush_workqueue
To: Markus Elfring <Markus.Elfring@web.de>, Josef Bacik
	<josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	<linux-block@vger.kernel.org>, <nbd@other.debian.org>
CC: <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <20210201081918.558905-1-sunke32@huawei.com>
 <ebe7beb2-336d-35d4-48af-8f8cad7b868b@web.de>
From: Sun Ke <sunke32@huawei.com>
Message-ID: <68668f92-b605-3abf-9e9a-cddf6444f478@huawei.com>
Date: Tue, 2 Feb 2021 09:36:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <ebe7beb2-336d-35d4-48af-8f8cad7b868b@web.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.80]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-5_5upbEu6D.A.3oC.BDLGgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1113
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/68668f92-b605-3abf-9e9a-cddf6444f478@huawei.com
Resent-Date: Tue,  2 Feb 2021 01:54:09 +0000 (UTC)

hi，Markus

在 2021/2/2 3:05, Markus Elfring 写道:
> …
>> +++ b/drivers/block/nbd.c
>> @@ -2011,12 +2011,14 @@ static int nbd_genl_disconnect(struct sk_buff *skb, struct genl_info *info)
>>   		       index);
>>   		return -EINVAL;
>>   	}
>> +	mutex_lock(&nbd->config_lock);
>>   	if (!refcount_inc_not_zero(&nbd->refs)) {
>> -		mutex_unlock(&nbd_index_mutex);
>> -		printk(KERN_ERR "nbd: device at index %d is going down\n",
>> -		       index);
>> -		return -EINVAL;
>> +		goto unlock;
>>   	}
>> +	if (!nbd->recv_workq) {
>> +		goto unlock;
>> +	}
> How do you think about to use the following patch variant
> (so that unwanted curly brackets would be avoided for proposed single statements
> in two if branches)?
>
> +	mutex_lock(&nbd->config_lock);
> -	if (!refcount_inc_not_zero(&nbd->refs)) {
> +	if (!refcount_inc_not_zero(&nbd->refs) || !nbd->recv_workq) {
> +		mutex_unlock(&nbd->config_lock);
>   		mutex_unlock(&nbd_index_mutex);
>   		printk(KERN_ERR "nbd: device at index %d is going down\n",tter
>   		       index);
>   		return -EINVAL;
>   	}
It looks better,  thanks for your suggestion.
>
> By the way:
> Would you like to replace the following two statements by the statement
> “goto put_nbd;” in another update step for this function implementation?
>
> 		nbd_put(nbd);
> 		return 0;
Sure, I will do it.
>
> Regards,
> Markus

Thanks,

Sun Ke

> .

