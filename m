Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDCF9913D3
	for <lists+nbd@lfdr.de>; Sat,  5 Oct 2024 03:51:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A3A49207D5; Sat,  5 Oct 2024 01:51:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Oct  5 01:51:10 2024
Old-Return-Path: <yanjun.zhu@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E965B207C5
	for <lists-other-nbd@bendel.debian.org>; Sat,  5 Oct 2024 01:34:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Yvs8vxJnFHG7 for <lists-other-nbd@bendel.debian.org>;
	Sat,  5 Oct 2024 01:34:48 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .linux. - helo: .out-179.mta0.migadu. - helo-domain: .migadu.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
X-Greylist: delayed 457 seconds by postgrey-1.36 at bendel; Sat, 05 Oct 2024 01:34:48 UTC
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0AB20207AB
	for <nbd@other.debian.org>; Sat,  5 Oct 2024 01:34:47 +0000 (UTC)
Message-ID: <b60fa0ab-591b-41e8-9fca-399b6a25b6d9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1728091628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2VC8qI0q43BjF9ZEaHIPqDkde6qxIB0LzkBDmmyVc2c=;
	b=caXVk7holI5r3PJjd9jKsM7ObMBgv6mEhFphPcPLVJQYorAQFMHyw7eehDowCjNuIumOe+
	rHF3uTT9M3sNDnPOD2OYe6r9zVinJ3bJmZ5Ln78QAba/dy88vevt0JVKDYmDhsWr05UwrL
	VH/7reVf3BHTne6xZSDpvbCSq9Yc5ns=
Date: Sat, 5 Oct 2024 09:26:56 +0800
MIME-Version: 1.0
Subject: Re: blktests failures with v6.12-rc1 kernel
To: Bart Van Assche <bvanassche@acm.org>,
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
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <9fe72efb-46b8-4a72-b29c-c60a8c64f88c@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <R07EFZ19coM.A.rYGM.OuJAnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3157
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b60fa0ab-591b-41e8-9fca-399b6a25b6d9@linux.dev
Resent-Date: Sat,  5 Oct 2024 01:51:10 +0000 (UTC)


在 2024/10/5 0:31, Bart Van Assche 写道:
> On 10/4/24 5:40 AM, Zhu Yanjun wrote:
>> So I add a jiffies (u64) value into the name.
>
> I don't think that embedding the value of the jiffies counter in the 
> kmem cache names is sufficient to make cache names unique. That sounds 
> like a fragile approach to me.

Sorry. I can not get you. Why jiffies counter is not sufficient to make 
cache names unique? And why is it a fragile approach?

Can you share your advice with us?

I read your latest commit. In your commit, the ida is used to make cache 
names unique. It is a good approach if it can fix this problem.

The approach of jiffies seems clumsy. But it seems to be able to fix 
this problem, too. I can not see any risks about this jiffies appraoch.

Zhu Yanjun

>
> Bart.

-- 
Best Regards,
Yanjun.Zhu

