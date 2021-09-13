Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C19C1408399
	for <lists+nbd@lfdr.de>; Mon, 13 Sep 2021 06:48:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7100F2088A; Mon, 13 Sep 2021 04:48:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 13 04:48:14 2021
Old-Return-Path: <houtao1@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9F52A2057F
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Sep 2021 04:32:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.256 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-1.975, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3E-xz5XGdeS7 for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Sep 2021 04:32:47 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huawei. - helo: .szxga01-in.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 543BD2056C
	for <nbd@other.debian.org>; Mon, 13 Sep 2021 04:32:44 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H7D4f10s3zbmLl;
	Mon, 13 Sep 2021 12:28:34 +0800 (CST)
Received: from dggpeml500025.china.huawei.com (7.185.36.35) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Mon, 13 Sep 2021 12:32:38 +0800
Received: from [10.174.176.117] (10.174.176.117) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Mon, 13 Sep 2021 12:32:38 +0800
Subject: Re: [PATCH v2 3/3] nbd: fix race between nbd_alloc_config() and
 module removal
To: Christoph Hellwig <hch@lst.de>
CC: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	<linux-block@vger.kernel.org>, <nbd@other.debian.org>
References: <20210904122519.1963983-1-houtao1@huawei.com>
 <20210904122519.1963983-4-houtao1@huawei.com> <20210906093051.GC30790@lst.de>
 <ce3e1ea8-ebda-4372-42ce-e8a4b2d12514@huawei.com>
 <20210906102521.GA3082@lst.de>
 <730dae5e-5af8-3554-18bf-e22ff576e2b1@huawei.com>
 <20210909064035.GA26290@lst.de>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <6434d4e8-984d-97df-34e5-b86a0e69cf58@huawei.com>
Date: Mon, 13 Sep 2021 12:32:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210909064035.GA26290@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.176.117]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <C9oR1QfomJG.A.hBF.OgtPhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1433
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6434d4e8-984d-97df-34e5-b86a0e69cf58@huawei.com
Resent-Date: Mon, 13 Sep 2021 04:48:14 +0000 (UTC)

Hi Christoph,

On 9/9/2021 2:40 PM, Christoph Hellwig wrote:
> On Tue, Sep 07, 2021 at 11:04:16AM +0800, Hou Tao wrote:
>> Let me explain first. The reason it works is due to genl_lock_all() in netlink code.
> Btw, please properly format your mail.  These overly long lines are really
> hard to read.
Thanks for reminding.
>> If the module removal happens before calling try_module_get(), nbd_cleanup() will
>>
>> call genl_unregister_family() first, and then genl_lock_all(). genl_lock_all() will
>>
>> prevent ops in nbd_connect_genl_ops() from being called, because the calling
>>
>> of nbd ops happens in genl_rcv() which needs to acquire cb_lock first.
> Good.
>
>> I have checked multiple genl_ops, it seems that the reason why these genl_ops
>>
>> don't need try_module_get() is that these ops don't create new object through
>>
>> genl_ops and just control it. However genl_family_rcv_msg_dumpit() will try to
>>
>> call try_module_get(), but according to the history (6dc878a8ca39 "netlink: add reference of module in netlink_dump_start"),
>>
>> it is because inet_diag_handler_cmd() will call __netlink_dump_start().
> And now taking a step back:  Why do we even need this extra module
> reference?  For the case where nbd_alloc_config is called from nbd_open
> we obviously don't need it.  In the case where it is called from
> nbd_genl_connect that prevents unloading nbd when there is a configured
> but not actually nbd device.  Which isn't reallyed need and counter to
> how other drivers work.
Yes, the purpose of module ref-counting in nbd_alloc_config() is to force
the user to disconnect the nbd device manually before module removal.
And loop device works in the same way. If a file is attached to a loop device,
an extra module reference will be taken in loop_configure() and the removal
of loop module will fail. The only difference is that loop driver takes the
extra ref-count by ioctl, and nbd does it through netlink.
>
> Did you try just removing the extra module refcounting?
Yes, removing the module refcounting in nbd_alloc_config() and cleaning
the nbd_config in nbd_cleanup() also work, but not sure whether or not
it will break some nbd user-case which depends on the extra module
reference count. I prefer to keep the extra module refcounting considering
that loop driver does it as well, so what is your suggestion ?

Regards,
Tao

> .

