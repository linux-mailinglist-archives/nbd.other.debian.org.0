Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 215C9504DB7
	for <lists+nbd@lfdr.de>; Mon, 18 Apr 2022 10:24:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 05CF9204B2; Mon, 18 Apr 2022 08:24:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 18 08:24:12 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 0B1A4204CC
	for <lists-other-nbd@bendel.debian.org>; Mon, 18 Apr 2022 08:07:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.772 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.282, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Q0YJVZQ5aPhJ for <lists-other-nbd@bendel.debian.org>;
	Mon, 18 Apr 2022 08:06:55 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hgst.iphmx.com", Issuer "Go Daddy Secure Certificate Authority - G2" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id DEAAC204B2
	for <nbd@other.debian.org>; Mon, 18 Apr 2022 08:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650269215; x=1681805215;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rst7WZOXaJnTOprfWYkoaRENgax/3SjcG41/Nf0ZaiQ=;
  b=CS+LwxuXZdqQ5nlBy/ilO25Lme+1RM8f3PHPmvhUdW3fiRWzytWTDPeI
   5HKdvB9xYOY7RbT4UsfqEAsR5PCr6SeF8fYfPPAKZj6Xk2FceBxCTLYss
   OkK/1KYsUb2uVXeGNtUZJM+tiJr6Bk8bLGQ7HaGWiAgkkfkDkEd3cayul
   PJkk8mQWTROK6m64kiKDrYbX6se1VWT8sZ0nGZj/8NYUIhNVhDGsrKl8s
   yb2EbObHb7Z0PzV8ORh52yWaCYgVHHILLrMrg3H8hNx2WtZOxSoAfEH7o
   l8TOnoDgZz9eieRXRTQXnQ3S9UD34QYn0uWIVbBr2shVKFSSmgE9Rl2VL
   g==;
X-IronPort-AV: E=Sophos;i="5.90,269,1643644800"; 
   d="scan'208";a="199047833"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 18 Apr 2022 16:03:45 +0800
IronPort-SDR: nnKVt4iufgYnrSgI7IsSiXLlo6Lv0zem9GVYnpkJzDqf72w2NGfdw81X5Ogznm9COqzCMg8hhr
 bpE+hYebzuWCRZaRmpAOF+9hqncIgNjfZUNwdWwWCpUA3vGXizP2rR7/5wduaSB/53GSG/Vw66
 kLMVxMQcs7MRuJ8d00zUoUcw0QUqugLiEB+juUhQ/xO4TAI2bq2JIL/LMD2l1dlb5c+zMeNEF4
 rvWQ2T2suUva/1y5DRX8hmgmohoXBx7vJZ9rFR4ASSCiQ3MBCgazn0b5sm8fsPuMsy54Q1u+l0
 Tz3PNGpB+zxQzWwdkkdisMX1
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2022 00:34:51 -0700
IronPort-SDR: 5WUraomxVUJXideylNcnyYFV8kq95nURkM3H45KWIJJha+Q5pmIPd5SqkJPxz1gRZn1o/yuDIj
 4uLa/VAfxLpbXvl1EaAFSHLGc/EPk9n6dT7fsJ9yIKJQ0ptEvomBhhLRIxQKmnmlAXeRCH6FhG
 X2PMUxFYj1BgRMwpgYOOprpK5oka/aLge0nUDmSwHI2qx7suQPqR4jF6SIBBENoY8dUhHWqOH/
 qL0jY58zusiayLe6f6deNs1144aoSfdmu7mKJ+7xPlsVeEwRZ4Pc/5OPhiNhnXkBA0FyLTY9zK
 fvU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2022 01:03:45 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KhfZm2Dtlz1SHwl
	for <nbd@other.debian.org>; Mon, 18 Apr 2022 01:03:44 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1650269023; x=1652861024; bh=rst7WZOXaJnTOprfWYkoaRENgax/3SjcG41
	/Nf0ZaiQ=; b=YwIZvBG+Q6As3HMHZdqx3chNbvRrKNFPClgQ9l4SFijMhFWKZ8E
	YhLeA+aCumtaM4E8BSAw9tPoo+DFBjRdgzlDdYb1CVrznhaoDlJ5uLs4geuSL4/H
	TFurAULN2uVb/wBvNTrstEc0MtfZQQC0eAZB0U4q1eddErc1Eqd9jJiRpAIQbe+k
	Q6pWlnCRUg6h1llQU+3m8+z63aBnXWWbfre3psRJEGoWwAs955kZAevrPBkjOGNR
	HWtFV1/L0EzZNT5wA87k5Wfl0lxZ+bjousfqKAOSqGkvi12NRpaAXEsEXcJSsNpy
	VzvPiiCk/j6EtUs7OZ5fTKWjV1EJcsRrgNg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UvTlskQZaKIs for <nbd@other.debian.org>;
	Mon, 18 Apr 2022 01:03:43 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KhfZg2dWsz1Rvlx;
	Mon, 18 Apr 2022 01:03:39 -0700 (PDT)
Message-ID: <034efb57-9e1d-41ed-1855-e2b057b03ea7@opensource.wdc.com>
Date: Mon, 18 Apr 2022 17:03:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [dm-devel] [PATCH 11/11] xen-blkback: use bdev_discard_alignment
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
 <20220418045314.360785-12-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220418045314.360785-12-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <lhkqIojiIMK.A.KvD.sASXiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2031
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/034efb57-9e1d-41ed-1855-e2b057b03ea7@opensource.wdc.com
Resent-Date: Mon, 18 Apr 2022 08:24:13 +0000 (UTC)

On 4/18/22 13:53, Christoph Hellwig wrote:
> Use bdev_discard_alignment to calculate the correct discard alignment
> offset even for partitions instead of just looking at the queue limit.
> 
> Also switch to use bdev_discard_granularity to get rid of the last direct
> queue reference in xen_blkbk_discard.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/xen-blkback/xenbus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> index b21bffc9c50bc..04c90cb8955f6 100644
> --- a/drivers/block/xen-blkback/xenbus.c
> +++ b/drivers/block/xen-blkback/xenbus.c
> @@ -583,14 +583,14 @@ static void xen_blkbk_discard(struct xenbus_transaction xbt, struct backend_info
>  	if (bdev_max_discard_sectors(bdev)) {
>  		err = xenbus_printf(xbt, dev->nodename,
>  			"discard-granularity", "%u",
> -			q->limits.discard_granularity);
> +			bdev_discard_granularity(bdev));
>  		if (err) {
>  			dev_warn(&dev->dev, "writing discard-granularity (%d)", err);
>  			return;
>  		}
>  		err = xenbus_printf(xbt, dev->nodename,
>  			"discard-alignment", "%u",
> -			q->limits.discard_alignment);
> +			bdev_discard_alignment(bdev));
>  		if (err) {
>  			dev_warn(&dev->dev, "writing discard-alignment (%d)", err);
>  			return;

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

