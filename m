Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0DA8D6A99
	for <lists+nbd@lfdr.de>; Fri, 31 May 2024 22:18:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3F93A205D6; Fri, 31 May 2024 20:18:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 31 20:18:13 2024
Old-Return-Path: <bvanassche@acm.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_LOW,TO_TOO_MANY,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 07CD52058C
	for <lists-other-nbd@bendel.debian.org>; Fri, 31 May 2024 20:01:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.8 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_LOW=-0.7, TO_TOO_MANY=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id sh3GdUzkDHtR for <lists-other-nbd@bendel.debian.org>;
	Fri, 31 May 2024 20:01:44 +0000 (UTC)
X-policyd-weight: using cached result; rate: -6.6
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailroute.net", Issuer "R3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id ECC432055B
	for <nbd@other.debian.org>; Fri, 31 May 2024 20:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4VrYsw0P8dzlgMVh;
	Fri, 31 May 2024 20:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1717185698; x=1719777699; bh=wJVz7bNhHOT1cnkm63pYOAOw
	3gi8sYgMJUnqLRq3Cg8=; b=0qaWpk7LyCjJgdcs5tFsFpgx3U3bRd02qzRhuffi
	vrRsYtwQPZjIv+79S0usRcHMXbjCZqBHevbisr2+SU/LkqtyzMlmPKQJIx0M05XT
	u1J1xOmofSVaKUGXZFArJgAytpjE3rCaRq3EWUrPjwfueCmlmpdSCsFCVUJOFsq1
	v/ib1zsZv4/ZVt+U4abRuTlDklcFKPAAk1Rv7DyhnYFg+P0Neb6DhMbxzfoB4bF6
	4u528cDpoABVbf35aQElwopj+uuEiYTTD3JVRyPqFS7OYCovWQvpmgxfKu02ePMM
	l4clx/11ej7G9yeT+V7+OgszY1q6qM3d6i74xszNCDVJdQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id imhqH5Wwtsdr; Fri, 31 May 2024 20:01:38 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4VrYss1qT7zlgMVf;
	Fri, 31 May 2024 20:01:36 +0000 (UTC)
Message-ID: <b29f3a7a-3d58-44e1-b4ab-dbb4420c04a9@acm.org>
Date: Fri, 31 May 2024 13:01:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: blktests failures with v6.10-rc1 kernel
To: Zhu Yanjun <zyjzyj2000@gmail.com>,
 Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
References: <wnucs5oboi4flje5yvtea7puvn6zzztcnlrfz3lpzlwgblrxgw@7wvqdzioejgl>
 <6cd21274-50b3-44c5-af48-179cbd08b1ba@linux.dev>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <6cd21274-50b3-44c5-af48-179cbd08b1ba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EhMDIptiNBE.A.KWFC.FCjWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2884
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b29f3a7a-3d58-44e1-b4ab-dbb4420c04a9@acm.org
Resent-Date: Fri, 31 May 2024 20:18:13 +0000 (UTC)

On 5/31/24 07:35, Zhu Yanjun wrote:
> IIRC, the problem with srp/002, 011 also occurs with siw driver, do you make
> tests with siw driver to verify whether the problem with srp/002, 011 is also > fixed or not?

I have not yet seen any failures of any of the SRP tests when using the siw driver.
What am I missing?

Thanks,

Bart.

