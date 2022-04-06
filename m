Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0DC4F58D7
	for <lists+nbd@lfdr.de>; Wed,  6 Apr 2022 11:18:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E4A4E205DC; Wed,  6 Apr 2022 09:18:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Apr  6 09:18:10 2022
Old-Return-Path: <prvs=0880ca2a2=damien.lemoal@opensource.wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3557B205B4
	for <lists-other-nbd@bendel.debian.org>; Wed,  6 Apr 2022 09:00:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.491 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id GLQ_c98YMjbP for <lists-other-nbd@bendel.debian.org>;
	Wed,  6 Apr 2022 09:00:05 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 438 seconds by postgrey-1.36 at bendel; Wed, 06 Apr 2022 09:00:05 UTC
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hgst.iphmx.com", Issuer "Go Daddy Secure Certificate Authority - G2" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4D5C8205B3
	for <nbd@other.debian.org>; Wed,  6 Apr 2022 09:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649235605; x=1680771605;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LFM3dJ4XtmmQmpjm/ADKwYliPf/iPacGMSt9/3x5IFU=;
  b=bQoQ7QB4pmX1zkL20IplWXV5Y0iw+nGZsgBxtf87yN0LtTl+FZ6VOczf
   KS+z4cWeV/x2jxrgxEKhMbhxtJyv2JbDtpzy2o+fgCl1C8I4GuFUTOE1O
   SlgF8nLEVSk14LIBFC3Vzl7fcIdKusIFm5YMwvQERazyF0dnrisqeEa17
   3hlEk4RcRrKd7040oI0XCGCgrzBQPXYKdS8rv1JkMFMpHoaAvtxmXotG1
   QTykap2KA4WSbcTMqGZRFC1dLaJVOuWQAhRVnfSG9pW1gRHrVH3I5z9RT
   coIt9M/YWCIR7QIjYg2s+OnCnSlHP+YNhRz+m+GOcwfckdEA4GNR9iqRh
   A==;
X-IronPort-AV: E=Sophos;i="5.90,239,1643644800"; 
   d="scan'208";a="202066082"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 06 Apr 2022 16:52:41 +0800
IronPort-SDR: o4VrL/8POlzBp9aS9CNONCnHC60Ci7qCs82WHU999XaqTDfYGKcspUDUd1ZVK20Wf7L00NlE90
 LD8vPT3O/lDMudqK3sbPHkmrq/flkxRsT9ZSlIp28mTG3BI4avP5++CBh6FYyY+WibyWs8KkGz
 bvi8ourC35iuFgHcaKx6bD2fpOeuEdsIwC7mfSOYws4R17nSlni1LpMwVF9I8p3o5b/1mxXysI
 MpHo4eqVeJx4AXs8aNqelgn2Vx1ng+sjiYSOA+AgK/oFxg1eNit9BiMkDFjF31D8UKDVrs9ezS
 PN5OwnhJjKTXvztSLFxJN5gx
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Apr 2022 01:23:24 -0700
IronPort-SDR: Ko9lmA9AmvQK0HSGke4zE5Bcpn+LRMp3DqqEDEt9AzSJBIgzwG3t8/f+Nmppqcl+pBZH22FEkh
 HDMeoqZDAWu0RO/Cw34p5vs5YQ752s+YS0pmQZb5fra+Z9EuT3ov1g9jltXsDS/73G5WkYk16E
 vvx1BZCjiNTJKrIYMPOTQvRNChNap02C5Q/lZn8wC5qfoFLWa6x6UD/BefEXHlB+JU+VnwOsoj
 ivZ4k9IRlCkRauQv6fs168sy2KgF7GAS6T4KpC+kAaGc5G7wbvjHk2kGYIR4IjbmeJud3BiHAo
 vvI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Apr 2022 01:52:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KYJDp1GfHz1SVnx
	for <nbd@other.debian.org>; Wed,  6 Apr 2022 01:52:42 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1649235161; x=1651827162; bh=LFM3dJ4XtmmQmpjm/ADKwYliPf/iPacGMSt
	9/3x5IFU=; b=qvkCgjbtXOykeK3hzZNeB4nFZLJBLeVyzVQiFxPBd+c54HMRQrR
	r3mHxfVWNdkNw5DIJA4fgfkXPh93epK0mDoQ3kgu2fpFkbSa8brjeKFgTDNdjUXK
	QEdaChXXlXS0VTxT7h9gL19ju3gtHs6R6Mypq0Cc5OI+h1pEURz6XYf1UQ1mcqds
	uMy2QNMB1cQhY28LO46skbuCxOrF4i88P2mQlM7t3vtuiUBfVFmxO2ZMvku2/0fT
	GRED3B4iBwE6imVQ9DU7YD88eHs1K7YN6+E1hQRftlmDiNgCGpghEuxtQnop4vN/
	eOwwsoVyhIxEYaxD0ZFdcLlRFvL5b8ALceg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ZsPMmNI0XTUm for <nbd@other.debian.org>;
	Wed,  6 Apr 2022 01:52:41 -0700 (PDT)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KYJDg4WyPz1Rvlx;
	Wed,  6 Apr 2022 01:52:35 -0700 (PDT)
