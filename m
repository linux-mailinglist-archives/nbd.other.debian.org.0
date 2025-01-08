Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEF0A0583D
	for <lists+nbd@lfdr.de>; Wed,  8 Jan 2025 11:36:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BFCA720733; Wed,  8 Jan 2025 10:36:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan  8 10:36:20 2025
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3B50F206F6
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Jan 2025 10:19:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.74 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4tdtvxKXs3oa for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Jan 2025 10:19:08 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5E004206DA
	for <nbd@other.debian.org>; Wed,  8 Jan 2025 10:19:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D0B9DA4073C;
	Wed,  8 Jan 2025 10:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E0BC4CEE0;
	Wed,  8 Jan 2025 10:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736331545;
	bh=dkqDR05KFDLNT/Pbc9CxeI0diORr/6V3vHanHq4U2l4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jvKNWS4v+PqOHtv4hV9noqVZ9/EmiKq07PFogOqviiUsQV//u5k/Sfp1w4KVlDYn2
	 nPl0o40WeNGO4W7f/P/e2xwrjsjb0pi4uU7m0e0UIQnMfK7pO4DECHLNAWPUPrggSj
	 T6+yr73UvUnY7WRPKDLRQwZ7ywYY3P9WMLg0x8AbmaalOvI4CnN6A9Q5MdRkna60aD
	 MaGJmA2wpqp2JVuohGbuO0JyCjsW2mMamZBs0F+DCw9z/eVaZWS2Flt9Qmmj7EzrC4
	 nZM2id5Dw8bEXYZzVPZJSAJ7+dI45N5gfaGVD0aTptnE1yB/eDbOAoeDzZhaFHoWZZ
	 +7qGNPY18A5UA==
Message-ID: <878a32c6-fbee-400f-891d-09db146db572@kernel.org>
Date: Wed, 8 Jan 2025 19:18:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] block: fix queue freeze vs limits lock order in
 sysfs store methods
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Nilay Shroff <nilay@linux.ibm.com>,
 linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
 nbd@other.debian.org, linux-scsi@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net
References: <20250108092520.1325324-1-hch@lst.de>
 <20250108092520.1325324-6-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250108092520.1325324-6-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3ZDlGoKQeJ.A.iCqO.kUlfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3282
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/878a32c6-fbee-400f-891d-09db146db572@kernel.org
Resent-Date: Wed,  8 Jan 2025 10:36:20 +0000 (UTC)

On 1/8/25 6:25 PM, Christoph Hellwig wrote:
> queue_attr_store() always freezes a device queue before calling the
> attribute store operation. For attributes that control queue limits, the
> store operation will also lock the queue limits with a call to
> queue_limits_start_update(). However, some drivers (e.g. SCSI sd) may
> need to issue commands to a device to obtain limit values from the
> hardware with the queue limits locked. This creates a potential ABBA
> deadlock situation if a user attempts to modify a limit (thus freezing
> the device queue) while the device driver starts a revalidation of the
> device queue limits.
> 
> Avoid such deadlock by not freezing the queue before calling the
> ->store_limit() method in struct queue_sysfs_entry and instead use the
> queue_limits_commit_update_frozen helper to freeze the queue after taking
> the limits lock.
> 
> (commit log adapted from a similar patch from  Damien Le Moal)
> 
> Fixes: ff956a3be95b ("block: use queue_limits_commit_update in queue_discard_max_store")
> Fixes: 0327ca9d53bf ("block: use queue_limits_commit_update in queue_max_sectors_store")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

