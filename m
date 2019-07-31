Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CAECF7C0FF
	for <lists+nbd@lfdr.de>; Wed, 31 Jul 2019 14:18:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8621C20280; Wed, 31 Jul 2019 12:18:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jul 31 12:18:08 2019
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 273412027F
	for <lists-other-nbd@bendel.debian.org>; Wed, 31 Jul 2019 12:01:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.26 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MIME_CHARSET_FARAWAY=0.02, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id yMtKdOReU2KQ for <lists-other-nbd@bendel.debian.org>;
	Wed, 31 Jul 2019 12:01:34 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL_SUBNET=-1.2 (check from: .huawei. - helo: .huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -4.7
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 61FEB202B9
	for <nbd@other.debian.org>; Wed, 31 Jul 2019 12:01:32 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id AEF11CEE86DC22BCC0D7;
	Wed, 31 Jul 2019 20:01:27 +0800 (CST)
Received: from [127.0.0.1] (10.184.194.169) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Wed, 31 Jul 2019
 20:01:22 +0800
Subject: Re: [PATCH] nbd: replace kill_bdev() with __invalidate_device() again
To: Johannes Thumshirn <jthumshirn@suse.de>
CC: <josef@toxicpanda.com>, <axboe@kernel.dk>, <linux-block@vger.kernel.org>,
	<nbd@other.debian.org>, <linux-kernel@vger.kernel.org>, <kamatam@amazon.com>,
	<manoj.br@gmail.com>, <stable@vger.kernel.org>, <dwmw@amazon.com>
References: <1564542946-26255-1-git-send-email-sunke32@huawei.com>
 <20190731081536.GB3856@x250>
From: "sunke (E)" <sunke32@huawei.com>
Message-ID: <46c8f7ba-1ada-f79e-4cf7-f75e59503787@huawei.com>
Date: Wed, 31 Jul 2019 20:01:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190731081536.GB3856@x250>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.184.194.169]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hp93UrUfBE.A.HOF.AcYQdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/609
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/46c8f7ba-1ada-f79e-4cf7-f75e59503787@huawei.com
Resent-Date: Wed, 31 Jul 2019 12:18:08 +0000 (UTC)

OK, I will remove it.

ÔÚ 2019/7/31 16:15, Johannes Thumshirn Ð´µÀ:
> On Wed, Jul 31, 2019 at 11:15:46AM +0800, SunKe wrote:
>> CR: https://code.amazon.com/reviews/CR-7629288
> 
> Hi, this link isn't accessible for ordinary people, please remove it from the
> patch.
> 