Message-ID: <ea3d14cb-00ea-8d7b-4615-9347fdd7aa27@opensource.wdc.com>
Date: Wed, 6 Apr 2022 17:52:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 14/27] block: add a bdev_max_zone_append_sectors helper
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: dm-devel@redhat.com, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
 ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, linux-mm@kvack.org
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-15-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220406060516.409838-15-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <fPERJrdOZeF.A.q1C.SrVTiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1881
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ea3d14cb-00ea-8d7b-4615-9347fdd7aa27@opensource.wdc.com
Resent-Date: Wed,  6 Apr 2022 09:18:10 +0000 (UTC)

On 4/6/22 15:05, Christoph Hellwig wrote:
> Add a helper to check the max supported sectors for zone append based on
> the block_device instead of having to poke into the block layer internal
> request_queue.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/nvme/target/zns.c | 3 +--
>   fs/zonefs/super.c         | 3 +--
>   include/linux/blkdev.h    | 6 ++++++
>   3 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/nvme/target/zns.c b/drivers/nvme/target/zns.c
> index e34718b095504..82b61acf7a72b 100644
> --- a/drivers/nvme/target/zns.c
> +++ b/drivers/nvme/target/zns.c
> @@ -34,8 +34,7 @@ static int validate_conv_zones_cb(struct blk_zone *z,
>   
>   bool nvmet_bdev_zns_enable(struct nvmet_ns *ns)
>   {
> -	struct request_queue *q = ns->bdev->bd_disk->queue;
> -	u8 zasl = nvmet_zasl(queue_max_zone_append_sectors(q));
> +	u8 zasl = nvmet_zasl(bdev_max_zone_append_sectors(ns->bdev));
>   	struct gendisk *bd_disk = ns->bdev->bd_disk;
>   	int ret;
>   
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index 3614c7834007d..7a63807b736c4 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -678,13 +678,12 @@ static ssize_t zonefs_file_dio_append(struct kiocb *iocb, struct iov_iter *from)
>   	struct inode *inode = file_inode(iocb->ki_filp);
>   	struct zonefs_inode_info *zi = ZONEFS_I(inode);
>   	struct block_device *bdev = inode->i_sb->s_bdev;
> -	unsigned int max;
> +	unsigned int max = bdev_max_zone_append_sectors(bdev);
>   	struct bio *bio;
>   	ssize_t size;
>   	int nr_pages;
>   	ssize_t ret;
>   
> -	max = queue_max_zone_append_sectors(bdev_get_queue(bdev));
>   	max = ALIGN_DOWN(max << SECTOR_SHIFT, inode->i_sb->s_blocksize);
>   	iov_iter_truncate(from, max);
>   
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index a433798c3343e..f8c50b77543eb 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -1188,6 +1188,12 @@ static inline unsigned int queue_max_zone_append_sectors(const struct request_qu
>   	return min(l->max_zone_append_sectors, l->max_sectors);
>   }
>   
> +static inline unsigned int
> +bdev_max_zone_append_sectors(struct block_device *bdev)
> +{
> +	return queue_max_zone_append_sectors(bdev_get_queue(bdev));
> +}
> +
>   static inline unsigned queue_logical_block_size(const struct request_queue *q)
>   {
>   	int retval = 512;

Looks good.

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

