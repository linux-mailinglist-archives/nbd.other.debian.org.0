Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DA98D6D77
	for <lists+nbd@lfdr.de>; Sat,  1 Jun 2024 04:12:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B7B0F20572; Sat,  1 Jun 2024 02:12:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Jun  1 02:12:28 2024
Old-Return-Path: <yanjun.zhu@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 514CD20570
	for <lists-other-nbd@bendel.debian.org>; Sat,  1 Jun 2024 01:56:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JdSgALMdn02x for <lists-other-nbd@bendel.debian.org>;
	Sat,  1 Jun 2024 01:56:32 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .linux. - helo: .out-170.mta0.migadu. - helo-domain: .migadu.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
X-Greylist: delayed 404 seconds by postgrey-1.36 at bendel; Sat, 01 Jun 2024 01:56:32 UTC
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CA1412056E
	for <nbd@other.debian.org>; Sat,  1 Jun 2024 01:56:32 +0000 (UTC)
Old-X-Envelope-To: bvanassche@acm.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1717206585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V8WfBxq8XLRTBZ5tQIhY0Q9aeK+UOqcJTpHkcaQ+TpQ=;
	b=h1JCQf3bfvXrbdLOdGdABlt8LfZALDMGbAVnfTqDUYOxSM3Tq18lpwx0IEIulB64lhNDA3
	hEnw9oEijJgYuLz0ms7jokSKK7Z/9F0rB7hrgOkVmnHSUmodBVnfAwpV9MjYzzJQb9nOBk
	94sVvCusQLEVWDHsZow2xEDcZ6Ha9cQ=
Old-X-Envelope-To: zyjzyj2000@gmail.com
Old-X-Envelope-To: shinichiro.kawasaki@wdc.com
Old-X-Envelope-To: linux-block@vger.kernel.org
Old-X-Envelope-To: linux-nvme@lists.infradead.org
Old-X-Envelope-To: linux-scsi@vger.kernel.org
Old-X-Envelope-To: nbd@other.debian.org
Old-X-Envelope-To: linux-rdma@vger.kernel.org
Message-ID: <53f5e515-bad2-4094-ab7a-64d807ce1223@linux.dev>
Date: Sat, 1 Jun 2024 03:49:39 +0200
MIME-Version: 1.0
Subject: Re: blktests failures with v6.10-rc1 kernel
To: Bart Van Assche <bvanassche@acm.org>, Zhu Yanjun <zyjzyj2000@gmail.com>
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
 <0a82785a-a417-4f53-8f3a-2a9ad3ab3bf7@acm.org>
 <CAD=hENdgS40CmZs2o5M_O71k07Q7txg9-2XnaHP97_+eC9xT3w@mail.gmail.com>
 <81a63f38-fab0-4536-bbc2-3f06752a7f9e@acm.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <81a63f38-fab0-4536-bbc2-3f06752a7f9e@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <c4W7PT8E-cP.A.7ffG.MOoWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2888
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/53f5e515-bad2-4094-ab7a-64d807ce1223@linux.dev
Resent-Date: Sat,  1 Jun 2024 02:12:28 +0000 (UTC)

在 2024/5/31 22:46, Bart Van Assche 写道:
> On 5/31/24 13:35, Zhu Yanjun wrote:
>> On Fri, May 31, 2024 at 10:08 PM Bart Van Assche <bvanassche@acm.org> 
>> wrote:
>>>
>>> On 5/31/24 13:06, Zhu Yanjun wrote:
>>>> On Fri, May 31, 2024 at 10:01 PM Bart Van Assche 
>>>> <bvanassche@acm.org> wrote:
>>>>>
>>>>> On 5/31/24 07:35, Zhu Yanjun wrote:
>>>>>> IIRC, the problem with srp/002, 011 also occurs with siw driver, 
>>>>>> do you make
>>>>>> tests with siw driver to verify whether the problem with srp/002, 
>>>>>> 011 is also > fixed or not?
>>>>>
>>>>> I have not yet seen any failures of any of the SRP tests when using 
>>>>> the siw driver.
>>>>> What am I missing?
>>>   >
>>>   > (left out a bunch of forwarded emails)
>>>
>>> Forwarding emails is not useful, especially if these emails do not 
>>> answer the question
>>> that I asked.
>>
>> Bob had made tests with siw. From his mail, it seems that the similar
>> problem also occurs with SIW.
> 
> I'm not aware of anyone other than Bob having reported failures of the 
> SRP tests
> in combination with the siw driver.

At that time, I had not reproduce this problem with SIW, either.

Zhu Yanjun

> 
> Thanks,
> 
> Bart.
> 

