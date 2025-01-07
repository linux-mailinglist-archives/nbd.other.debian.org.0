Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C1902A03C3F
	for <lists+nbd@lfdr.de>; Tue,  7 Jan 2025 11:24:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A611720739; Tue,  7 Jan 2025 10:24:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  7 10:24:20 2025
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DFB5D20720
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jan 2025 10:07:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.538 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vp3y33vxJkm2 for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jan 2025 10:07:51 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 440 seconds by postgrey-1.36 at bendel; Tue, 07 Jan 2025 10:07:51 UTC
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4B95020728
	for <nbd@other.debian.org>; Tue,  7 Jan 2025 10:07:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1F205C3F07;
	Tue,  7 Jan 2025 09:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CF0C4CED6;
	Tue,  7 Jan 2025 10:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736244009;
	bh=VKQPgS4SnN96nY/5RA10CNSAWUjHNFtO30HNuewnXRo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XRm4c/7fpeQvzPjN/W88+/YSBAo8AVk768mSxI6ihf8Y2c5EX3L+KSW3FiIt3kbUl
	 HVkj+IVJJRoGt7pfFNmuWmJZWr78sFl+La1SWEZJ/lOTMqJJ+BvWSJ2S3DpNrlxCpa
	 fkZ6RxHEksAJJutrafI+ipaIUBC4fmbV0x6aQ6YdxCQmGwkJkT4Hy9Kdodcpvd44kf
	 291Bp4awwPcnu+wWwQfOHEswWesNfz63OhgrNk+ejEKd0mOlJvKZF9atGU5FCjtYVq
	 kOy6gkM3vJchS4oYjARE5WlMONzSowGm7kgJ7tE96m31/G/+8d4Rfwg8dk+AikxAyc
	 I+O9Iq9/SMyIQ==
Message-ID: <206497e1-883f-4901-b061-b3ddb02965b2@kernel.org>
Date: Tue, 7 Jan 2025 19:00:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] nbd: fix queue freeze vs limits lock order
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Nilay Shroff <nilay@linux.ibm.com>,
 linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
 nbd@other.debian.org, linux-scsi@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net
References: <20250107063120.1011593-1-hch@lst.de>
 <20250107063120.1011593-8-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250107063120.1011593-8-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mGki6xIwQYP.A.qD_J.UDQfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3262
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/206497e1-883f-4901-b061-b3ddb02965b2@kernel.org
Resent-Date: Tue,  7 Jan 2025 10:24:20 +0000 (UTC)

On 1/7/25 15:30, Christoph Hellwig wrote:
> Match the locking order used by the core block code by only freezing
> the queue after taking the limits lock using the
> queue_limits_commit_update_frozen helper.
> 
> This also allows removes the need for the separate __nbd_set_size helper,
> so remove it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

