Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6D5A023EA
	for <lists+nbd@lfdr.de>; Mon,  6 Jan 2025 12:06:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 322CD206EC; Mon,  6 Jan 2025 11:06:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan  6 11:06:20 2025
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LONGWORD,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1C193206C0
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Jan 2025 10:49:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.84 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LONGWORD=2,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id TwjQSDjFqloK for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Jan 2025 10:49:15 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CCFCA206BF
	for <nbd@other.debian.org>; Mon,  6 Jan 2025 10:49:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DF4BEA4145E;
	Mon,  6 Jan 2025 10:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58D2C4CEE0;
	Mon,  6 Jan 2025 10:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736160135;
	bh=euhWvUhz5CciYJh8Yuw2cExBVHc9+EtlTZ1pgZbX7Ho=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hUODWLJYC9lAQuwth5KQ9f/9n4JkccHviDS4BUW+GVnYUc95BTbiEfTLJTO2cSnhI
	 RoGLBLJs/jDMAKfkGSoG8fMvgAx1f+wf/EoLVq5jlCe5Aj3acYnWwRbQGefxm3Mk9y
	 Se7gjWn7ohH1ELKxO/yfEDpwedIExf6+QWU+QcTdeme4+2Syu5DERgr2CZJUWfbOaT
	 u1/Kl9WCgzP0ekKNfmY2vOBe+7Xpneq1f8fTkpfwoym9kbHfUXAwDhUN3RpSPjKDxE
	 Lq4zljlYQUJJRYaE589asV0Y2gFz7Ho5fL+S9ICfeYhrdshKYQIWtuuwVkio2eASNk
	 oPa63ka2qmKYg==
Message-ID: <c760f509-8902-429c-bf1b-526b1043c483@kernel.org>
Date: Mon, 6 Jan 2025 19:41:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] block: add a queue_limits_commit_update_frozen
 helper
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Nilay Shroff <nilay@linux.ibm.com>,
 linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
 nbd@other.debian.org, virtualization@lists.linux.dev,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
References: <20250106100645.850445-1-hch@lst.de>
 <20250106100645.850445-3-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250106100645.850445-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7FsALGIrpmC.A.vTUG.sk7enB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3220
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/c760f509-8902-429c-bf1b-526b1043c483@kernel.org
Resent-Date: Mon,  6 Jan 2025 11:06:20 +0000 (UTC)

On 1/6/25 7:06 PM, Christoph Hellwig wrote:
> Add a helper that freezes the queue, updates the queue limits and
> unfreezes the queue and convert all open coded versions of that to the
> new helper.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

[...]

> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 71a7ffeafb32..0a987f195630 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -1105,9 +1105,7 @@ cache_type_store(struct device *dev, struct device_attribute *attr,
>  		lim.features |= BLK_FEAT_WRITE_CACHE;
>  	else
>  		lim.features &= ~BLK_FEAT_WRITE_CACHE;
> -	blk_mq_freeze_queue(disk->queue);
>  	i = queue_limits_commit_update(disk->queue, &lim);

You need to change this line to use queue_limits_commit_update_frozen().

Other than that, looks good !

-- 
Damien Le Moal
Western Digital Research

