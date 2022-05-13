Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A69A525A2B
	for <lists+nbd@lfdr.de>; Fri, 13 May 2022 05:36:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3EED920352; Fri, 13 May 2022 03:36:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 13 03:36:10 2022
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=4.0 tests=MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EBF3920251
	for <lists-other-nbd@bendel.debian.org>; Fri, 13 May 2022 03:20:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.537 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-3.247,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PCc5m5vzgeEP for <lists-other-nbd@bendel.debian.org>;
	Fri, 13 May 2022 03:20:54 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 648F220250
	for <nbd@other.debian.org>; Fri, 13 May 2022 03:20:53 +0000 (UTC)
Received: from kwepemi500017.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Kzv3T5p4TzGpZj;
	Fri, 13 May 2022 11:17:57 +0800 (CST)
Received: from kwepemm600009.china.huawei.com (7.193.23.164) by
 kwepemi500017.china.huawei.com (7.221.188.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 13 May 2022 11:20:47 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 kwepemm600009.china.huawei.com (7.193.23.164) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 13 May 2022 11:20:47 +0800
Subject: Re: [PROBLEM] nbd requests become stuck when devices watched by
 inotify emit udev uevent changes
To: Matthew Ruffell <matthew.ruffell@canonical.com>, Josef Bacik
	<josef@toxicpanda.com>
CC: Jens Axboe <axboe@kernel.dk>, linux-block <linux-block@vger.kernel.org>,
	nbd <nbd@other.debian.org>, Linux Kernel <linux-kernel@vger.kernel.org>
References: <20220422054224.19527-1-matthew.ruffell@canonical.com>
 <CAEzrpqe=LD3DQcEeLXmmFuq7cX_dAQ6DOCuJYWBoZWKKTmoTzA@mail.gmail.com>
 <CAKAwkKt3yMOOW3NXcE91WkGr+8xj050CYP2pLoQVHt_2wXq=-w@mail.gmail.com>
 <CAKAwkKvfFn18RjupuqGpx4QeAiMYKSq7QUTd3wEL=pkZ+BENpQ@mail.gmail.com>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <0eb5ff67-b1f0-a8c4-281c-55a5ded58662@huawei.com>
Date: Fri, 13 May 2022 11:20:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKAwkKvfFn18RjupuqGpx4QeAiMYKSq7QUTd3wEL=pkZ+BENpQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600009.china.huawei.com (7.193.23.164)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zDTIFOrflSG.A.81F.qIdfiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2065
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/0eb5ff67-b1f0-a8c4-281c-55a5ded58662@huawei.com
Resent-Date: Fri, 13 May 2022 03:36:10 +0000 (UTC)

在 2022/05/13 10:56, Matthew Ruffell 写道:
> Hi Josef,
> 
> Just a friendly ping, I am more than happy to test a patch, if you send it
> inline in the email, since the pastebin you used expired after 1 day, and I
> couldn't access it.
> 
> I came across and tested Yu Kuai's patches [1][2] which are for the same issue,
> and they indeed fix the hang. Thank you Yu.
Hi, Matthew

Thanks for your test.
> 
> [1] nbd: don't clear 'NBD_CMD_INFLIGHT' flag if request is not completed
> https://lists.debian.org/nbd/2022/04/msg00212.html
> 
> [2] nbd: fix io hung while disconnecting device
> https://lists.debian.org/nbd/2022/04/msg00207.html
> 
> I am also happy to test any patches to fix the I/O errors.

Sorry that I missed this thread. IMO, if inflight requests is cleared by
ioctl NBD_CLEAR_SOCK after my patch [2](or other callers for
nbd_clear_que()), such io will return as error. Thus I don't think such
io errors need to be fixed.

Josef, do you have other suggestions?

Thanks,
Kuai

