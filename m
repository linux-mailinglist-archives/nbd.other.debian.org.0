Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9268D6AA5
	for <lists+nbd@lfdr.de>; Fri, 31 May 2024 22:27:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F149D205A3; Fri, 31 May 2024 20:27:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 31 20:27:08 2024
Old-Return-Path: <bvanassche@acm.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_LOW,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BD6D4205A8
	for <lists-other-nbd@bendel.debian.org>; Fri, 31 May 2024 20:09:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.8 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_LOW=-0.7] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OltH15ulUBdO for <lists-other-nbd@bendel.debian.org>;
	Fri, 31 May 2024 20:09:00 +0000 (UTC)
X-policyd-weight: using cached result; rate: -6.6
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailroute.net", Issuer "R3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 04FCD205A3
	for <nbd@other.debian.org>; Fri, 31 May 2024 20:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4VrZ2J2D3lz6CmR43;
	Fri, 31 May 2024 20:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1717186133; x=1719778134; bh=qJ3xjAYeIM5dfikpUZr//uQG
	9kmt6nHbhiUKNJJlmYs=; b=3IRa5vKiVTmcMmP2dIBQ+jae48HT3Ok31/z98R+a
	LHchjQhDyXzYbjUiwRpFHJzxnyQBMM9gvR/0SUxyxpzcUJkkc9repE8a3NjphYpO
	txMI6Fu6kJhgvXugIai+67m2Zpth3Ll42mTVo0fu1GEx0bAtdeQt3ytJZf5So+g+
	MAWAelgAZZ+K32B6020UtQEOgJ/X+wTPx+hRfim7GJSVNT2ZH9oXzcC3b+jl/SZx
	gGrPYSY7jedbvrN1H9nmTVL88nK25fDPaN9dQKyOmFgi1Joekk0MC+cKfHPjebv5
	PVt/IdxV1PEFSaOtSf5usvUUduo2uPGGLoNKHFVKsUTKjw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id xwebMED3Mh0l; Fri, 31 May 2024 20:08:53 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4VrZ2F0RsNz6CmSMs;
	Fri, 31 May 2024 20:08:52 +0000 (UTC)
Message-ID: <0a82785a-a417-4f53-8f3a-2a9ad3ab3bf7@acm.org>
Date: Fri, 31 May 2024 13:08:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: blktests failures with v6.10-rc1 kernel
To: Zhu Yanjun <zyjzyj2000@gmail.com>
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
References: <wnucs5oboi4flje5yvtea7puvn6zzztcnlrfz3lpzlwgblrxgw@7wvqdzioejgl>
 <6cd21274-50b3-44c5-af48-179cbd08b1ba@linux.dev>
 <b29f3a7a-3d58-44e1-b4ab-dbb4420c04a9@acm.org>
 <CAD=hENdBGcBSzcaniH+En6gecpay7S-fm1foEg5vmuXiVYxhpQ@mail.gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CAD=hENdBGcBSzcaniH+En6gecpay7S-fm1foEg5vmuXiVYxhpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tExCLaEb_ME.A.PaGC.cKjWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2885
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/0a82785a-a417-4f53-8f3a-2a9ad3ab3bf7@acm.org
Resent-Date: Fri, 31 May 2024 20:27:08 +0000 (UTC)

On 5/31/24 13:06, Zhu Yanjun wrote:
> On Fri, May 31, 2024 at 10:01=E2=80=AFPM Bart Van Assche <bvanassche@ac=
m.org> wrote:
>>
>> On 5/31/24 07:35, Zhu Yanjun wrote:
>>> IIRC, the problem with srp/002, 011 also occurs with siw driver, do y=
ou make
>>> tests with siw driver to verify whether the problem with srp/002, 011=
 is also > fixed or not?
>>
>> I have not yet seen any failures of any of the SRP tests when using th=
e siw driver.
>> What am I missing?
 >
 > (left out a bunch of forwarded emails)

Forwarding emails is not useful, especially if these emails do not answer=
 the question
that I asked.

Thanks,

Bart.

