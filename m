Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E77D750327D
	for <lists+nbd@lfdr.de>; Sat, 16 Apr 2022 04:57:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7D1CE204AF; Sat, 16 Apr 2022 02:57:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Apr 16 02:57:09 2022
Old-Return-Path: <chao@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,GMAIL,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_HI,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 27B20204AB
	for <lists-other-nbd@bendel.debian.org>; Sat, 16 Apr 2022 02:39:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.473 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, GMAIL=1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-1.282, RCVD_IN_DNSWL_HI=-5, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Sdio7f8bF7vT for <lists-other-nbd@bendel.debian.org>;
	Sat, 16 Apr 2022 02:39:22 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 616 seconds by postgrey-1.36 at bendel; Sat, 16 Apr 2022 02:39:22 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 72A6C20343
	for <nbd@other.debian.org>; Sat, 16 Apr 2022 02:39:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2FF20B82E4A;
	Sat, 16 Apr 2022 02:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BEAC385A9;
	Sat, 16 Apr 2022 02:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650076142;
	bh=64fC476XAzTfqTSPn+hnDLb+pMKn+pGg/cu9T2ZYoeo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YR2swQd5bHjAFWTiUHuzi2CBAoBviVOC618ZH6KrZjKGz54+nb14CQuuZA/rg7rT4
	 HOUGUM1/um4+uLyDQbz+2PZe7eFGngBlsNfmtF55BEnpI8SeGgAW1TB9RPEF0hZ/gu
	 wadS+mRuD6cvw4fVgc6pYN09yVoj6blhm7pLMwx6SJQPqerB95uO3eDsfGVZkI1tAT
	 ypjbfbxn7+bT/FWjnusepnTR0gEoGRsC/NgAvlwAmFKhGsjLJGRbec9W3gsrNwS1xO
	 /N5W0GD6Xr6BMAFslHSxbnYfv+w/HrqJWAmw3dvOKrGV8WDuaNAVrqQjvW1ASku3np
	 CHDdJgFxl65YQ==
Message-ID: <ffa14a07-b8f9-828e-97bc-cf7a2099bab5@kernel.org>
Date: Sat, 16 Apr 2022 10:28:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [f2fs-dev] [PATCH 26/27] block: decouple REQ_OP_SECURE_ERASE from
 REQ_OP_DISCARD
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Coly Li <colyli@suse.de>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-raid@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org,
 =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-btrfs@vger.kernel.org
References: <20220415045258.199825-1-hch@lst.de>
 <20220415045258.199825-27-hch@lst.de>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220415045258.199825-27-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nW6KDcGSWoE.A.4m.FCjWiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2015
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ffa14a07-b8f9-828e-97bc-cf7a2099bab5@kernel.org
Resent-Date: Sat, 16 Apr 2022 02:57:09 +0000 (UTC)

On 2022/4/15 12:52, Christoph Hellwig wrote:
> Secure erase is a very different operation from discard in that it is
> a data integrity operation vs hint.  Fully split the limits and helper
> infrastructure to make the separation more clear.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Acked-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com> [drbd]
> Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com> [nifs2]
> Acked-by: Jaegeuk Kim <jaegeuk@kernel.org> [f2fs]
> Acked-by: Coly Li <colyli@suse.de> [bcache]
> Acked-by: David Sterba <dsterba@suse.com> [btrfs]

For f2fs part,

Acked-by: Chao Yu <chao@kernel.org>

Thanks,

