Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id EF682859443
	for <lists+nbd@lfdr.de>; Sun, 18 Feb 2024 04:06:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 65EB82067C; Sun, 18 Feb 2024 03:06:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Feb 18 03:06:09 2024
Old-Return-Path: <chengzhihao1@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=4.0 tests=CC_TOO_MANY,FOURLA,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BF94020583
	for <lists-other-nbd@bendel.debian.org>; Sun, 18 Feb 2024 02:50:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.934 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, FOURLA=0.1,
	MIME_CHARSET_FARAWAY=0.02, NICE_REPLY_A=-0.746,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id p3TxJhpDjc9K for <lists-other-nbd@bendel.debian.org>;
	Sun, 18 Feb 2024 02:50:01 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 974 seconds by postgrey-1.36 at bendel; Sun, 18 Feb 2024 02:50:01 UTC
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7C6E020581
	for <nbd@other.debian.org>; Sun, 18 Feb 2024 02:50:01 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TcqSj2TRzz1xmkD;
	Sun, 18 Feb 2024 10:32:21 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 546CF1400CC;
	Sun, 18 Feb 2024 10:33:40 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 18 Feb 2024 10:33:38 +0800
Subject: Re: [PATCH 14/17] ubiblock: pass queue_limits to blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
CC: Richard Weinberger <richard@nod.at>, Anton Ivanov
	<anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>,
	Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>, Josef
 Bacik <josef@toxicpanda.com>, Geoff Levand <geoff@infradead.org>, Ilya
 Dryomov <idryomov@gmail.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack
 Wang <jinpu.wang@ionos.com>, Ming Lei <ming.lei@redhat.com>, Maxim Levitsky
	<maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
	<linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<ceph-devel@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-s390@vger.kernel.org>
References: <20240215070300.2200308-1-hch@lst.de>
 <20240215070300.2200308-15-hch@lst.de>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <6b559ea2-944e-c5f6-f7ce-1119c5369a48@huawei.com>
Date: Sun, 18 Feb 2024 10:33:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240215070300.2200308-15-hch@lst.de>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SL5-wtxLbeD.A.JMG.hQX0lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2749
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6b559ea2-944e-c5f6-f7ce-1119c5369a48@huawei.com
Resent-Date: Sun, 18 Feb 2024 03:06:09 +0000 (UTC)

ÔÚ 2024/2/15 15:02, Christoph Hellwig Ð´µÀ:
> Pass the few limits ubiblock imposes directly to blk_mq_alloc_disk
> instead of setting them one at a time.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/mtd/ubi/block.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> 
> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> index 9be87c231a2eba..5c8fdcc088a0df 100644
> --- a/drivers/mtd/ubi/block.c
> +++ b/drivers/mtd/ubi/block.c
> @@ -348,6 +348,9 @@ static int calc_disk_capacity(struct ubi_volume_info *vi, u64 *disk_capacity)
>   
>   int ubiblock_create(struct ubi_volume_info *vi)
>   {
> +	struct queue_limits lim = {
> +		.max_segments		= UBI_MAX_SG_COUNT,
> +	};
>   	struct ubiblock *dev;
>   	struct gendisk *gd;
>   	u64 disk_capacity;
> @@ -393,7 +396,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
>   
>   
>   	/* Initialize the gendisk of this ubiblock device */
> -	gd = blk_mq_alloc_disk(&dev->tag_set, NULL, dev);
> +	gd = blk_mq_alloc_disk(&dev->tag_set, &lim, dev);
>   	if (IS_ERR(gd)) {
>   		ret = PTR_ERR(gd);
>   		goto out_free_tags;
> @@ -416,7 +419,6 @@ int ubiblock_create(struct ubi_volume_info *vi)
>   	dev->gd = gd;
>   
>   	dev->rq = gd->queue;
> -	blk_queue_max_segments(dev->rq, UBI_MAX_SG_COUNT);
>   
>   	list_add_tail(&dev->list, &ubiblock_devices);
>   
> 

