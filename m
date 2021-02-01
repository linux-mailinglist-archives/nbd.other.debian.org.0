Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D30BD30A245
	for <lists+nbd@lfdr.de>; Mon,  1 Feb 2021 08:00:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7EA9420682; Mon,  1 Feb 2021 07:00:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb  1 07:00:11 2021
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=FOURLA,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C7B1F205FE
	for <lists-other-nbd@bendel.debian.org>; Mon,  1 Feb 2021 06:43:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.927 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-2.749, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YNAPJLcaulY5 for <lists-other-nbd@bendel.debian.org>;
	Mon,  1 Feb 2021 06:43:12 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huawei. - helo: .szxga04-in.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1E743205ED
	for <nbd@other.debian.org>; Mon,  1 Feb 2021 06:43:08 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DTddk6LW6z162QB;
	Mon,  1 Feb 2021 14:41:46 +0800 (CST)
Received: from [10.174.179.80] (10.174.179.80) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Mon, 1 Feb 2021 14:43:01 +0800
Subject: Re: [PATCH] nbd: Fix NULL pointer in flush_workqueue
To: Markus Elfring <Markus.Elfring@web.de>, <linux-block@vger.kernel.org>,
	<nbd@other.debian.org>
CC: <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>, "Jens
 Axboe" <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>
References: <20210128074153.1633374-1-sunke32@huawei.com>
 <1739e522-5980-f86e-cb90-19b61539a5cf@web.de>
From: Sun Ke <sunke32@huawei.com>
Message-ID: <28c83b00-7d0b-ee0d-640b-017c9f8410eb@huawei.com>
Date: Mon, 1 Feb 2021 14:43:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1739e522-5980-f86e-cb90-19b61539a5cf@web.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.80]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ndx3C2rP6pK.A.sOC.7b6FgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1109
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/28c83b00-7d0b-ee0d-640b-017c9f8410eb@huawei.com
Resent-Date: Mon,  1 Feb 2021 07:00:11 +0000 (UTC)

hi，Markus

在 2021/1/29 3:42, Markus Elfring 写道:
> …
>> +++ b/drivers/block/nbd.c
>> @@ -2011,12 +2011,20 @@ static int nbd_genl_disconnect(struct sk_buff *skb, struct genl_info *info)
>>   		       index);
>>   		return -EINVAL;
>>   	}
>> +	mutex_lock(&nbd->config_lock);
>>   	if (!refcount_inc_not_zero(&nbd->refs)) {
>>   		mutex_unlock(&nbd_index_mutex);
>> +		mutex_unlock(&nbd->config_lock);
> Can an other function call order become relevant for the unlocking of these mutexes?
Do you think the nbd->config_lock  mutex here is useless?
>
>
>>   		printk(KERN_ERR "nbd: device at index %d is going down\n",
>>   		       index);
> May such an error message be moved into the lock scope?
Sure.
>
>
>>   		return -EINVAL;
>>   	}
>> +	if (!nbd->recv_workq) {
>> +		mutex_unlock(&nbd->config_lock);
>> +		mutex_unlock(&nbd_index_mutex);
>> +		return -EINVAL;
>> +	}
> How do you think about to connect the code from this if branch
> with a jump target like “unlock” so that such statements would be shareable
> for the desired exception handling?
OK, I will improve it in V2 patch.
>
>
>> +	mutex_unlock(&nbd->config_lock);
>>   	mutex_unlock(&nbd_index_mutex);
>>   	if (!refcount_inc_not_zero(&nbd->config_refs)) {
>>   		nbd_put(nbd);
>
> Regards,
> Markus
> .

