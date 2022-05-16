Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F7E5284F9
	for <lists+nbd@lfdr.de>; Mon, 16 May 2022 15:09:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8A35F20409; Mon, 16 May 2022 13:09:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 16 13:09:10 2022
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=4.0 tests=MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 11413203E0
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 May 2022 12:53:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.537 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-3.247,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6mUJ0Bfi8xd6 for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 May 2022 12:53:31 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huawei. - helo: .szxga03-in.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D74B5203DC
	for <nbd@other.debian.org>; Mon, 16 May 2022 12:53:28 +0000 (UTC)
Received: from kwepemi100016.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4L1zZP5tqvzCspx;
	Mon, 16 May 2022 20:48:29 +0800 (CST)
Received: from kwepemm600009.china.huawei.com (7.193.23.164) by
 kwepemi100016.china.huawei.com (7.221.188.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 16 May 2022 20:53:22 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 kwepemm600009.china.huawei.com (7.193.23.164) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 16 May 2022 20:53:22 +0800
Subject: Re: [PROBLEM] nbd requests become stuck when devices watched by
 inotify emit udev uevent changes
To: Josef Bacik <josef@toxicpanda.com>
CC: Matthew Ruffell <matthew.ruffell@canonical.com>, Jens Axboe
	<axboe@kernel.dk>, linux-block <linux-block@vger.kernel.org>, nbd
	<nbd@other.debian.org>, Linux Kernel <linux-kernel@vger.kernel.org>
References: <20220422054224.19527-1-matthew.ruffell@canonical.com>
 <CAEzrpqe=LD3DQcEeLXmmFuq7cX_dAQ6DOCuJYWBoZWKKTmoTzA@mail.gmail.com>
 <CAKAwkKt3yMOOW3NXcE91WkGr+8xj050CYP2pLoQVHt_2wXq=-w@mail.gmail.com>
 <CAKAwkKvfFn18RjupuqGpx4QeAiMYKSq7QUTd3wEL=pkZ+BENpQ@mail.gmail.com>
 <Yn5Zf6lONff1AoOA@localhost.localdomain>
 <6efae367-12fa-1a58-7438-1b39dc0d6ef8@huawei.com>
 <YoJA8C2XtXY27qJ1@localhost.localdomain>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <e0718adf-fe2a-5f1d-a880-bac72cabfe42@huawei.com>
Date: Mon, 16 May 2022 20:53:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YoJA8C2XtXY27qJ1@localhost.localdomain>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600009.china.huawei.com (7.193.23.164)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vMCCD2yGS4N.A.4XE.2zkgiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2075
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/e0718adf-fe2a-5f1d-a880-bac72cabfe42@huawei.com
Resent-Date: Mon, 16 May 2022 13:09:10 +0000 (UTC)

在 2022/05/16 20:17, Josef Bacik 写道:

>> Hi, Josef
>>
>> This seems to try to fix the same problem that I described here:
>>
>> nbd: fix io hung while disconnecting device
>> https://lists.debian.org/nbd/2022/04/msg00207.html
>>
>> There are still some io that are stuck, which means the devcie is
>> probably still opened. Thus nbd_config_put() can't reach here.
>> I'm afraid this patch can't fix the io hung.
>>
>> Matthew, can you try a test with this patch together with my patch below
>> to comfirm my thought?
>>
>> nbd: don't clear 'NBD_CMD_INFLIGHT' flag if request is not completed
>> https://lists.debian.org/nbd/2022/04/msg00212.html.
>>
> 
> Re-submit this one, but fix it so we just test the bit to see if we need to skip
> it, and change it so we only CLEAR when we're sure we're going to complete the
> request.  Thanks,

Ok, thanks for your advice. I'll send a new version.

BTW, do you have any suggestions on other patches of the patchset?

https://lore.kernel.org/all/20220426130746.885140-1-yukuai3@huawei.com/

Thanks,
Kuai
> 
> Josef
> .
> 

