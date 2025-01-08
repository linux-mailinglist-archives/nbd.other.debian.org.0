Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9F7A05844
	for <lists+nbd@lfdr.de>; Wed,  8 Jan 2025 11:37:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C106820725; Wed,  8 Jan 2025 10:37:05 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan  8 10:37:05 2025
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2C423206DA
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Jan 2025 10:21:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.84 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6JiH2yOTF2fe for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Jan 2025 10:21:17 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 00313206F6
	for <nbd@other.debian.org>; Wed,  8 Jan 2025 10:21:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76D2AA40D77;
	Wed,  8 Jan 2025 10:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA48C4CEDF;
	Wed,  8 Jan 2025 10:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736331673;
	bh=JFHL9CU+SvxdU55U39KRsBzQCKSkGxUcXFDn7BoFcMY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nFYrl7fp4fSPfIdVuMpJVBP6b3YldyaJpmtL8UGYeBOMd6X2fQZZKxcTko0MCHdEJ
	 jH+d4p+hrcpoLhM/023ELdse4fADysYzrU4Z1ABYpmpZi4cPVVGCnwlcjgpi+VvKJj
	 dxY8a/ceS4/CCMOQe2Z0kfi3cYBICxBW6R6rSgk7+6thjO0oVE0vCMDT4weAOb5gbw
	 PlnE5uQCecncE61izjeK/LRIhERUBfol6ssf6s3WOok59Uqvw/oQ6KSKZkaBmCHckz
	 c794gfsJc4uTMT+CqG5cQKseRKYv1Sfh7V3wFWlLsVnKTaew/CCMnZpmKNZicaqh4j
	 06hM49PLKaXRg==
Message-ID: <f3ca343b-0ff1-417b-b2ff-7ea166fb82b2@kernel.org>
Date: Wed, 8 Jan 2025 19:20:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] loop: fix queue freeze vs limits lock order
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Nilay Shroff <nilay@linux.ibm.com>,
 linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
 nbd@other.debian.org, linux-scsi@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net
References: <20250108092520.1325324-1-hch@lst.de>
 <20250108092520.1325324-11-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250108092520.1325324-11-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3wjQ0RVupxJ.A.QUqO.RVlfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3286
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f3ca343b-0ff1-417b-b2ff-7ea166fb82b2@kernel.org
Resent-Date: Wed,  8 Jan 2025 10:37:05 +0000 (UTC)

On 1/8/25 6:25 PM, Christoph Hellwig wrote:
> Match the locking order used by the core block code by only freezing
> the queue after taking the limits lock using the
> queue_limits_commit_update_frozen helper and document the callers that
> do not freeze the queue at all.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

