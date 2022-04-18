Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF23504DB2
	for <lists+nbd@lfdr.de>; Mon, 18 Apr 2022 10:21:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 584F4204A4; Mon, 18 Apr 2022 08:21:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 18 08:21:23 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 9B793204B2
	for <lists-other-nbd@bendel.debian.org>; Mon, 18 Apr 2022 08:05:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.772 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.282, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xGSky8Mmlhrd for <lists-other-nbd@bendel.debian.org>;
	Mon, 18 Apr 2022 08:05:31 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 302 seconds by postgrey-1.36 at bendel; Mon, 18 Apr 2022 08:05:30 UTC
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hgst.iphmx.com", Issuer "Go Daddy Secure Certificate Authority - G2" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id DCF68204A4
	for <nbd@other.debian.org>; Mon, 18 Apr 2022 08:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650269132; x=1681805132;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OmPuKz2YWA8zfnI8UisdXu/UB5gIbMI/eeJtu4mrOgE=;
  b=R7Lml7sa8wiNk31AlZddSCmaW5eAYZ29fM8U/0b0eG4OOdiFH/vsbwkZ
   hpnuPrrvFzY1ucTv9sKSJnNir8AbYO6JST0b+R+4ioz7mlYb37F1epIir
   oCZf8H/NfoI7Q4/1x4MF+HIV+2p4T+RV0lydfN2UG9Su8foOuy+EaFPKT
   HHRspblPJQbXpoQP75mgJFbbSI8XN9VB3+JVxscBL24VH9KEqNyArH8ML
   cUVj7kkzC695X2ouPn9bkXSqE8pBiox3bGEweze7kACeCFzcBxgCjIW7Z
   hVNhvGLWFjo02VNj3dEaySmpJ32PUsgSTVjfIMDPohzuO+3ui2Wic4GXH
   g==;
X-IronPort-AV: E=Sophos;i="5.90,269,1643644800"; 
   d="scan'208";a="199047695"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 18 Apr 2022 16:02:20 +0800
IronPort-SDR: CpRLvTp1UNPwTimWxHbiTxzmuCeM0/syGcA5Iic7VrKEHV7cI2dcxleg7/PIOHqsolqgYO2EOX
 USJ1c76zMUmcevvtBPQFK4uTTFYQ9tPjyDQaNWokAcJr2TUSW/3fj6j4lR0rSN6Y35titnx9eM
 7cCPC1+tosEeY+U2uItS0Vzei7+yFoQUPIKXzwBElQtMjF8z0i3/jkZO+Zc/dpz7ZM3OV+uMFj
 JlFu/olCuYw/1Kuuca5euKCbM6msMYunq4wLoyJL163I6HL6XDT24iJvXoDzVcPzFBld3DoW+G
 xiY+P0IDeX8Q0CgLCe4TLU6D
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2022 00:32:40 -0700
IronPort-SDR: WBb2k1guU0DJNqE3mxsgrT62M0FFHgsblvg8hPeS+yT98V29fh94unXL8w0zw2Hv/A3X3mTKcN
 eCUavWvxqiQLavrVzgW/+4Z07dlge/pVEehOVchHXYDMwK9jw04DC/Cxn082SmvLRef1UNCf26
 AT/DLr29TguV2AvjuBSqIm1MQvBR02rLCYu9Z8Ik3/EoLfkHnTHpJ4XOPTuK84WIgB6T1I5kVw
 eljrb7TReG0CMW2HEjw07eVqZg1S90gMX1NHNAJ9h6tdf7iCs/1f7u9nzlTqPeXPNLMzX/ZX+X
 h18=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2022 01:02:20 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KhfY747yzz1SVnx
	for <nbd@other.debian.org>; Mon, 18 Apr 2022 01:02:19 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1650268938; x=1652860939; bh=OmPuKz2YWA8zfnI8UisdXu/UB5gIbMI/eeJ
	tu4mrOgE=; b=k2KNYTMThAH1FC4KeDU9IMVqlYD06ob2YlhilqA28RznH2WuHy+
	r0MznOqhH6lglniGvSxQxvEhx2hVWOXlwO3806+XkzvJLA92UmNzKDxn6cRP8sQt
	8eFUvs6QSilSuUU9aSN6F04v/b5/eXVWZe3704r5OPqJGrfBzguMSKrAP/Zlcw00
	3cVTjXMW8JMwb09PMT8i49VCTsXCWH8LhpWfJV3YSf4DlGQppH6K9bbfqNY7sLL8
	yvjsvTKJJ+QdJHJet/yciWck8l6aZz0VkfFGdv0lpsF+6r5AcrvEJ06Ae1CISx3i
	OV/L/eRcOsFXVRDP/Z6gtujlxZFH/ImqLfQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Zwyp6Sd4_qte for <nbd@other.debian.org>;
	Mon, 18 Apr 2022 01:02:18 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KhfY24GYPz1Rvlx;
	Mon, 18 Apr 2022 01:02:14 -0700 (PDT)
Message-ID: <cd77bfd9-e133-1929-2d61-73822ad95366@opensource.wdc.com>
Date: Mon, 18 Apr 2022 17:02:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [dm-devel] [PATCH 09/11] nvme: remove a spurious clear of
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
 <20220418045314.360785-10-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220418045314.360785-10-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <eRUwuDFVApP.A.Nv.D-RXiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2030
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/cd77bfd9-e133-1929-2d61-73822ad95366@opensource.wdc.com
Resent-Date: Mon, 18 Apr 2022 08:21:23 +0000 (UTC)

On 4/18/22 13:53, Christoph Hellwig wrote:
> The nvme driver never sets a discard_alignment, so it also doens't need
> to clear it to zero.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/nvme/host/core.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index b9b0fbde97c80..76a9ccd5d064a 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -1628,7 +1628,6 @@ static void nvme_config_discard(struct gendisk *disk, struct nvme_ns *ns)
>  	BUILD_BUG_ON(PAGE_SIZE / sizeof(struct nvme_dsm_range) <
>  			NVME_DSM_MAX_RANGES);
>  
> -	queue->limits.discard_alignment = 0;
>  	queue->limits.discard_granularity = size;
>  
>  	/* If discard is already enabled, don't reset queue limits */

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

