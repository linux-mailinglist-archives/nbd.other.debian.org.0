Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AE63E5114
	for <lists+nbd@lfdr.de>; Tue, 10 Aug 2021 04:36:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5BBFA2035D; Tue, 10 Aug 2021 02:36:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug 10 02:36:10 2021
Old-Return-Path: <houtao1@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B2CA62035D
	for <lists-other-nbd@bendel.debian.org>; Tue, 10 Aug 2021 02:19:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.282 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9Siw4Lr5lWMz for <lists-other-nbd@bendel.debian.org>;
	Tue, 10 Aug 2021 02:19:23 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 847EA2021C
	for <nbd@other.debian.org>; Tue, 10 Aug 2021 02:19:23 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GkGkd3Phqz85pk;
	Tue, 10 Aug 2021 10:15:21 +0800 (CST)
Received: from dggpeml500025.china.huawei.com (7.185.36.35) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 10 Aug 2021 10:19:17 +0800
Received: from [10.174.176.117] (10.174.176.117) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 10 Aug 2021 10:19:16 +0800
Subject: Re: [PATCH] nbd: call genl_unregister_family() first in nbd_cleanup()
To: Eric Blake <eblake@redhat.com>
CC: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	<linux-block@vger.kernel.org>, <nbd@other.debian.org>
References: <20210805021946.978686-1-houtao1@huawei.com>
 <20210805155004.6l4gxrniih6vxisr@redhat.com>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <63570292-5b27-c619-4911-2f3db471f61f@huawei.com>
Date: Tue, 10 Aug 2021 10:19:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210805155004.6l4gxrniih6vxisr@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.176.117]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <psc2V7XFN2O.A._6B.aYeEhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1260
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/63570292-5b27-c619-4911-2f3db471f61f@huawei.com
Resent-Date: Tue, 10 Aug 2021 02:36:10 +0000 (UTC)

Hi,

Thanks for your suggestions. Will fix in v2.

Regards,

Tao

On 8/5/2021 11:50 PM, Eric Blake wrote:
> On Thu, Aug 05, 2021 at 10:19:46AM +0800, Hou Tao wrote:
>> Else there may be race between module removal and handling of
>> netlink command and will lead to oops as shown below:
> Grammar suggestion:
>
> Otherwise, there is a race between module removal and the handling of
> a netlink command, which can lead to the oops shown below:
>
>> Signed-off-by: Hou Tao <houtao1@huawei.com>
>> ---
>>  drivers/block/nbd.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> index 9a7c9a425ab0..0993d108d868 100644
>> --- a/drivers/block/nbd.c
>> +++ b/drivers/block/nbd.c
>> @@ -2492,6 +2492,12 @@ static void __exit nbd_cleanup(void)
>>  	struct nbd_device *nbd;
>>  	LIST_HEAD(del_list);
>>  
>> +	/*
>> +	 * Unregister netlink interface first to waiting
>> +	 * for the completion of netlink commands.
> Grammar suggestion: s/first/prior/
>

