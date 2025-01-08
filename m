Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A9474A0583B
	for <lists+nbd@lfdr.de>; Wed,  8 Jan 2025 11:36:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8DB9B2077B; Wed,  8 Jan 2025 10:36:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan  8 10:36:09 2025
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D83C0206F6
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Jan 2025 10:18:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.84 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Lf3ssrC0C0XX for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Jan 2025 10:18:38 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id EBA31206DA
	for <nbd@other.debian.org>; Wed,  8 Jan 2025 10:18:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2176BA40C4C;
	Wed,  8 Jan 2025 10:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1355BC4CEDF;
	Wed,  8 Jan 2025 10:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736331514;
	bh=Iy5y7jGbSKm6Vq5JK20bohcBwxpWKQDfh6OOx83t328=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QD+QE/TkcsrwKbypzGxkRH74jesRHo7N/TVTwwaRTX1BK6YV31BvoNwrqbEIMyTzc
	 YsqaLoUBB2CpZLNgCwoSkbjThGxFUFAywHWZh8rrQU0gZqu5xJQWngS0f66RNzIhCs
	 yr1VQp13GpGvrn86SDRDkZwNzzlr934q084+hllsSS+JINHAi57szQ6f2jfdci1Frx
	 jRyceuVuRl3A1d0D9YAt2ZcuTmEuIBQAD1JM4yHFDdjdWJ/cxMK5gyqMk+QNR4H1NZ
	 xeHP+U8QT1AjU/Q3WNvlgg6YwbygxMvHD0pS/pqCZDyl7YRaZukI1yrI6Jq8kL0370
	 34iL3Hf21PPMw==
Message-ID: <d5010a1b-f458-4f1e-b7ab-e0f8210b9af7@kernel.org>
Date: Wed, 8 Jan 2025 19:17:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] block: don't update BLK_FEAT_POLL in
 __blk_mq_update_nr_hw_queues
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Nilay Shroff <nilay@linux.ibm.com>,
 linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
 nbd@other.debian.org, linux-scsi@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net
References: <20250108092520.1325324-1-hch@lst.de>
 <20250108092520.1325324-4-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250108092520.1325324-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <MWOUkbwJguC.A.LAqO.ZUlfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3281
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d5010a1b-f458-4f1e-b7ab-e0f8210b9af7@kernel.org
Resent-Date: Wed,  8 Jan 2025 10:36:09 +0000 (UTC)

On 1/8/25 6:25 PM, Christoph Hellwig wrote:
> When __blk_mq_update_nr_hw_queues changes the number of tag sets, it
> might have to disable poll queues.  Currently it does so by adjusting
> the BLK_FEAT_POLL, which is a bit against the intent of features that
> describe hardware / driver capabilities, but more importantly causes
> nasty lock order problems with the broadly held freeze when updating the
> number of hardware queues and the limits lock.  Fix this by leaving
> BLK_FEAT_POLL alone, and instead check for the number of poll queues in
> the bio submission and poll handlers.  While this adds extra work to the
> fast path, the variables are in cache lines used by these operations
> anyway, so it should be cheap enough.
> 
> Fixes: 8023e144f9d6 ("block: move the poll flag to queue_limits")
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

