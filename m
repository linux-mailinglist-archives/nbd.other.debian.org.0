Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9AD10FDCE
	for <lists+nbd@lfdr.de>; Tue,  3 Dec 2019 13:39:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0017D20799; Tue,  3 Dec 2019 12:39:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Dec  3 12:39:09 2019
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 46D8A20798
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Dec 2019 12:23:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.28 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nYiLselEH8nw for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Dec 2019 12:22:57 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 22ACA20793
	for <nbd@other.debian.org>; Tue,  3 Dec 2019 12:22:56 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 702D9616831BFA5CA328;
	Tue,  3 Dec 2019 20:22:50 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.66) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Dec 2019
 20:22:45 +0800
Subject: Re: [PATCH] nbd: fix potential deadlock in nbd_config_put()
To: Mike Christie <mchristi@redhat.com>, <josef@toxicpanda.com>
CC: <axboe@kernel.dk>, <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>
References: <1574937951-92828-1-git-send-email-sunke32@huawei.com>
 <5DE3F444.9080706@redhat.com>
From: "sunke (E)" <sunke32@huawei.com>
Message-ID: <1702191a-99e1-1b56-c77a-0202b44885bf@huawei.com>
Date: Tue, 3 Dec 2019 20:22:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <5DE3F444.9080706@redhat.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.66]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <S7F91eWf0_L.A.0RD.tdl5dB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/754
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1702191a-99e1-1b56-c77a-0202b44885bf@huawei.com
Resent-Date: Tue,  3 Dec 2019 12:39:10 +0000 (UTC)



Your solution ie better.

