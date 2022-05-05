Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 210FA51B525
	for <lists+nbd@lfdr.de>; Thu,  5 May 2022 03:15:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B7C3F202BB; Thu,  5 May 2022 01:15:07 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May  5 01:15:07 2022
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=4.0 tests=MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 34628202CD
	for <lists-other-nbd@bendel.debian.org>; Thu,  5 May 2022 00:57:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.517 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MIME_CHARSET_FARAWAY=0.02, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-3.247, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 45hJe7eon2mQ for <lists-other-nbd@bendel.debian.org>;
	Thu,  5 May 2022 00:57:35 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B39CF202B9
	for <nbd@other.debian.org>; Thu,  5 May 2022 00:57:35 +0000 (UTC)
Received: from kwepemi100001.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KtwJh5VgFzhYsv;
	Thu,  5 May 2022 08:57:08 +0800 (CST)
Received: from kwepemm600009.china.huawei.com (7.193.23.164) by
 kwepemi100001.china.huawei.com (7.221.188.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 5 May 2022 08:57:30 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 kwepemm600009.china.huawei.com (7.193.23.164) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 5 May 2022 08:57:29 +0800
Subject: Re: [PATCH -next 0/6] nbd: bugfix and cleanup patches
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <ming.lei@redhat.com>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yi.zhang@huawei.com>
References: <20220426130746.885140-1-yukuai3@huawei.com>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <a8f0b55b-625c-3393-fadb-5724e129abdf@huawei.com>
Date: Thu, 5 May 2022 08:57:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20220426130746.885140-1-yukuai3@huawei.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600009.china.huawei.com (7.193.23.164)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0WykujPZtRD.A.ByE.bUyciB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2059
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/a8f0b55b-625c-3393-fadb-5724e129abdf@huawei.com
Resent-Date: Thu,  5 May 2022 01:15:07 +0000 (UTC)

friendly ping ...

ÔÚ 2022/04/26 21:07, Yu Kuai Ð´µÀ:
> path 1-2 fix races between nbd setup and module removal.
> patch 3 fix io can't be completed in some error path.
> patch 4 fix io hung when disconnecting failed.
> patch 5 fix sysfs warning about duplicate creation.
> patch 6 use pr_err to output error message.
> 
> Yu Kuai (5):
>    nbd: call genl_unregister_family() first in nbd_cleanup()
>    nbd: fix race between nbd_alloc_config() and module removal
>    nbd: don't clear 'NBD_CMD_INFLIGHT' flag if request is not completed
>    nbd: fix io hung while disconnecting device
>    nbd: use pr_err to output error message
> 
> Zhang Wensheng (1):
>    nbd: fix possible overflow on 'first_minor' in nbd_dev_add()
> 
>   drivers/block/nbd.c | 119 +++++++++++++++++++++++++++-----------------
>   1 file changed, 74 insertions(+), 45 deletions(-)
> 

