Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 53031504DBF
	for <lists+nbd@lfdr.de>; Mon, 18 Apr 2022 10:27:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8B90820472; Mon, 18 Apr 2022 08:27:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 18 08:27:09 2022
Old-Return-Path: <prvs=10001294c=damien.lemoal@opensource.wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A9D9C203B4
	for <lists-other-nbd@bendel.debian.org>; Mon, 18 Apr 2022 08:10:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.773 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.282, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QTL3LiH2Dl24 for <lists-other-nbd@bendel.debian.org>;
	Mon, 18 Apr 2022 08:10:13 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 440 seconds by postgrey-1.36 at bendel; Mon, 18 Apr 2022 08:10:12 UTC
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hgst.iphmx.com", Issuer "Go Daddy Secure Certificate Authority - G2" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 89A9A203A8
	for <nbd@other.debian.org>; Mon, 18 Apr 2022 08:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650269412; x=1681805412;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MERTNbn4AhK74X7Db7lDnICPdc+nuPVKeYAvKUf3y7M=;
  b=eteCfbxaR2chdqlg5Gu5FGZat5kVAlNb38Qx4xDSHQ20OJWRa8iT0iEF
   W/3uIQNGfM9CREhPuUFT/yMAqFYZuRYSmkLUsQeL/5eEv4noFXfQ102BS
   ZbTi4bHstbfZFuMWl1B4Yfm3pq109wkU91JvR2UFTE7YpYbwGd5ICNk3V
   UonXFoRVw5VsUSHK9nn+zluKRPX3ILHvS5YJREuerSYimpLjnd6l9yTpa
   yV63fkB+HEC4LH/OUP0dW+lfVXWsRhhbzGMm3k/2LvO06/SrzrF7AMURG
   Iz9SuiC6+UT/57TvzCkKOxOk6GGQRSTDiipms487DTIf1/1QuErXq2iC2
   A==;
X-IronPort-AV: E=Sophos;i="5.90,269,1643644800"; 
   d="scan'208";a="302341717"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 18 Apr 2022 16:02:47 +0800
IronPort-SDR: V+ITssWXQLd3c12OH8X7SbAnECipx+eNZQVPUKX/FLvZr4fhmnBiaNINZAcM6hP+5hte83+1xy
 T3pGhdpxYit4TGH+vED0ZuvYsPD+gwBwH/hFzkMlJ9rExq5vc3R/dZawXsAo6EU7+iuXTnVYRZ
 0VdFkELcYT0Lj4E4JxV065fcPH1XXR3o+/OAtPYj91hlQwAw750gnOU5TcnrZ8SUyD3Hleew5m
 lfRwUEBsZ+gYGr+8uKnoCr8sNUtAepqD/m8sRWx03oAiJ9Gp8gQSaF6a0CKl1z9Tvnr+buR9Vt
 1WPCM66qF/Rsiy76OjLXJZlK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2022 00:33:55 -0700
IronPort-SDR: couqVRHX7K02VY7V4CK/eS2ycFnKdLJNCh30oUx2CtpAP0FuQw1eQCI2sgOu6qVS7W3QgUlHLf
 szk8+LEkMRxx0rzzhH/d4H4IMyCvHXqirBqpmDDaxqRuP8HeYHYYvIcw6iYBQDP5oWG4DsLW6S
 KbYyDI+YzymQBcH8pj7jt270/Q7niAVWWwAsSsuR6g6zdvL12RYSOfJ7DEIQ6ssnCVxPp2uoXe
 7fj89stWZiT2uPm8fIIx7Fj+KC/9jspVRQfN17J6RWbOZ/Slr2R3jM3+wlEmzmccNplDaNlbSc
 Y5g=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2022 01:02:48 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KhfYg4BCxz1Rvlx
	for <nbd@other.debian.org>; Mon, 18 Apr 2022 01:02:47 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1650268966; x=1652860967; bh=MERTNbn4AhK74X7Db7lDnICPdc+nuPVKeYA
	vKUf3y7M=; b=maQuzRZ/p1t712qIY+IhTpqcG/pQm05duyWvErv19vVeNzSmghD
	V4UuT2NV8F1UHjPSFwamLFQzH0XOoOisHdD5+ADyIjpRhXJPPl5hYhdFZR4R3yn2
	vTW1rZBntXlrodM4xw/I5C7zh7jqW/1gkWMPa3JzW2mwGm1TfLpwL9s7bmvPqTHL
	AfCw9bTeUQ4nuJGbirW25tkuQc/GVk+wNgRm9VpyFwcn0iHRVCCSn/lEXHWhxPHO
	KFbkC86QG+PviD2uM16wutWPiPD0SXUHyCsj7Zbgqnz3gff3TOmOT2Wu5Xp0PjTz
	AO6u+oKpxJEkPaiLyjsLleOyU/qelBVlYrg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3aQ99fYeypGV for <nbd@other.debian.org>;
	Mon, 18 Apr 2022 01:02:46 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KhfYZ5jVFz1Rwrw;
	Mon, 18 Apr 2022 01:02:42 -0700 (PDT)
Message-ID: <1cef25df-b00d-4590-5598-555c5d97d1c1@opensource.wdc.com>
Date: Mon, 18 Apr 2022 17:02:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [dm-devel] [PATCH 10/11] rnbd-srv: use bdev_discard_alignment
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
 <20220418045314.360785-11-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220418045314.360785-11-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gvLFY-BfxFL.A.XBE.dDSXiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2034
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1cef25df-b00d-4590-5598-555c5d97d1c1@opensource.wdc.com
Resent-Date: Mon, 18 Apr 2022 08:27:09 +0000 (UTC)

On 4/18/22 13:53, Christoph Hellwig wrote:
> Use bdev_discard_alignment to calculate the correct discard alignment
> offset even for partitions instead of just looking at the queue limit.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/rnbd/rnbd-srv-dev.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/rnbd/rnbd-srv-dev.h b/drivers/block/rnbd/rnbd-srv-dev.h
> index d080a0de59225..4309e52524691 100644
> --- a/drivers/block/rnbd/rnbd-srv-dev.h
> +++ b/drivers/block/rnbd/rnbd-srv-dev.h
> @@ -59,7 +59,7 @@ static inline int rnbd_dev_get_discard_granularity(const struct rnbd_dev *dev)
>  
>  static inline int rnbd_dev_get_discard_alignment(const struct rnbd_dev *dev)
>  {
> -	return bdev_get_queue(dev->bdev)->limits.discard_alignment;
> +	return bdev_discard_alignment(dev->bdev);
>  }
>  
>  #endif /* RNBD_SRV_DEV_H */

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

