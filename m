Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB6F9909AC
	for <lists+nbd@lfdr.de>; Fri,  4 Oct 2024 18:48:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BB1C920794; Fri,  4 Oct 2024 16:48:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Oct  4 16:48:09 2024
Old-Return-Path: <bvanassche@acm.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E437520668
	for <lists-other-nbd@bendel.debian.org>; Fri,  4 Oct 2024 16:32:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id wvI8NGrSX3xE for <lists-other-nbd@bendel.debian.org>;
	Fri,  4 Oct 2024 16:32:02 +0000 (UTC)
X-policyd-weight: using cached result; rate: -6.6
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailroute.net", Issuer "R10" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7D3232065E
	for <nbd@other.debian.org>; Fri,  4 Oct 2024 16:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4XKvFp1xZYzlgMWK;
	Fri,  4 Oct 2024 16:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1728059516; x=1730651517; bh=iz9E1I6B8CwQ/5Yzuw1pMYrb
	YElB81ywXT4KH+Y7XQU=; b=NtWN6QkJCsV2r4R8WncnrhauO+tSXdue3HbT2Lo2
	TDpVfmzofJmXb9frOoHfN+ksEB08Hw7t9ov20HCFj77TGHC/WrvQiMT5ofkCBPFm
	ETFqqTOAxjX+TS7q90mgXQ4etgqN9xs4Zp7FlkFb5UTAICXKVf91/35Muy4k6DTJ
	FZamWuaAGIDQBg8yOhwyplxc4qKNrDfRiHDiftADZxKMv97jfFnbchvHkqJEJwqO
	Cc//A0BUNEh+TX49PYYfqGpF+bRDDphYS00yKaXAwnGQWedQbw2KCFe/bJHJKPWa
	q/NHjCO7RiFTEMS8DzOSwa6iatxDF3Nrntu/91oG4hHVTA==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id MFDn1liQ5WJj; Fri,  4 Oct 2024 16:31:56 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4XKvFl5T3hzlgVnF;
	Fri,  4 Oct 2024 16:31:55 +0000 (UTC)
Message-ID: <9fe72efb-46b8-4a72-b29c-c60a8c64f88c@acm.org>
Date: Fri, 4 Oct 2024 09:31:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: blktests failures with v6.12-rc1 kernel
To: Zhu Yanjun <yanjun.zhu@linux.dev>,
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
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <5cff6598-21f3-4e85-9a06-f3a28380585b@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <H8jamdNB0LP.A.b08E.JxBAnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3156
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/9fe72efb-46b8-4a72-b29c-c60a8c64f88c@acm.org
Resent-Date: Fri,  4 Oct 2024 16:48:09 +0000 (UTC)

On 10/4/24 5:40 AM, Zhu Yanjun wrote:
> So I add a jiffies (u64) value into the name.

I don't think that embedding the value of the jiffies counter in the 
kmem cache names is sufficient to make cache names unique. That sounds 
like a fragile approach to me.

Bart.

