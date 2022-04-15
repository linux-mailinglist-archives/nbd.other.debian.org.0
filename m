Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8436A5023EF
	for <lists+nbd@lfdr.de>; Fri, 15 Apr 2022 07:33:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6B49120348; Fri, 15 Apr 2022 05:33:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Apr 15 05:33:11 2022
Old-Return-Path: <prvs=0972008b0=damien.lemoal@opensource.wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D82A0202E4
	for <lists-other-nbd@bendel.debian.org>; Fri, 15 Apr 2022 05:15:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.772 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-1.282, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id oPitorprVIGZ for <lists-other-nbd@bendel.debian.org>;
	Fri, 15 Apr 2022 05:15:51 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 438 seconds by postgrey-1.36 at bendel; Fri, 15 Apr 2022 05:15:51 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hgst.iphmx.com", Issuer "Go Daddy Secure Certificate Authority - G2" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5856520365
	for <nbd@other.debian.org>; Fri, 15 Apr 2022 05:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649999751; x=1681535751;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Fza98p6Hk/Oo3R5YjAQC2Nws92s1JhenlM6js5zQuBI=;
  b=SoDm916bkjQHGUOTH+frYitrAGm88gl5YNeZ7CRseibG4aO5Vx00ABd8
   s0hQkRLyctqZk4yEKjdtAT/NK9LsCJiUuPBgqnLagAQaNwAY7Z8MQ+YCE
   HTEy+741nOQjYPUQLX/YN2NsAKrIQ1XZ0ZHDDzdy50NHcCEbI7J+zR7ap
   gm0/hnLwwMY/04cuVsVI4lyiq0DT21NvzWtLREum9MCo7FpIyDgzC7ibs
   GHThg7Ny8KxbwuRrd548jQR02pBr/8DI/ELmBRwCsc918lMM7ZR+njUIn
   6P27QEnKhf37hagKpJIewDv0FgEx5utu41eoblSNhTHJp1hpytcHcv1SF
   g==;
X-IronPort-AV: E=Sophos;i="5.90,261,1643644800"; 
   d="scan'208";a="309936202"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2022 13:08:28 +0800
IronPort-SDR: eJ0I7gNmG1g6ejFE8U4dxnsfZ3ZHHV6PCKcd+LDztgrFJpDnyIA+2HFeVa98iY/GfmT6Pv9PXO
 R6OZ4VBx2i4+1yCGAhP3gEJNl4hPh/C/g6mH4DiJVAq8J+5tO9KerEtjCN6GoT+fhczlsJm3oU
 8qiyoujU6Tud/V1Y2bQe/RpIZClagGlEcQZ9YagEH9Cv8tPp5Nk/OBMeFgL4ni6Glt1adhY3P6
 RwsG0q0NtPk9MwxlUXhXwBZz11E0g/RmlYxz81XrUkfvctWc+2GCVo+ovJoTnrCfB1r/xWFUSW
 slZUD/prWOb5EKzBf3BtSylX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Apr 2022 21:39:39 -0700
IronPort-SDR: m+pdEsnXrQDHgmEtYhfRdTG5LwrY8AEmRinTGkT8nFXjeqtJ7Vqe4U2yT0YY1NMFKgDrtnvo5m
 QcTRAHQBmm60r6ep5YW1VlZhFWIBt/ZA8FEJ4dLDSO9xk5GzNf6EvluoJE6tVkRYU68x7Puvb6
 vypNqq1y4RWCOdA9z+u4QX6mYlmAduBwqjOKt6zcmPOpbG+4BLrmzJYl66VvKRl/7F5aNf01bv
 /pX0VNSTu4WRgdPCl5/lOwRaVwE4rLoScLDUwyeu3fafF+9A1oL9JCS9OaudIVcbrpFkM0UwhG
 iBU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Apr 2022 22:08:29 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kfkqv6GFxz1SHwl
	for <nbd@other.debian.org>; Thu, 14 Apr 2022 22:08:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1649999307; x=1652591308; bh=Fza98p6Hk/Oo3R5YjAQC2Nws92s1JhenlM6
	js5zQuBI=; b=PnLGxxEK3pLyssa8yxGNdC4XjW2wbor1ccVbtGFYLuF6J3cLtHd
	AbpMYH7aDhgG/pTbCzP2Jz5UXeITA2uAAyiR/Fy6attbFAobIm77MiZ1d9JwxmK8
	shfFnnjg3a2RytIj37jVhbyrF9O4v+hLyhCzQz2dnHJygtOnBuY0SiH0emrVEC5V
	37Q51RwNl9CEkvSI7J63mNoy2HlvXkxHid/Xl33/pVaD25Hfmrh/cyibuFKv7AtS
	/tmUO1ElBPCNJo60JkfPy33eMUDO0eae+UlOxVUV5CwFdxfl0b0VIs1osnbs2TmY
	qPuOzeMMi/kXJvdALFOBXWDwdlihcT0EYFQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9KVPOTNV63Sk for <nbd@other.debian.org>;
	Thu, 14 Apr 2022 22:08:27 -0700 (PDT)
Received: from [10.225.163.9] (unknown [10.225.163.9])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kfkqn6sCZz1Rvlx;
	Thu, 14 Apr 2022 22:08:21 -0700 (PDT)
Message-ID: <d7a39cfc-9b28-f0d6-bf62-4351c55daec2@opensource.wdc.com>
Date: Fri, 15 Apr 2022 14:08:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 27/27] direct-io: remove random prefetches
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
 <20220415045258.199825-28-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220415045258.199825-28-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WYLoHEZnxEH.A.ROF.XOQWiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1999
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d7a39cfc-9b28-f0d6-bf62-4351c55daec2@opensource.wdc.com
Resent-Date: Fri, 15 Apr 2022 05:33:11 +0000 (UTC)

On 4/15/22 13:52, Christoph Hellwig wrote:
> Randomly poking into block device internals for manual prefetches isn't
> exactly a very maintainable thing to do.  And none of the performance
> criticil direct I/O implementations still use this library function

s/criticil/critical

> anyway, so just drop it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>


-- 
Damien Le Moal
Western Digital Research

