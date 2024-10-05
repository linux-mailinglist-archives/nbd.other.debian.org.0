Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 346B9991B01
	for <lists+nbd@lfdr.de>; Sat,  5 Oct 2024 23:54:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1651620848; Sat,  5 Oct 2024 21:54:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Oct  5 21:54:10 2024
Old-Return-Path: <bvanassche@acm.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F36B920807
	for <lists-other-nbd@bendel.debian.org>; Sat,  5 Oct 2024 21:36:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VILkbQ4YVdtj for <lists-other-nbd@bendel.debian.org>;
	Sat,  5 Oct 2024 21:36:36 +0000 (UTC)
X-policyd-weight: using cached result; rate: -6.6
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailroute.net", Issuer "R10" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C52C4207F6
	for <nbd@other.debian.org>; Sat,  5 Oct 2024 21:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4XLdym6QG9zlgT1M;
	Sat,  5 Oct 2024 21:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1728164190; x=1730756191; bh=mmSl7eqWiha0nfA3hTlH5zkd
	KkX4dm03HscfrHTMGhI=; b=HojL8L1qLnNowfZUVh7eJ8b0Fgy9LFPPki3RMiiq
	5PeiLvy74j0A6qnTPUvVxeTjBNt6xSIP9ezBNwGrp3uoMgQHIQVwPmkctw0RCkOa
	AAHIOoR+l9Daj2VOm+b7tSWzHJFpZQzbQpI5Lu1SHUDqYNAOj4xqFBuf2Z2yBiwQ
	wOWH92oz9UDJEhI7K7RnuSvA+Vx5j2hUNGdi0XyAOOP8O4lmfKsrmPADwV8XcKJL
	gOnIYZgNrYS/M7BjbZXobIcNmf8gV9TTFDwYy3UzEoXFyNgeRYfjh2ZV2vprNlb5
	MJ0n3nHuV6dUsoYQ299TDpgLD5AjiVNknOgJoLRSjIVLJQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 8jru5-91P3G7; Sat,  5 Oct 2024 21:36:30 +0000 (UTC)
Received: from [192.168.50.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4XLdyh70ZyzlgTWQ;
	Sat,  5 Oct 2024 21:36:28 +0000 (UTC)
Message-ID: <d5fe08b6-68df-4d67-8870-dd7ae391973e@acm.org>
Date: Sat, 5 Oct 2024 14:36:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: blktests failures with v6.12-rc1 kernel
To: Jens Axboe <axboe@kernel.dk>, Zhu Yanjun <yanjun.zhu@linux.dev>,
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
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <c5c3c7d7-2db9-44fe-a316-b0b5bab30f1e@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UTExy1HHNkD.A.PCaM.BWbAnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3160
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d5fe08b6-68df-4d67-8870-dd7ae391973e@acm.org
Resent-Date: Sat,  5 Oct 2024 21:54:10 +0000 (UTC)

On 10/4/24 6:41 PM, Jens Axboe wrote:
> That seems over-engineered. Seems to me that either these things should
> share a slab cache (why do they need one each, if they are the same
> sized object?!).

The size of two of the three slab caches is variable.

> And if they really do need one, surely something ala:
> 
> static atomic_long_t slab_index;
> 
> sprintf(slab_name, "foo-%ld", atomic_inc_return(&slab_index));
> 
> would be all you need.

A 32-bit counter wraps around after about 4 billion iterations, isn't
it?

Thanks,

Bart.


