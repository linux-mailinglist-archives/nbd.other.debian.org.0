Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BD3402273
	for <lists+nbd@lfdr.de>; Tue,  7 Sep 2021 05:21:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AD95B20D14; Tue,  7 Sep 2021 03:21:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  7 03:21:10 2021
Old-Return-Path: <houtao1@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2237320A85
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Sep 2021 03:04:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.086 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DIGITS_LETTERS=1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 13QqKKX4W52r for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Sep 2021 03:04:23 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 67D4520918
	for <nbd@other.debian.org>; Tue,  7 Sep 2021 03:04:23 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H3VTC0QKQzVqHM;
	Tue,  7 Sep 2021 11:03:27 +0800 (CST)
Received: from dggpeml500025.china.huawei.com (7.185.36.35) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 7 Sep 2021 11:04:16 +0800
Received: from [10.174.176.117] (10.174.176.117) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 7 Sep 2021 11:04:16 +0800
Subject: Re: [PATCH v2 3/3] nbd: fix race between nbd_alloc_config() and
 module removal
To: Christoph Hellwig <hch@lst.de>
CC: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	<linux-block@vger.kernel.org>, <nbd@other.debian.org>
References: <20210904122519.1963983-1-houtao1@huawei.com>
 <20210904122519.1963983-4-houtao1@huawei.com> <20210906093051.GC30790@lst.de>
 <ce3e1ea8-ebda-4372-42ce-e8a4b2d12514@huawei.com>
 <20210906102521.GA3082@lst.de>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <730dae5e-5af8-3554-18bf-e22ff576e2b1@huawei.com>
Date: Tue, 7 Sep 2021 11:04:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210906102521.GA3082@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.176.117]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <OKlIm0ZTrnD.A.9MD.mqtNhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1398
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/730dae5e-5af8-3554-18bf-e22ff576e2b1@huawei.com
Resent-Date: Tue,  7 Sep 2021 03:21:10 +0000 (UTC)

Hi,

On 9/6/2021 6:25 PM, Christoph Hellwig wrote:
> On Mon, Sep 06, 2021 at 06:08:54PM +0800, Hou Tao wrote:
>>>> +	if (!try_module_get(THIS_MODULE))
>>>> +		return ERR_PTR(-ENODEV);
>>> try_module_get(THIS_MODULE) is an indicator for an unsafe pattern.  If
>>> we don't already have a reference it could never close the race.
>>>
>>> Looking at the callers:
>>>
>>>  - nbd_open like all block device operations must have a reference
>>>    already.
>> Yes. nbd_open() has already taken a reference in dentry_open().
>>>  - for nbd_genl_connect I'm not an expert, but given that struct
>>>    nbd_genl_family has a module member I suspect the networkinh
>>>    code already takes a reference.
>> That was my original though, but the fact is netlink code doesn't take a module reference
>>
>> in genl_family_rcv_msg_doit() and netlink uses genl_lock_all() to serialize between module removal
>>
>> and nbd_connect_genl_ops calling, so I think use try_module_get() is OK here.
> How it this going to work?  If there was a race you just shortened it,
> but it can still happen before you call try_module_get.  So I think we
> need to look into how the netlink calling conventions are supposed to
> look and understand the issues there first.
> .

Let me explain first. The reason it works is due to genl_lock_all() in netlink code.

If the module removal happens before calling try_module_get(), nbd_cleanup() will

call genl_unregister_family() first, and then genl_lock_all(). genl_lock_all() will

prevent ops in nbd_connect_genl_ops() from being called, because the calling

of nbd ops happens in genl_rcv() which needs to acquire cb_lock first.


process A                                       process B

module removal

genl_unregister_family()

  genl_lock_all()

    down_write(&cb_lock)

                                                receive a new netlink message

                                                genl_rcv()

                                                   // will wait for the removal of nbd ops

                                                   down_read(&cb_lock)

If nbd_alloc_config() happens before the module removal, genl_rcv() must

have been acquired cb_lock & genl_mutex, so nbd_cleanup() will block in

genl_unregister_family(). When nbd_alloc_config() calls try_module_get(),

it will find out the module is dying, so fail nbd_genl_connect().


process A                                     process B

a new netlink message

genl_rcv()

  down_read(&cb_lock)

    mutex_lock(&genl_mutex)

      nbd_genl_connect()

        nbd_alloc_config()

                                               module removal

                                               genl_unregister_family

          // module is dying, so fail

          try_module_get()

                                                 genl_lock_all()

                                                   // wait for the completion of nbd ops

                                                   down_write(&cb_lock)

I have checked multiple genl_ops, it seems that the reason why these genl_ops

don't need try_module_get() is that these ops don't create new object through

genl_ops and just control it. However genl_family_rcv_msg_dumpit() will try to

call try_module_get(), but according to the history (6dc878a8ca39 "netlink: add reference of module in netlink_dump_start"),

it is because inet_diag_handler_cmd() will call __netlink_dump_start().

Regards,

Tao


