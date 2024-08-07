Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E13A94AF10
	for <lists+nbd@lfdr.de>; Wed,  7 Aug 2024 19:45:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5A01820513; Wed,  7 Aug 2024 17:45:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug  7 17:45:10 2024
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MD5_SHA1_SUM,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AB494204CD
	for <lists-other-nbd@bendel.debian.org>; Wed,  7 Aug 2024 17:28:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.501 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ZMIbKsMM6S5C for <lists-other-nbd@bendel.debian.org>;
	Wed,  7 Aug 2024 17:28:38 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 491 seconds by postgrey-1.36 at bendel; Wed, 07 Aug 2024 17:28:38 UTC
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C4820204AF
	for <nbd@other.debian.org>; Wed,  7 Aug 2024 17:28:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 83489611E0;
	Wed,  7 Aug 2024 17:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DCEC32781;
	Wed,  7 Aug 2024 17:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723051223;
	bh=t/xnzJIShAShSeheceeLkwe+qhphG8/7tsBvktmb1r0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Kh4TkjoYLS9AA3aue+UMQFwV4x2jWY07SOuzLZfTDPGteH3nzQ6qeHRPe7HPGctXK
	 RNySl1ddcP33JRqjDWmWeEjjnQ+6PUu5uw4o1HdgL8pCE4i2Kh3dqyqahRMcFgIUU3
	 2N/TNsGe0bzTYmJMwrytavlaaozMVgwltFlKoPMGg0o+f+oZQ3DGX7fhyh0/IAEKKc
	 4IpJlBQ2qK4mWUH0b0BxXxZedNzzWdp5H6rq97j6uGJbr4Aj6s4im4qfZkrRTwTw/Z
	 AmmayJMj1ZtZ996ShxTEKwpVV2AEsHzSheNaTV31pkWxq7DDy+44IpXyFzxlPhZv/X
	 jIlbbLWNdt0gA==
Message-ID: <effc195f-9f0e-4e0d-95ab-5bae22702f95@kernel.org>
Date: Wed, 7 Aug 2024 10:20:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] nbd: correct the maximum value for discard sectors
To: Josef Bacik <josef@toxicpanda.com>, Wouter Verhelst <w@uter.be>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 nbd@other.debian.org, linux-kernel@vger.kernel.org
References: <20240803130432.5952-1-w@uter.be>
 <20240806133058.268058-1-w@uter.be> <20240806133058.268058-3-w@uter.be>
 <20240807135625.GA242945@perftesting>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240807135625.GA242945@perftesting>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6WGqrInOdCH.A.E8tB.mK7smB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3126
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/effc195f-9f0e-4e0d-95ab-5bae22702f95@kernel.org
Resent-Date: Wed,  7 Aug 2024 17:45:10 +0000 (UTC)

On 2024/08/07 6:56, Josef Bacik wrote:
> On Tue, Aug 06, 2024 at 03:30:56PM +0200, Wouter Verhelst wrote:
>> The version of the NBD protocol implemented by the kernel driver
>> currently has a 32 bit field for length values. As the NBD protocol uses
>> bytes as a unit of length, length values larger than 2^32 bytes cannot
>> be expressed.
>>
>> Update the max_hw_discard_sectors field to match that.
>>
>> Signed-off-by: Wouter Verhelst <w@uter.be>
>> Fixes: 268283244c0f018dec8bf4a9c69ce50684561f46
>> ---
>>  drivers/block/nbd.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> index 20e9f9fdeaae..1457f0c8a4a4 100644
>> --- a/drivers/block/nbd.c
>> +++ b/drivers/block/nbd.c
>> @@ -339,7 +339,7 @@ static int __nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
>>  
>>  	lim = queue_limits_start_update(nbd->disk->queue);
>>  	if (nbd->config->flags & NBD_FLAG_SEND_TRIM)
>> -		lim.max_hw_discard_sectors = UINT_MAX;
>> +		lim.max_hw_discard_sectors = UINT_MAX / blksize;
> 
> We use 512 as the "sectors" measurement throughout the block layer, so our limit
> is actually
> 
> UINT32_MAX >> 9

UINT_MAX >> SECTOR_SHIFT

would be better.

> 
> since we can only send at most UINT32_MAX as our length.  Fix it to be that for
> both patches and you should be good.  Thanks,
> 
> Josef
> 

-- 
Damien Le Moal
Western Digital Research

