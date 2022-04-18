Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 494C3504DB1
	for <lists+nbd@lfdr.de>; Mon, 18 Apr 2022 10:21:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0FD89204A4; Mon, 18 Apr 2022 08:21:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 18 08:21:11 2022
Old-Return-Path: <prvs=10001294c=damien.lemoal@opensource.wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0FD30204CC
	for <lists-other-nbd@bendel.debian.org>; Mon, 18 Apr 2022 08:04:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.772 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.282, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id euVjjPo5vbWC for <lists-other-nbd@bendel.debian.org>;
	Mon, 18 Apr 2022 08:04:22 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hgst.iphmx.com", Issuer "Go Daddy Secure Certificate Authority - G2" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4858E204A4
	for <nbd@other.debian.org>; Mon, 18 Apr 2022 08:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650269062; x=1681805062;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rpofyDUALxK7dXMfprZ48DmzWqCt1/MYuoJj74ZUCIU=;
  b=Sm4ILGI740qEnKR0/rFY2XB5H15CeEmMVGyRy0vWIe7F6Tm8xcUa/bL/
   l55E3LGwjEd0jWSioX2hNPQAqFucO2tPZUQEUkLQfj5pfJaprxuZ2OCPw
   2cf63bYL/fFZ/EcXD2sWIDjsxs1+UWZhGqGWuqoSgx7P5pGuAcvhSJOeo
   RrmbdM+FFcC3BcgtKoNTL46miAbLoSoczIdistqs4hZG29ogn27Eyz91Z
   K38uNIm8hpYjiW/2y8cR7xZg1pz7nyzqQDaltm5d6KmYz2hai049YQoya
   M6VflcdYcoVp7DhhUFvlLdAtr/UMy9lhnI8U27ec0D9rO+04KoAoqpOge
   w==;
X-IronPort-AV: E=Sophos;i="5.90,269,1643644800"; 
   d="scan'208";a="198150375"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 18 Apr 2022 16:04:17 +0800
IronPort-SDR: 7kdDQTCtopVqv5TC/ph46tYsb1rAdT/JfGFi9ApJufPOIrkRl/lEc4LkylVystPJkpcAUD7ANI
 2vGAqNBzkhuEACq3IRTVWKPQREdw1rA43wuTu7WP+fjoDCGNFXce16zQGHR4sK7rFiAh+NaVns
 a/bM+eFQxHOF3M8KpTvga2TKqvn8n1JZSp+b8qxH1NwFqcz12uvkC/UiqYjtvcBnaBj4aJBa4s
 TUrvfNJuoItPd+3fnoxq49A2gCxkVmNKs8IAAZ0oDOSJqvrwcEm47Xbs0zibcrlZV51q1lyg1A
 FsOBjPW6KRx1HwBHdmDUK49/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2022 00:35:24 -0700
IronPort-SDR: csgIsMyTOZ2yKsMRslB6bNL89e1MvoSrRRQAItATSUh+2ILSH9+xnJE3fjQwCypFtuT2+3GKGk
 6veZpZdgo2FyYUF1OSZF0bdHSH8OnAJ/Dac4+2tGdHIZwINHGfUOrJAlx+Q238tT2ylyDN5pbk
 d1usXgJeY8zZA28fTBUaEgX+7MmkViKNcmOvD8SQqVDQWd59rcZDvwkSB0MiXOQIm3RXuM3X+e
 V8AjSY8j/bSz9FaIOI82002zsFQLTRMafctHIY2JEvDBH0TPKe3O0V6p1t8BbSZhKOlM65y703
 MZE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2022 01:04:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KhfbP6GgSz1Rvlx
	for <nbd@other.debian.org>; Mon, 18 Apr 2022 01:04:17 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1650269057; x=1652861058; bh=rpofyDUALxK7dXMfprZ48DmzWqCt1/MYuoJ
	j74ZUCIU=; b=HJZNzwH+Ya8Lh7fQ8EMITGW2E5Om7BfPbFoRhLpWnW1FNcZ8M97
	TK23SdL3V92f6aNBG2vIYI0gDssBn/mhxBwSaBmQ/xfiGX6JpTqdbyplEcM3/QPd
	YyR04YET0AyNeqqGu/qYp7lW/huq0m6CT68sYmcr630FWrzGkdmCtJbqrWNypH2Y
	TJVuIpVo+OZCpO89xGW7fGtNGyFZvGt5M0KC+IJs3BaNbOroa0IUVJXir/qiQd5B
	lqD1wpmPTbVXvHTfgzngWAccyjf/xfEF71aKD++ki43Kx1QfUXAHkCRRPeo2dA+i
	R2SGy4d83q83vsdCn6C41e1TqK2ajxRurdQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DUWBE-qhpbM6 for <nbd@other.debian.org>;
	Mon, 18 Apr 2022 01:04:17 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KhfbJ6g7Wz1Rwrw;
	Mon, 18 Apr 2022 01:04:12 -0700 (PDT)
Message-ID: <18032025-f1aa-2daa-d012-8996590ada6a@opensource.wdc.com>
Date: Mon, 18 Apr 2022 17:04:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [dm-devel] [PATCH 08/11] loop: remove a spurious clear of
 discard_alignment
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Jan Hoeppner <hoeppner@linux.ibm.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 linux-nvme@lists.infradead.org, virtualization@lists.linux-foundation.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>,
 linux-s390@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 xen-devel@lists.xenproject.org, linux-um@lists.infradead.org,
 Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 nbd@other.debian.org, linux-block@vger.kernel.org,
 Stefan Haberland <sth@linux.ibm.com>, linux-raid@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220418045314.360785-1-hch@lst.de>
 <20220418045314.360785-9-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220418045314.360785-9-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-CzbHWmGO0M.A.hr.39RXiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2029
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/18032025-f1aa-2daa-d012-8996590ada6a@opensource.wdc.com
Resent-Date: Mon, 18 Apr 2022 08:21:12 +0000 (UTC)

On 4/18/22 13:53, Christoph Hellwig wrote:
> The loop driver never sets a discard_alignment, so it also doens't need
> to clear it to zero.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/loop.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index 976cf987b3920..61b642b966a08 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -789,7 +789,6 @@ static void loop_config_discard(struct loop_device *lo)
>  		blk_queue_max_discard_sectors(q, 0);
>  		blk_queue_max_write_zeroes_sectors(q, 0);
>  	}
> -	q->limits.discard_alignment = 0;
>  }
>  
>  struct loop_worker {

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

