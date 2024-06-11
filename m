Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9FD90324B
	for <lists+nbd@lfdr.de>; Tue, 11 Jun 2024 08:15:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 62A3E20684; Tue, 11 Jun 2024 06:15:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 11 06:15:10 2024
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 063FC2066B
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Jun 2024 05:59:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.411 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cYaQSQtZra6z for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Jun 2024 05:59:10 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6F01C20662
	for <nbd@other.debian.org>; Tue, 11 Jun 2024 05:59:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 591E8CE19AB;
	Tue, 11 Jun 2024 05:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39B0C2BD10;
	Tue, 11 Jun 2024 05:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718085543;
	bh=ytNiiCLVFE28gHr4h5G30TNqYehF/KogG4pSKSbNQ2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=juelLKuku0LFbgtXG9OzRzRWb3ooPaRYkdEGYbxCY/l/EREHcpsd6y+kWaUp4iBKj
	 Cs53RLnIaSbrZccm/GN9QVCVAOcAI/+By8TM/0/LFmq4RPTUmj+axscKmxzzB5coCx
	 TPpMXPmrdbBJt790n7mZ2SG7cnazZrwM4LN+e2wDErlp27GY0Q5cW5+prp1xuTs+nr
	 t3wCoIWjpcxWO+rGzFp9IqhsxvwTy7jx2vG3FMgsOx4qNL4tLOJuL4SBWR9Le8e1Gu
	 FbIAW9jk7NKo8gZzoXSm3zjx5aS60f2RIO1ZIKWZDZVw79ebRnV6Cm+DP9ptNCmDsn
	 briDJeVws9DJA==
Message-ID: <27e76310-1831-473e-803a-e0294b91463c@kernel.org>
Date: Tue, 11 Jun 2024 14:58:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/26] loop: also use the default block size from an
 underlying block device
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
 <20240611051929.513387-7-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-7-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <awvfDA0FjVO.A.AL3J.ut-ZmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2927
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/27e76310-1831-473e-803a-e0294b91463c@kernel.org
Resent-Date: Tue, 11 Jun 2024 06:15:10 +0000 (UTC)

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Fix the code in loop_reconfigure_limits to pick a default block size for
> O_DIRECT file descriptors to also work when the loop device sits on top
> of a block device and not just on a regular file on a block device based
> file system.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/loop.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index 4f6d8514d19bd6..d7cf6bbbfb1b86 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -988,10 +988,16 @@ static int loop_reconfigure_limits(struct loop_device *lo, unsigned short bsize)
>  {
>  	struct file *file = lo->lo_backing_file;
>  	struct inode *inode = file->f_mapping->host;
> +	struct block_device *backing_bdev = NULL;
>  	struct queue_limits lim;
>  
> +	if (S_ISBLK(inode->i_mode))
> +		backing_bdev = I_BDEV(inode);
> +	else if (inode->i_sb->s_bdev)
> +		backing_bdev = inode->i_sb->s_bdev;
> +

Why not move this hunk inside the below "if" ? (backing_dev declaration can go
there too).

>  	if (!bsize)
> -		bsize = loop_default_blocksize(lo, inode->i_sb->s_bdev);
> +		bsize = loop_default_blocksize(lo, backing_bdev);
>  
>  	lim = queue_limits_start_update(lo->lo_queue);
>  	lim.logical_block_size = bsize;

-- 
Damien Le Moal
Western Digital Research

