Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8328D3113
	for <lists+nbd@lfdr.de>; Wed, 29 May 2024 10:24:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 31E89204FA; Wed, 29 May 2024 08:24:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 29 08:24:20 2024
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 302BB204B8
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 May 2024 08:08:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.5 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id S_ZZY_nuBwKr for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 May 2024 08:08:01 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 411 seconds by postgrey-1.36 at bendel; Wed, 29 May 2024 08:08:01 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 64863204B6
	for <nbd@other.debian.org>; Wed, 29 May 2024 08:08:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 34657CE17E7;
	Wed, 29 May 2024 08:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775ACC2BD10;
	Wed, 29 May 2024 08:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716970076;
	bh=03smAZVJ+ZngbkLzugn+0eqk3vVwA0F29enlttGAPng=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bpShr1IttagkOMnjhsCdo/g2zCZdY/J9hEgnQoOTkwd/TZHIkKASoDSf8+3m+pnEU
	 5dgEnznMnW+pmlqrkv7jTaUFTY8kya1x2kUeM5RGbZFNTb0NPcdTvktgyScpIfQiJz
	 9SYMygauOoY+shIGTFDnwWQBHpng4+D37VR3bFWoOFjpfjsD6ALyH7jGpvSUfQiild
	 6MYzCPhcHg2QsVviU+udRgGt0N3LKskHM5NeZnp90eaxAQpCTzBcjNqXPPgoNsWukV
	 tC4NqjBN6Q6n3ZjWDlVJ+cmaEz8hv6lMBRlGWijOn043mJOWWcO86EQJdQiEIrkwsT
	 sU1UkJ18oQYDg==
Message-ID: <24cad983-a1a0-4983-989d-79bcc9fd8a0a@kernel.org>
Date: Wed, 29 May 2024 17:07:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] sd: simplify the ZBC case in
 provisioning_mode_store
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, Josef Bacik
 <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
References: <20240529050507.1392041-1-hch@lst.de>
 <20240529050507.1392041-4-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240529050507.1392041-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3w0-srPIvHP.A.8BGC.0YuVmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2828
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/24cad983-a1a0-4983-989d-79bcc9fd8a0a@kernel.org
Resent-Date: Wed, 29 May 2024 08:24:20 +0000 (UTC)

On 5/29/24 14:04, Christoph Hellwig wrote:
> Don't reset the discard settings to no-op over and over when a user
> writes to the provisioning attribute as that is already the default
> mode for ZBC devices.  In hindsight we should have made writing to
> the attribute fail for ZBC devices, but the code has probably been
> around for far too long to change this now.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/scsi/sd.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
> index 3dff9150ce11e2..15d0035048d902 100644
> --- a/drivers/scsi/sd.c
> +++ b/drivers/scsi/sd.c
> @@ -461,14 +461,13 @@ provisioning_mode_store(struct device *dev, struct device_attribute *attr,
>  	if (!capable(CAP_SYS_ADMIN))
>  		return -EACCES;
>  
> -	if (sd_is_zoned(sdkp)) {
> -		sd_config_discard(sdkp, SD_LBP_DISABLE);
> -		return count;
> -	}
> -
>  	if (sdp->type != TYPE_DISK)
>  		return -EINVAL;
>  
> +	/* ignore the proivisioning mode for ZBB devices */

s/proivisioning/provisioning
s/ZBB/ZBC

With that fixed,

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

> +	if (sd_is_zoned(sdkp))
> +		return count;
> +
>  	mode = sysfs_match_string(lbp_mode, buf);
>  	if (mode < 0)
>  		return -EINVAL;

-- 
Damien Le Moal
Western Digital Research

