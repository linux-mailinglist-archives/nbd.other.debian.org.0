Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4F7504DB8
	for <lists+nbd@lfdr.de>; Mon, 18 Apr 2022 10:24:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 63EFF20472; Mon, 18 Apr 2022 08:24:27 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 18 08:24:27 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 9DF23202C9
	for <lists-other-nbd@bendel.debian.org>; Mon, 18 Apr 2022 08:07:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.772 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.282, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DNrBGZEqwNEL for <lists-other-nbd@bendel.debian.org>;
	Mon, 18 Apr 2022 08:07:47 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hgst.iphmx.com", Issuer "Go Daddy Secure Certificate Authority - G2" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id DE80620222
	for <nbd@other.debian.org>; Mon, 18 Apr 2022 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650269267; x=1681805267;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=N3pAk4FME4FfpMn1iEoaJawKiDbUT/rSC5t+NXLtpDE=;
  b=TVvShAINkwVN9DxlGaRHPo7XCDgmLSRVvWeLkM597/TxB0DFVfwsf9Nk
   u1fKatqLDyrCinJgQ4NVe2Y86CfKmIipy20WQBJi7fXyToOepqKLuoxVk
   5pupQLHgp3ov1O6wQRrhQAghPt3ta5NjtfHtnsvXswCQRZv3Xldxou16t
   0ssHEOQ2LzGcTW4edUQgbb7zbk24E6lQYZkRCZTwkwCZ20uW2ncG9fxWz
   ys9YSoChdHHekkAsyh6f7s/0RD0688g2ZK6yfOhRyTxeSDaS4CwwsndDO
   c3vkxT5DNzk937oMBbDB54mvgfANaIZdIXV2VpbxIXXChfxnb6G4QaDj+
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,269,1643644800"; 
   d="scan'208";a="199047526"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 18 Apr 2022 16:00:20 +0800
IronPort-SDR: 9D6+dDeqL+X4M8tNk6sXN6gc6me9I7PHK5+wy5acacxkOaeIVUKYwLtmogzRpwbTyDE8AZ0OlR
 bpJousqWuOmTDOQbWafqs8iWHZ7Bm212piylGOu7f/T5B3mN4rnH+TLXrF+tVD1SKcvuPGa9/G
 0KbC10A1pYZmBN01lEzTrjhcl2Yyu5TGrwSTDR3/H281nrzuOlXg/KRtZw1y4M+OIKpUa/ncsH
 +2w+w7CGtASKW88Pfu5ZddXNvI28OGDzTN52A/wUhjJAlmRhZlMmVr8XT6oNHLU/FnMJxhxd+G
 N5rEt0ikLOnmGqafUNGgj94w
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2022 00:30:40 -0700
IronPort-SDR: xBK4+aSPCbAfi0aos+OYrvTIrx1QiAknSDdSn65oQzLT/6N/yNvqHH7mgkhk9EZ5teC22U+pQp
 um+m9H57rls6H13G+jGsbwDYQ5HzrUICV2J2gGfVSKXw0g/0kgI1j9E6yYJxSGbFlXPh45pSdO
 IEsP5xGCfLa0b4DjAI4YPUl3x/y7+9ZBfCKFzSxmpyFIYhol0KR6ETlMXzWZkPXPRcsuUMgUaQ
 n5Q7JRhVEIUvgHap90DRcnN/Lbo8AU7JauAfdOhHUWA1XyPr6IrNfoddeiorX7a+JbqqS8iLeN
 t00=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2022 01:00:20 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KhfVq0MXJz1SVpD
	for <nbd@other.debian.org>; Mon, 18 Apr 2022 01:00:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1650268817; x=1652860818; bh=N3pAk4FME4FfpMn1iEoaJawKiDbUT/rSC5t
	+NXLtpDE=; b=Hv31bX7Jya9kAcbobcM2DbhnrpTGs/GTwAAtUv8vySpoFKQgxRG
	0PYJGfA2dAECZHN+A7jojXX4TPCln72oMy6HJclm/I/vdkiE/jo8YTTeRoyYZsgm
	/8g2jq0kSlmAlmdBaXgVhQugmIYoKJc6VSVmS3/vKZFuOGWdIx3J42PRXZRhj4vT
	4OURB/Cn0/RePkSCzRD3y1jplJh4/R5mHZHD9LVCry/+O2GN9qeH5cwnhqL23+sn
	do6qojLT8/p84Nyj8izFB9vEJu3PN59Q67c1vVF9yFO0YZerzJcoLMqR+oWldmNt
	RJ+7CYGXRuTQNYYhpyJfVv2zpFqW2SwbGxA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id z3rKvfzbTfJW for <nbd@other.debian.org>;
	Mon, 18 Apr 2022 01:00:17 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KhfVj0QSXz1Rvlx;
	Mon, 18 Apr 2022 01:00:12 -0700 (PDT)
Message-ID: <fd915a51-035f-d5c6-42a1-c517e3d1f1b1@opensource.wdc.com>
Date: Mon, 18 Apr 2022 17:00:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [dm-devel] [PATCH 05/11] dm-zoned: don't set the
 discard_alignment queue limit
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
 <20220418045314.360785-6-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220418045314.360785-6-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rym9uDi2VbG.A.6yD.7ASXiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2032
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/fd915a51-035f-d5c6-42a1-c517e3d1f1b1@opensource.wdc.com
Resent-Date: Mon, 18 Apr 2022 08:24:27 +0000 (UTC)

On 4/18/22 13:53, Christoph Hellwig wrote:
> The discard_alignment queue limit is named a bit misleading means the
> offset into the block device at which the discard granularity starts.
> Setting it to the discard granularity as done by dm-zoned is mostly
> harmless but also useless.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/md/dm-zoned-target.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index cac295cc8840e..0ec5d8b9b1a4e 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -1001,7 +1001,7 @@ static void dmz_io_hints(struct dm_target *ti, struct queue_limits *limits)
>  	blk_limits_io_min(limits, DMZ_BLOCK_SIZE);
>  	blk_limits_io_opt(limits, DMZ_BLOCK_SIZE);
>  
> -	limits->discard_alignment = DMZ_BLOCK_SIZE;
> +	limits->discard_alignment = 0;
>  	limits->discard_granularity = DMZ_BLOCK_SIZE;
>  	limits->max_discard_sectors = chunk_sectors;
>  	limits->max_hw_discard_sectors = chunk_sectors
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

