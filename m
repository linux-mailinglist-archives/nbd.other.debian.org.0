Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CDF94D3F8
	for <lists+nbd@lfdr.de>; Fri,  9 Aug 2024 17:51:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2D11720493; Fri,  9 Aug 2024 15:51:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug  9 15:51:10 2024
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MD5_SHA1_SUM,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 00F392048C
	for <lists-other-nbd@bendel.debian.org>; Fri,  9 Aug 2024 15:33:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.501 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tqAHy-C54ijE for <lists-other-nbd@bendel.debian.org>;
	Fri,  9 Aug 2024 15:33:47 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 621 seconds by postgrey-1.36 at bendel; Fri, 09 Aug 2024 15:33:47 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5F9532048B
	for <nbd@other.debian.org>; Fri,  9 Aug 2024 15:33:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 71A0BCE17D8;
	Fri,  9 Aug 2024 15:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C45C32782;
	Fri,  9 Aug 2024 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723216977;
	bh=JXgqr/Sam3GPZVjYZJbudhL0ZA1FcrWTjiR3hqiEghY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rAv7mnaAx8h+TX9kus/iPdwnzuZyDcrRVa/TNV+nGlio66QBggXxkw51uYO7RaA/p
	 K7Bk0uGj9g00iv2z4H1ngTnSli0hThrSAcJ5GHcz414zG0GYBgM/KdSZejHo5jlGpo
	 0cIhSVcYYYfoUJPszp2G+ZQC/F/bvEk2wlW7mt7IGsMRRSAL0R6NjSz6TQyJ+9oGPN
	 xCd9vUTPIhxdIZTY2YdD48yzO8NES6EOb6ZzjMyhFyeO8xtfC74Z4LU7tToFETEBzB
	 vlDMVS3kCl7qG7LpeT/prLVeLexrkKuVDHPCu9vtUbNVFBNpghCRifFWuph+dt3AJU
	 g99CxZHyUTj2w==
Message-ID: <43ff6de8-a4f0-4606-bfa1-15fb1be2310a@kernel.org>
Date: Fri, 9 Aug 2024 08:22:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] nbd: correct the maximum value for discard sectors
To: Wouter Verhelst <w@uter.be>, Josef Bacik <josef@toxicpanda.com>,
 Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <20240803130432.5952-1-w@uter.be>
 <20240808070604.179799-1-w@uter.be> <20240808070604.179799-3-w@uter.be>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240808070604.179799-3-w@uter.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2xFIrsTjZYP.A.oQsI.trjtmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3131
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/43ff6de8-a4f0-4606-bfa1-15fb1be2310a@kernel.org
Resent-Date: Fri,  9 Aug 2024 15:51:10 +0000 (UTC)

On 2024/08/08 0:06, Wouter Verhelst wrote:
> The version of the NBD protocol implemented by the kernel driver
> currently has a 32 bit field for length values. As the NBD protocol uses
> bytes as a unit of length, length values larger than 2^32 bytes cannot
> be expressed.
> 
> Update the max_hw_discard_sectors field to match that.
> 
> Signed-off-by: Wouter Verhelst <w@uter.be>
> Fixes: 268283244c0f018dec8bf4a9c69ce50684561f46
> Cc: Damien Le Moal <dlemoal@kernel.org>
> ---
>  drivers/block/nbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index fdcf0bbedf3b..235ab5f59608 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -339,7 +339,7 @@ static int __nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
>  
>  	lim = queue_limits_start_update(nbd->disk->queue);
>  	if (nbd->config->flags & NBD_FLAG_SEND_TRIM)
> -		lim.max_hw_discard_sectors = UINT_MAX;
> +		lim.max_hw_discard_sectors = UINT_MAX >> SECTOR_SHIFT;
>  	else
>  		lim.max_hw_discard_sectors = 0;
>  	if (!(nbd->config->flags & NBD_FLAG_SEND_FLUSH)) {

Looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

