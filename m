Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAE55F4F7F
	for <lists+nbd@lfdr.de>; Wed,  5 Oct 2022 07:36:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D8F82203B8; Wed,  5 Oct 2022 05:36:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct  5 05:36:13 2022
Old-Return-Path: <prvs=27087a391=damien.lemoal@opensource.wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,TO_TOO_MANY,TO_WAY_TOO_MANY
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3645720359
	for <lists-other-nbd@bendel.debian.org>; Wed,  5 Oct 2022 05:19:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.777 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-2.743, RCVD_IN_DNSWL_MED=-2.3,
	TO_TOO_MANY=1, TO_WAY_TOO_MANY=3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hTYp56VKUYqO for <lists-other-nbd@bendel.debian.org>;
	Wed,  5 Oct 2022 05:19:03 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 438 seconds by postgrey-1.36 at bendel; Wed, 05 Oct 2022 05:19:02 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hgst.iphmx.com", Issuer "Go Daddy Secure Certificate Authority - G2" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E898F20319
	for <nbd@other.debian.org>; Wed,  5 Oct 2022 05:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1664947142; x=1696483142;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=t4Ggk8JN7aJqaDrHkVXVhSu8+EOy8cvFecQ8rYNiwuM=;
  b=kGI5wnAn+4Z1zs33V6MK7f6LbcrRa1T53/GEbBmi4SEBLVOmoaX8vmn2
   GKAe5PcT0+rAD5PDB5NYilQepmzA2ik3XjNQh0kNwwfDaL9gvRlEL8raf
   KvbX24wXLtcpR+nfgx4VYx8ZH8wK8/7uRfu1/QiO3spD9TmYowhNpqZpK
   t4DkzpISYkPXEm1QZydLnXyAxJNS8X6mgeSHD9uiW3IWqDaUsEcHz90R9
   4qnBBEelh8+s/RD6Xz89Z7NGOZjox7YMeBKUYwC8zpRwDdWtmbu7Can6G
   gmQy2Xy7TYcVJH4T56MSsENcITCyzjQIAjcvfNFyykE3nlgF2mr+JTEpe
   w==;
X-IronPort-AV: E=Sophos;i="5.95,159,1661788800"; 
   d="scan'208";a="325118461"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 05 Oct 2022 13:11:28 +0800
IronPort-SDR: MVR6Sa4MZdvkPaiolYiR1Z1o+sKn3Mcp5pVgi2fD5I04pWXyfYROAw33ouZkR+zvNAj+1EKece
 XrajnzYwFMgYjl4f2gxBYUitz1SNr+yhYFIhSw5nKrH5If7a2TKAQJmALQxDFvk2CBVzH83MdQ
 p91aZ3MRmTRZ6I2Vqm6wQ0ZATn1gkIloilOBlqeE/0F4keNXlfWIuqR7UcWiHGgSpWP/6ZhBDl
 7hDPmEjjn00l2VxnMjMN+n0oGzZPDYYgeNaKoeEXzgSVa/FYLfvHEnPu8+j64+6w262WUpw9kY
 7HeyIoZfA5wWh0XlqzIsX6vA
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Oct 2022 21:31:16 -0700
IronPort-SDR: VIrbP8M/gtvogJpeAr0Zxhbmfb714564c2ydIJ3yYbWFZPbTr4u+xHPvbtd0gWn3If0tXVs94G
 wU4WRgZlXe+E4YGeELXDyf4GuYKqfkiIY7S9ZG1f6TpeOhqAhGVikErWAnXj99uz/KkIQhqZo4
 eu9/G7gqMsmk38rhxJAFuLucuDo+e1x2QgiEKoyPsk9FpK8Pt4/uRXztUBn/uzqqKMQTR/9cM5
 PHmBkWHlkxs3GJCTuT+mjDpjI04t79A0iQ8d99wkskw7fSaXYZDlZignrlf7hcJc88FacDpe45
 w4Q=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Oct 2022 22:11:29 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mj2jW3C65z1Rwt8
	for <nbd@other.debian.org>; Tue,  4 Oct 2022 22:11:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1664946685; x=1667538686; bh=t4Ggk8JN7aJqaDrHkVXVhSu8+EOy8cvFecQ
	8rYNiwuM=; b=tLHviaNBSZE88xLdQVOFiXAWb32/6ojwACuLRRnG8xU9QNHEWqD
	f50ptDx5qVWJYd6IRLeybuJOMi2M6t5KRZI3AxvWZksBtihDPujw8HBCFBVcUIpO
	ZfC3UqxRdafUnH0qS8IsrY5TqmTzapsn4pisieIRMNWD7VofvqnWQyDmT8TxJChB
	KhPs6ot/7bsSNTEjACMw8pxc5R4wP5XrPylMOZlJtJDzi6yEHX9iayUOd3W/Y9EM
	lajOzQCUf/ULm/9m5UmUAMRiYIxjEIGpDaIN3IIJblmsuApIMI/WI7OzPk1XLIjn
	5iKMLXkiVy+cs7ipqm1Z7lpyxgZvmyF7ogw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0g3IKUe71HsM for <nbd@other.debian.org>;
	Tue,  4 Oct 2022 22:11:25 -0700 (PDT)
Received: from [10.225.163.106] (unknown [10.225.163.106])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mj2jD37C6z1RvLy;
	Tue,  4 Oct 2022 22:11:12 -0700 (PDT)
