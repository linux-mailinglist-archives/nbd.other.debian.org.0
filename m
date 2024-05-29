Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC948D3136
	for <lists+nbd@lfdr.de>; Wed, 29 May 2024 10:27:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 13C80204DB; Wed, 29 May 2024 08:27:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 29 08:27:20 2024
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 74A1C204B8
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 May 2024 08:11:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.5 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LOzPvFz6P0dr for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 May 2024 08:11:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 385 seconds by postgrey-1.36 at bendel; Wed, 29 May 2024 08:11:43 UTC
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 097BD204B6
	for <nbd@other.debian.org>; Wed, 29 May 2024 08:11:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C59562769;
	Wed, 29 May 2024 08:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC3FAC2BD10;
	Wed, 29 May 2024 08:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716969914;
	bh=blmbzNIoOv7Q3qES0R0/fx18waY7Hk11DTOByTzWHdc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SFYbjMJRJ6TIxFXkpgxG4GyzyI/tGBapJQlaGBsNH35uF5q0J/+ufhABOEt5aku5A
	 OGZ/sMeIOSXH403CaXaX972OKhKJYoQKJJDBM5BKOy6U8Nl6vudfsO6HMEQn0f+nwQ
	 EEJNnQcb59MH+bO1MBxpMjGfNAxOzKZEQYEFEGgG3tXhnEMyC0CEKrwsbiSwmPGa0h
	 XlxMBzvwrj6cpKyibCWOGaP3KUxu2jy3ox/5rATAy/QYehwu9ehrekMkeR3fcUmmMZ
	 Z5STO7HCskML/36YIjpBFP0Bm0HiT4KQ6nulMQvLBqHtZ3L7qdm7OgC52ERnL5CdaG
	 wz7IMJehNc1hg==
Message-ID: <f39216c0-f11d-4d4a-ae40-b4cf82e4760e@kernel.org>
Date: Wed, 29 May 2024 17:05:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] block: take io_opt and io_min into account for
 max_sectors
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
 <20240529050507.1392041-3-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240529050507.1392041-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <e-RQeZ4IO2D.A.FyNC.obuVmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2830
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f39216c0-f11d-4d4a-ae40-b4cf82e4760e@kernel.org
Resent-Date: Wed, 29 May 2024 08:27:20 +0000 (UTC)

On 5/29/24 14:04, Christoph Hellwig wrote:
> The soft max_sectors limit is normally capped by the hardware limits and
> an arbitrary upper limit enforced by the kernel, but can be modified by
> the user.  A few drivers want to increase this limit (nbd, rbd) or
> adjust it up or down based on hardware capabilities (sd).
> 
> Change blk_validate_limits to default max_sectors to the optimal I/O
> size, or upgrade it to the preferred minimal I/O size if that is
> larger than the kernel default if no optimal I/O size is provided based
> on the logic in the SD driver.
> 
> This keeps the existing kernel default for drivers that do not provide
> an io_opt or very big io_min value, but picks a much more useful
> default for those who provide these hints, and allows to remove the
> hacks to set the user max_sectors limit in nbd, rbd and sd.
> 
> Note that rd picks a different value for the optimal I/O size vs the
> user max_sectors value, so this is a bit of a behavior change that
> could use careful review from people familiar with rbd.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

