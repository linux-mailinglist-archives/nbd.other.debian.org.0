Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CBB914F94
	for <lists+nbd@lfdr.de>; Mon, 24 Jun 2024 16:09:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0500F20773; Mon, 24 Jun 2024 14:09:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 24 14:09:13 2024
Old-Return-Path: <cassel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8E7C820808
	for <lists-other-nbd@bendel.debian.org>; Mon, 24 Jun 2024 13:52:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.511 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Upbln6WLzXRY for <lists-other-nbd@bendel.debian.org>;
	Mon, 24 Jun 2024 13:52:32 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 382 seconds by postgrey-1.36 at bendel; Mon, 24 Jun 2024 13:52:32 UTC
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B64F2207B9
	for <nbd@other.debian.org>; Mon, 24 Jun 2024 13:52:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 511A060346;
	Mon, 24 Jun 2024 13:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6A4C32782;
	Mon, 24 Jun 2024 13:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719236766;
	bh=nEbRkmLliGbrhN7a0dFrrROolzsUWf2ymgDG1frRQgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HPvBUv03t5fHmHl5Vdhl5NNvWh/1rmgJmDIUT78BrhNjkekMyiHBemsXBtITKK+pk
	 Ph9y6SGv/k+x5Jl2xhlIMX2sddEfv5ScOkESPGjMaDvg1ZXM5kaST/YeMPDuDVXpgg
	 iH6h0sucNAo73sjXdAnuoapZ6RfRXTSWnSxyRGyPeNDve4kUinDBuUenLUefA9rCqX
	 54StG+jluCv5aLHX9mMsHCk5XhZuGMG20N2tbjRRxE9agT2YFzShKRFvN/weyUUZ99
	 p5MaDhc41zpO0i44wkIP3EtvIWnOiXRYHg0365/uFE0+rIV0Jq+m7pwvM4OmoBjW+O
	 CdaoXjn9E8fNg==
Date: Mon, 24 Jun 2024 15:45:57 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
	linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, ying.huang@intel.com,
	feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [axboe-block:for-next] [block]  bd4a633b6f: fsmark.files_per_sec
 -64.5% regression
Message-ID: <Znl4lXRmK2ukDB7r@ryzen.lan>
References: <202406241546.6bbd44a7-oliver.sang@intel.com>
 <20240624083537.GA19941@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624083537.GA19941@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <HtMjnN-r2EI.A.bZtC.J4XemB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3076
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Znl4lXRmK2ukDB7r@ryzen.lan
Resent-Date: Mon, 24 Jun 2024 14:09:14 +0000 (UTC)

On Mon, Jun 24, 2024 at 10:35:37AM +0200, Christoph Hellwig wrote:
> This is odd to say at least.  Any chance you can check the value
> of /sys/block/$DEVICE/queue/rotational for the relevant device before
> and after this commit?  And is this an ATA or NVMe SSD?
> 

Seems to be ATA SSD:
https://download.01.org/0day-ci/archive/20240624/202406241546.6bbd44a7-oliver.sang@intel.com/job.yaml

ssd_partitions: "/dev/disk/by-id/ata-INTEL_SSDSC2BG012T4_BTHC428201ZX1P2OGN-part1"

Most likely btrfs does something different depending on the nonrot flag
being set or not. (And like you are suggesting, most likely the value of
the nonrot flag is somehow different after commit bd4a633b6f)


Kind regards,
Niklas

