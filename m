Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A635F202EE9
	for <lists+nbd@lfdr.de>; Mon, 22 Jun 2020 05:42:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 82FE32048D; Mon, 22 Jun 2020 03:42:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 22 03:42:09 2020
Old-Return-Path: <zhengbin13@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 636B320396
	for <lists-other-nbd@bendel.debian.org>; Mon, 22 Jun 2020 03:26:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.278 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id IOmBxgF7_uX3 for <lists-other-nbd@bendel.debian.org>;
	Mon, 22 Jun 2020 03:26:07 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8061520342
	for <nbd@other.debian.org>; Mon, 22 Jun 2020 03:26:07 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 9449AD0E39D143FD9445;
	Mon, 22 Jun 2020 11:26:01 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.138) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Mon, 22 Jun 2020
 11:25:54 +0800
Subject: Re: [PATCH v2] nbd: Fix memory leak in nbd_add_socket
To: Markus Elfring <Markus.Elfring@web.de>, <linux-block@vger.kernel.org>
CC: <nbd@other.debian.org>, Navid Emamdoost <navid.emamdoost@gmail.com>,
	"Navid Emamdoost" <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen
 McCamant <mccamant@cs.umn.edu>, Qiushi Wu <wu000273@umn.edu>,
	<kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Jens Axboe
	<axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, Tuomas Tynkkynen
	<tuomas.tynkkynen@iki.fi>, Yi Zhang <yi.zhang@huawei.com>
References: <b55f8af2-b20c-214f-90f0-9b6efcb7273c@web.de>
From: "Zhengbin (OSKernel)" <zhengbin13@huawei.com>
Message-ID: <db17d022-a53a-3781-63d4-c38d5cf5b1e4@huawei.com>
Date: Mon, 22 Jun 2020 11:25:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <b55f8af2-b20c-214f-90f0-9b6efcb7273c@web.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.166.215.138]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <aXFJCDDDXkF.A._GD.RiC8eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/905
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/db17d022-a53a-3781-63d4-c38d5cf5b1e4@huawei.com
Resent-Date: Mon, 22 Jun 2020 03:42:09 +0000 (UTC)


On 2020/6/20 20:05, Markus Elfring wrote:
>> If we add first socket to nbd, config->socks is malloced but
>> num_connections does not update(nsock's allocation fail), the memory
>> is leaked. Cause in later nbd_config_put(), will only free config->socks
>> when num_connections is not 0.
>>
>> Let nsock's allocation first to avoid this.
> I suggest to improve this change description.
> Can an other wording variant be nicer?

em, how about this?


When adding first socket to nbd, if nsock's allocation fails, config->socks

is malloced but num_connections does not update, memory leak will 
occur(Function

nbd_config_put will only free config->socks when num_connections is not 0).

>
>
> …
>> +++ b/drivers/block/nbd.c
>> @@ -1037,21 +1037,22 @@  static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
>>   		return -EBUSY;
>>   	}
>>
>> +	nsock = kzalloc(sizeof(struct nbd_sock), GFP_KERNEL);
> Please use the following code variant.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=4333a9b0b67bb4e8bcd91bdd80da80b0ec151162#n854
>
> +	nsock = kzalloc(sizeof(*nsock), GFP_KERNEL);
>
>
> …
>>   	if (!socks) {
>>   		sockfd_put(sock);
>> +		kfree(nsock);
>>   		return -ENOMEM;
>>   	}
> Please take another software design possibility into account.
>
>   	if (!socks) {
> -		sockfd_put(sock);
> -		return -ENOMEM;
> +		kfree(nsock);
> +		goto put_socket;
>   	}
>
>
> Regards,
> Markus
>
> .
>

