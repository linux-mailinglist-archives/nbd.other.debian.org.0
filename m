Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 949FC504DB9
	for <lists+nbd@lfdr.de>; Mon, 18 Apr 2022 10:24:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7C049203E6; Mon, 18 Apr 2022 08:24:38 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 18 08:24:38 2022
Old-Return-Path: <prvs=10001294c=damien.lemoal@opensource.wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9324C2035E
	for <lists-other-nbd@bendel.debian.org>; Mon, 18 Apr 2022 08:08:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.772 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.282, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uFlo3tRgaH1u for <lists-other-nbd@bendel.debian.org>;
	Mon, 18 Apr 2022 08:08:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hgst.iphmx.com", Issuer "Go Daddy Secure Certificate Authority - G2" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D28FE20222
	for <nbd@other.debian.org>; Mon, 18 Apr 2022 08:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650269307; x=1681805307;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3/KeY74fCa89/HKmeQeN7bAvF9g3Fcpr0R9Z+15MzFA=;
  b=mPWLgRzIze/+1r6nDGmMQFmqEkxUEoBpN6L92YuaTPaX53DaMtxCiDWs
   pzKrXbmteL/oCzcQKFvqRL/+2WJElDfpnxHrSx3qGvXBwEYmzC278slex
   CVlcU7izabmbU2LGiZKZj3t/i4zuMaOUmvIUPxKfKvq8NA4sdBzMMWWxt
   E0k33IBX81jCGhoqwBwVpM1wrt1JRqLFJutHIHLsosezta09ILwqFgdCs
   azmngLX+4ObZyCBJ+HpgXNt5tJ9XY1ldpOEifzj45O9dCcQH95hdXfsUT
   vMbhO6Fa6qlRfnAi7cxZMCHmFWEJMozFNLjAA3UH0f/ME4mSf29fyNuth
   w==;
X-IronPort-AV: E=Sophos;i="5.90,269,1643644800"; 
   d="scan'208";a="199047589"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 18 Apr 2022 16:01:07 +0800
IronPort-SDR: 53lY83Ymf1Gj+sfXcc/SEnpccyV9eaJHRi7SgQXQ9Bs+t8d2KCV0cA9XWwU+gy0Vr7u6yeWUJX
 Mr7y/ndSuM3e8OkE0U8yQgmMUBjnLmdykUqqS3JWWGLtWM3B90fjoWrDX5aZG5hC17kTVC/ciY
 Qw+n4Odh4w8QXRrfw/GMcyjJQ1FFNHqbOzic9pQ6akGEmI7a4Z/FArFaGa3xaUnCJ/9ug2foHo
 2vQsOTUO++YK9vULHbyqGXchbEaLstukoVLdhmU9YZrCJCM7Fd7ELzKv5acq4wDYDyWL3+Ij8C
 dnXtitcV0aeHPZ7jXFtUwfV5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2022 00:32:14 -0700
IronPort-SDR: /Ihf6ghhJibBxLHAA2gX6MzpaO4W9VyYS7TdlxAenVjqmnKt5rCTRjtImjsyufmQF5qVhcaI5l
 08q099+ySpQZqOJa72dvKO+ustOKUTufmfwtLYjPqepqEYItdMr4VEDbiR/oQvpjMEFSKH50Eu
 G4dHk7118O7Cp35SzMAbqQ99mCJBYvtRmJohJEbv8b3HLhn23S4OejRHSnDLjVj2bevsU6UMQH
 00wTIs7Llp4ZyIMNJ4BqLGqLK5d/poqI7X0d9rXtRmk/Ex5rs9S9zhOxLsxwktXhyY1Gz2HD19
 daY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2022 01:01:07 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KhfWk2XcKz1SVp1
	for <nbd@other.debian.org>; Mon, 18 Apr 2022 01:01:06 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1650268865; x=1652860866; bh=3/KeY74fCa89/HKmeQeN7bAvF9g3Fcpr0R9
	Z+15MzFA=; b=ACjR9UWryki+eudgsq/STqOr+GWbZj16v+u8a2Dftxm2lDM945o
	bVfFaY/GsX43zY1Oaqxrub1Jc7lHHvzftjDWfDRuVxraf/ZRLqw//ZXMp0b77lQF
	9nYnsBvjkMg6iSu1Rv/HmkRv1DVTbN1qSEzerCzsXyF6bp1SxFaGiDvrfWwA/S8s
	Ou+wVx4dk6/UkHkzLXk1TgA23a21B8j7ugHMvIsEFVP+7333Loa1WdkbITzQ4Hw9
	emhVU3z9B140JbFTYr/MrEfmv94Pd9Ofm/6fRMxFKfgG5QPr8AyMYWl9tghfqOsu
	In8Vw6oTR+9i83mC26mJTU/FoazxybA/EHA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id onINTXCE5ERy for <nbd@other.debian.org>;
	Mon, 18 Apr 2022 01:01:05 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KhfWd1wHlz1Rvlx;
	Mon, 18 Apr 2022 01:01:01 -0700 (PDT)
Message-ID: <fb5baf81-fa19-bb48-865c-e13277a0952a@opensource.wdc.com>
Date: Mon, 18 Apr 2022 17:01:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [dm-devel] [PATCH 03/11] null_blk: don't set the
 discard_alignment queue limit
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Jan Hoeppner <hoeppner@linux.ibm.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 linux-nvme@lists.infradead.org, virtualization@lists.linux-foundation.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>,
 linux-s390@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 xen-devel@lists.xenproject.org, linux-um@lists.infradead.org,
 Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 nbd@other.debian.org, linux-block@vger.kernel.org,
 Stefan Haberland <sth@linux.ibm.com>, linux-raid@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220418045314.360785-1-hch@lst.de>
 <20220418045314.360785-4-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220418045314.360785-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <d67dsq2wBgC.A.K1D.GBSXiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2033
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/fb5baf81-fa19-bb48-865c-e13277a0952a@opensource.wdc.com
Resent-Date: Mon, 18 Apr 2022 08:24:38 +0000 (UTC)

On 4/18/22 13:53, Christoph Hellwig wrote:
> The discard_alignment queue limit is named a bit misleading means the
> offset into the block device at which the discard granularity starts.
> Setting it to the discard granularity as done by null_blk is mostly
> harmless but also useless.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/null_blk/main.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
> index 5cb4c92cdffea..a521e914a9843 100644
> --- a/drivers/block/null_blk/main.c
> +++ b/drivers/block/null_blk/main.c
> @@ -1765,7 +1765,6 @@ static void null_config_discard(struct nullb *nullb)
>  	}
>  
>  	nullb->q->limits.discard_granularity = nullb->dev->blocksize;
> -	nullb->q->limits.discard_alignment = nullb->dev->blocksize;
>  	blk_queue_max_discard_sectors(nullb->q, UINT_MAX >> 9);
>  }
>  

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