Message-ID: <6fee2d7a-7fd1-73ee-2911-87a4ed3e8769@opensource.wdc.com>
Date: Wed, 5 Oct 2022 14:11:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 01/21] block: add and use init tagset helper
Content-Language: en-US
To: Chaitanya Kulkarni <kch@nvidia.com>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org
Cc: axboe@kernel.dk, efremov@linux.com, josef@toxicpanda.com,
 idryomov@gmail.com, dongsheng.yang@easystack.cn, haris.iqbal@ionos.com,
 jinpu.wang@ionos.com, mst@redhat.com, jasowang@redhat.com,
 pbonzini@redhat.com, stefanha@redhat.com, ohad@wizery.com,
 andersson@kernel.org, baolin.wang@linux.alibaba.com, ulf.hansson@linaro.org,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
 marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io,
 kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, sth@linux.ibm.com,
 hoeppner@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, hare@suse.de,
 bhelgaas@google.com, john.garry@huawei.com, mcgrof@kernel.org,
 christophe.jaillet@wanadoo.fr, vaibhavgupta40@gmail.com,
 wsa+renesas@sang-engineering.com, johannes.thumshirn@wdc.com,
 bvanassche@acm.org, ming.lei@redhat.com, shinichiro.kawasaki@wdc.com,
 vincent.fu@samsung.com, christoph.boehmwalder@linbit.com, joel@jms.id.au,
 vincent.whitchurch@axis.com, nbd@other.debian.org,
 ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 asahi@lists.linux.dev
References: <20221005032257.80681-1-kch@nvidia.com>
 <20221005032257.80681-2-kch@nvidia.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20221005032257.80681-2-kch@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <eMJxz9ed84E.A.LiE.NfRPjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2228
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6fee2d7a-7fd1-73ee-2911-87a4ed3e8769@opensource.wdc.com
Resent-Date: Wed,  5 Oct 2022 05:36:13 +0000 (UTC)

On 10/5/22 12:22, Chaitanya Kulkarni wrote:
> Add and use the helper to initialize the common fields of the tag_set
> such as blk_mq_ops, number of h/w queues, queue depth, command size,
> numa_node, timeout, BLK_MQ_F_XXX flags, driver data. This initialization
> is spread all over the block drivers. This avoids the code repetation of
> the inialization code of the tag set in current block drivers and any

s/inialization/initialization
s/repetation/repetition

> future ones.
> 
> Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
> ---
>  block/blk-mq.c                | 20 ++++++++++++++++++++
>  drivers/block/null_blk/main.c | 10 +++-------
>  include/linux/blk-mq.h        |  5 +++++
>  3 files changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index 8070b6c10e8d..e3a8dd81bbe2 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -4341,6 +4341,26 @@ static int blk_mq_alloc_tag_set_tags(struct blk_mq_tag_set *set,
>  	return blk_mq_realloc_tag_set_tags(set, 0, new_nr_hw_queues);
>  }
>  
> +void blk_mq_init_tag_set(struct blk_mq_tag_set *set,
> +		const struct blk_mq_ops *ops, unsigned int nr_hw_queues,
> +		unsigned int queue_depth, unsigned int cmd_size, int numa_node,
> +		unsigned int timeout, unsigned int flags, void *driver_data)

That is an awful lot of arguments... I would be tempted to say pack all
these into a struct but then that would kind of negate this patchset goal.
Using a function with that many arguments will be error prone, and hard to
review... Not a fan.

> +{
> +	if (!set)
> +		return;
> +
> +	set->ops = ops;
> +	set->nr_hw_queues = nr_hw_queues;
> +	set->queue_depth = queue_depth;
> +	set->cmd_size = cmd_size;
> +	set->numa_node = numa_node;
> +	set->timeout = timeout;
> +	set->flags = flags;
> +	set->driver_data = driver_data;
> +}
> +

No blank line here.

> +EXPORT_SYMBOL_GPL(blk_mq_init_tag_set);
> +
>  /*
>   * Alloc a tag set to be associated with one or more request queues.
>   * May fail with EINVAL for various error conditions. May adjust the
> diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
> index 1f154f92f4c2..0b07aab980c4 100644
> --- a/drivers/block/null_blk/main.c
> +++ b/drivers/block/null_blk/main.c
> @@ -1926,13 +1926,9 @@ static int null_init_tag_set(struct nullb *nullb, struct blk_mq_tag_set *set)
>  			flags |= BLK_MQ_F_BLOCKING;
>  	}
>  
> -	set->ops = &null_mq_ops;
> -	set->cmd_size	= sizeof(struct nullb_cmd);
> -	set->flags = flags;
> -	set->driver_data = nullb;
> -	set->nr_hw_queues = hw_queues;
> -	set->queue_depth = queue_depth;
> -	set->numa_node = numa_node;
> +	blk_mq_init_tag_set(set, &null_mq_ops, hw_queues, queue_depth,
> +			sizeof(struct nullb_cmd), numa_node, 0, flags, nullb);
> +
>  	if (poll_queues) {
>  		set->nr_hw_queues += poll_queues;
>  		set->nr_maps = 3;
> diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
> index ba18e9bdb799..06087a8e4398 100644
> --- a/include/linux/blk-mq.h
> +++ b/include/linux/blk-mq.h
> @@ -708,6 +708,11 @@ int blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
>  		struct request_queue *q);
>  void blk_mq_destroy_queue(struct request_queue *);
>  
> +

No need for the extra whiteline.

> +void blk_mq_init_tag_set(struct blk_mq_tag_set *set,
> +		const struct blk_mq_ops *ops, unsigned int nr_hw_queues,
> +		unsigned int queue_depth, unsigned int cmd_size, int numa_node,
> +		unsigned int timeout, unsigned int flags, void *driver_data);
>  int blk_mq_alloc_tag_set(struct blk_mq_tag_set *set);
>  int blk_mq_alloc_sq_tag_set(struct blk_mq_tag_set *set,
>  		const struct blk_mq_ops *ops, unsigned int queue_depth,

-- 
Damien Le Moal
Western Digital Research

