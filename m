Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 958965023F0
	for <lists+nbd@lfdr.de>; Fri, 15 Apr 2022 07:33:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7CDF020348; Fri, 15 Apr 2022 05:33:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Apr 15 05:33:22 2022
Old-Return-Path: <prvs=0972008b0=damien.lemoal@opensource.wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3CD312037A
	for <lists-other-nbd@bendel.debian.org>; Fri, 15 Apr 2022 05:17:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.772 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.282, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 5BAb04U0VpPh for <lists-other-nbd@bendel.debian.org>;
	Fri, 15 Apr 2022 05:17:08 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hgst.iphmx.com", Issuer "Go Daddy Secure Certificate Authority - G2" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 564A8202E4
	for <nbd@other.debian.org>; Fri, 15 Apr 2022 05:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649999828; x=1681535828;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wC6/PVYH+J9es8aT7sK5ZaGwsGnDQHOFu7y4PW6r0NI=;
  b=GD9a56MKvgAkhWWNv/SidMlhBT47rNMcvfB7nE/N8rpbGQTJLzSSo7IN
   vbxtgBvshbrg4vNHUj4p5TVYksp3P375bOawUJjpxYRK5gNedho67GQDQ
   qHYjjk1gfOK+UJTYsxxhJ9P2eypmIN//R6qOF4xjDodEdWOyI7IT2eqkv
   /LHcQbKKhM1JaYiz4TsVdmL9xMQR8j0AKW8ygOP/GoSHYwjwDUCqZi8X+
   nNBl+rct3aohnnDrSDY3qYuLCi4tkEvxyQAWU7Q42j4Q5nnnjBKrJ1UYk
   /1wdIVSo8Giy/gkWbDS08gzUbt15BPk0FOZQ7X1IEpz1XtjKg7Bzbnt2x
   w==;
X-IronPort-AV: E=Sophos;i="5.90,261,1643644800"; 
   d="scan'208";a="309936284"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2022 13:09:49 +0800
IronPort-SDR: GVVBhl4YT7GCRQ83RA5L0wWpcIDkVycDUjHXNm5wHaax3umcA1o5RkKLV0WsHvq+IBLRL4Hk9F
 je5O5uwSwGmyxHZsjsb8mUIsVMeWrWRGk9T5qOcmuyf3LhaQVmMVXtFT/F9yjClvLXu8cspik1
 I+6cmq+RNWgtQmIaO9IEz8TdNZT09aqxubF5FHH7txd7ZomYl8LxZXUf0F1Pl4vi23m/eykrL3
 5RwEObn3RTk7rhfjOQGMCigf4Dt3MMu3IqArx/dPLo9ykIEXCqYCXFJaEed3dK/RVhqldkX9eZ
 rsCIGB0votlEDa+uP8Xwb5W5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Apr 2022 21:40:14 -0700
IronPort-SDR: nIZcdwBb4GWYEPquwM87Oj+0uBBuW1oVgebUZkTlmQc0AgyexOmfEMonedfP1qKF2eECfU0Bef
 FWgeUSWeN5qFijskXguVVwhkVyUv6dghjTw9L09PebFDeQMBleUfehtAHVynNUwZ6wUpf+FGst
 NNEZ6V+XxikQpUbleFHgTkwKzBPdJAqIPS6pBUw12tb6OdtvG/em2iZDyjm0kRxFia70G2vgxa
 zKDUWm8dNiCXZ8BbnHVj/ejd94KQBTiYCaXxKig1F2XTUi4CbTtkpm4WCHRSraiFkk+uaKY7o3
 bLI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Apr 2022 22:09:50 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KfksT0fkWz1Rwrw
	for <nbd@other.debian.org>; Thu, 14 Apr 2022 22:09:49 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1649999388; x=1652591389; bh=wC6/PVYH+J9es8aT7sK5ZaGwsGnDQHOFu7y
	4PW6r0NI=; b=D8kdC3rz3pjqnugRL+G3XHXL6Ng78iZSZCza4fEMQpTN/xdgY6D
	ndgbPRv8Ii6RTniwYP01qFwFHzH91r1LoAWx6xGwWEN+Qsp3Ex2YpjoRKlcblFjc
	7yjQF4oBeK9egOucgCIrr2m+tKTIlJA0mcKIvKIgWCVnz5iEJtEs0vxeju2wZT96
	jtBkpdSzig+EY3uiGMCOqAfDYf4ob5UMdfn63Y/7o6floZGBngeQCZ8K+n+vY3d5
	lYsSP/0Lz/G5amM7P4+yygELabSZDZHGZG/YfdQpCLMrO4FBxFoQbF9pdD3HvN17
	o1OWdE4/X82Vq8Fyie48I/oIcM5G/NLyIZA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5wAHMlfW2OOI for <nbd@other.debian.org>;
	Thu, 14 Apr 2022 22:09:48 -0700 (PDT)
Received: from [10.225.163.9] (unknown [10.225.163.9])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KfksM3c9Fz1Rvlx;
	Thu, 14 Apr 2022 22:09:43 -0700 (PDT)
Message-ID: <62ebc311-e5ef-cea5-5236-0c83d1a3eb64@opensource.wdc.com>
Date: Fri, 15 Apr 2022 14:09:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 10/27] mm: use bdev_is_zoned in claim_swapfile
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
References: <20220415045258.199825-1-hch@lst.de>
 <20220415045258.199825-11-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220415045258.199825-11-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4o0_Gj-ZSnC.A.GSF.iOQWiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2000
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/62ebc311-e5ef-cea5-5236-0c83d1a3eb64@opensource.wdc.com
Resent-Date: Fri, 15 Apr 2022 05:33:22 +0000 (UTC)

On 4/15/22 13:52, Christoph Hellwig wrote:
> Use the bdev based helper instead of poking into the queue.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/swapfile.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 63c61f8b26118..4c7537162af5e 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -2761,7 +2761,7 @@ static int claim_swapfile(struct swap_info_struct *p, struct inode *inode)
>  		 * write only restriction.  Hence zoned block devices are not
>  		 * suitable for swapping.  Disallow them here.
>  		 */
> -		if (blk_queue_is_zoned(p->bdev->bd_disk->queue))
> +		if (bdev_is_zoned(p->bdev))
>  			return -EINVAL;
>  		p->flags |= SWP_BLKDEV;
>  	} else if (S_ISREG(inode->i_mode)) {

Looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

