Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5691799155A
	for <lists+nbd@lfdr.de>; Sat,  5 Oct 2024 10:36:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0CCAB20693; Sat,  5 Oct 2024 08:36:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Oct  5 08:36:09 2024
Old-Return-Path: <yanjun.zhu@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 41BFF2080F
	for <lists-other-nbd@bendel.debian.org>; Sat,  5 Oct 2024 08:18:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qxQ94loG_7lv for <lists-other-nbd@bendel.debian.org>;
	Sat,  5 Oct 2024 08:18:42 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .linux. - helo: .out-189.mta1.migadu. - helo-domain: .migadu.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [IPv6:2001:41d0:203:375::bd])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 326A920803
	for <nbd@other.debian.org>; Sat,  5 Oct 2024 08:18:41 +0000 (UTC)
Message-ID: <21e1b842-7662-46cb-9da7-fe37a3b3119b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1728116318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NMmkCzSXIAM+PLZxbf+a1AidtWBAPGqD1VWOkXNMcPo=;
	b=ZUetfGHlSxiTqLvxg1v3AM+K64bVN20czslKjjbF5TywuBJdYVWyEu54jBenAtlpBhHE+F
	AKa18sJR8W0TwofNKhn89ulvAHbmynuArQ+cJgPHcLIlug7bjNHXXq5xQWfGNqYWCa7fxq
	zonkQB3gbpcaKde/TTazAA8GwkMpP3Y=
Date: Sat, 5 Oct 2024 16:18:06 +0800
MIME-Version: 1.0
Subject: Re: blktests failures with v6.12-rc1 kernel
To: Jens Axboe <axboe@kernel.dk>, Bart Van Assche <bvanassche@acm.org>,
 Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
References: <xpe6bea7rakpyoyfvspvin2dsozjmjtjktpph7rep3h25tv7fb@ooz4cu5z6bq6>
 <e6e6f77b-f5c6-4b1e-8ab2-b492755857f0@acm.org>
 <dvpmtffxeydtpid3gigfmmc2jtp2dws6tx4bc27hqo4dp2adhv@x4oqoa2qzl2l>
 <5cff6598-21f3-4e85-9a06-f3a28380585b@linux.dev>
 <9fe72efb-46b8-4a72-b29c-c60a8c64f88c@acm.org>
 <b60fa0ab-591b-41e8-9fca-399b6a25b6d9@linux.dev>
 <c5c3c7d7-2db9-44fe-a316-b0b5bab30f1e@kernel.dk>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <c5c3c7d7-2db9-44fe-a316-b0b5bab30f1e@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zLvffrgGTmO.A.PziD.5pPAnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3159
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/21e1b842-7662-46cb-9da7-fe37a3b3119b@linux.dev
Resent-Date: Sat,  5 Oct 2024 08:36:10 +0000 (UTC)


在 2024/10/5 9:41, Jens Axboe 写道:
> On 10/4/24 7:26 PM, Zhu Yanjun wrote:
>> ? 2024/10/5 0:31, Bart Van Assche ??:
>>> On 10/4/24 5:40 AM, Zhu Yanjun wrote:
>>>> So I add a jiffies (u64) value into the name.
>>> I don't think that embedding the value of the jiffies counter in the kmem cache names is sufficient to make cache names unique. That sounds like a fragile approach to me.
>> Sorry. I can not get you. Why jiffies counter is not sufficient to
>> make cache names unique? And why is it a fragile approach?
> 1 jiffy is an eternity, what happens if someone calls
> kmem_cache_create() twice in that window?

Got it. Thanks a lot.

Zhu Yanjun

>
>> I read your latest commit. In your commit, the ida is used to make
>> cache names unique. It is a good approach if it can fix this problem.
> That seems over-engineered. Seems to me that either these things should
> share a slab cache (why do they need one each, if they are the same
> sized object?!). And if they really do need one, surely something ala:
>
> static atomic_long_t slab_index;
>
> sprintf(slab_name, "foo-%ld", atomic_inc_return(&slab_index));
>
> would be all you need.
>
-- 
Best Regards,
Yanjun.Zhu

