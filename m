Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0762B903239
	for <lists+nbd@lfdr.de>; Tue, 11 Jun 2024 08:09:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DB5FE20675; Tue, 11 Jun 2024 06:09:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 11 06:09:32 2024
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EEEA12066A
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Jun 2024 05:53:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.511 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 45qL_wbDS0Dw for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Jun 2024 05:53:30 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_IP=-2 (check from: .kernel. - helo: .dfw.source.kernel. - helo-domain: .kernel.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id ADF8620662
	for <nbd@other.debian.org>; Tue, 11 Jun 2024 05:53:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5366D60C88;
	Tue, 11 Jun 2024 05:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DFA5C2BD10;
	Tue, 11 Jun 2024 05:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718085206;
	bh=RvinM2CEhnrYy7/V+Hc/2gNsHgLPMfOqlJof5s6pLpY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=acWTCLh69lElyFzhBDitf/FJSPcZHoSKSYkPin9SpKmAkY2E8tt2RX9YMgvNW08VJ
	 pXyQOUrKXLHipujeCeYwwOOV1ng3liGMUrh79LCxXQAnCnsegn/0fa+OxA8G7Re61L
	 fmOHhV3QGFVIYl1a9Zvr8YBZq5o5MC+kVjqKkUi4kq/pw8SNm9WHEEcZBI2M9gnJTB
	 rNM+9TLvbzpYIaLgbWYUi2Bsf66NXsvZZfHsd+k+aOkAbuju2GyIYlvuYfiZ5s0zaB
	 Ghir0etXCncHmfvSSJDhrNjKYgtJ1ghf+Dq41ngHLndOPehGRZnzQ4OTjdqTetZ0XF
	 qcw8t2IN/8aPA==
Message-ID: <ca5a3441-768a-4331-a1c2-a4bdadf2f150@kernel.org>
Date: Tue, 11 Jun 2024 14:53:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/26] loop: stop using loop_reconfigure_limits in
 __loop_clr_fd
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-4-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <i5vi3S-ZCuO.A.yH1J.co-ZmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2922
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ca5a3441-768a-4331-a1c2-a4bdadf2f150@kernel.org
Resent-Date: Tue, 11 Jun 2024 06:09:32 +0000 (UTC)

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> __loop_clr_fd wants to clear all settings on the device.  Prepare for
> moving more settings into the block limits by open coding
> loop_reconfigure_limits.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/loop.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index 93780f41646b75..93a49c40a31a71 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -1133,6 +1133,7 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
>  
>  static void __loop_clr_fd(struct loop_device *lo, bool release)
>  {
> +	struct queue_limits lim;
>  	struct file *filp;
>  	gfp_t gfp = lo->old_gfp_mask;
>  
> @@ -1156,7 +1157,14 @@ static void __loop_clr_fd(struct loop_device *lo, bool release)
>  	lo->lo_offset = 0;
>  	lo->lo_sizelimit = 0;
>  	memset(lo->lo_file_name, 0, LO_NAME_SIZE);
> -	loop_reconfigure_limits(lo, 512, false);
> +
> +	/* reset the block size to the default */
> +	lim = queue_limits_start_update(lo->lo_queue);
> +	lim.logical_block_size = 512;

Nit: SECTOR_SIZE ? maybe ?

> +	lim.physical_block_size = 512;
> +	lim.io_min = 512;
> +	queue_limits_commit_update(lo->lo_queue, &lim);
> +
>  	invalidate_disk(lo->lo_disk);
>  	loop_sysfs_exit(lo);
>  	/* let user-space know about this change */

Otherwise, looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

