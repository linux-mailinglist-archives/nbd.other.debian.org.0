Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C252903579
	for <lists+nbd@lfdr.de>; Tue, 11 Jun 2024 10:18:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 21E5C20678; Tue, 11 Jun 2024 08:18:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 11 08:18:09 2024
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE,WORD_WITHOUT_VOWELS autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E0DEE20689
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Jun 2024 08:02:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.511 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 904SBz1tQ_4J for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Jun 2024 08:02:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CBFD42067F
	for <nbd@other.debian.org>; Tue, 11 Jun 2024 08:02:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 58DC4CE10F6;
	Tue, 11 Jun 2024 08:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD55C2BD10;
	Tue, 11 Jun 2024 08:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718092954;
	bh=9448E2ZQUrvNp7ZURrtI3/D86m7bLK+HS2+4F3/kAbo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cVm1t8g2Dmo9pyaeFexP0cVZp2V9+zrzLaosx0fHWpCgyVMjhJafz/YjIRFcP6e/N
	 JiQrRCWm2cXvKJW25gK4jKXdI9z1r5PiGAPnVoL3Jgi9iLA+RTBXO3LhS10/kQ9VJv
	 S0HFEAZmlsLJdqInbsOGCHZ7lARtlpYV0wnusyawzuHxpb/RclmLX5rlq1DxBTsAuq
	 DUc+w0vOa4IhkCXuAcAxPK35SsjdXOHX0tyGNoT44IBIj7FNuzH/TkqH47YX1TuM03
	 t8bqET45kpSSPx+5HvwwYL7yfxY/bG8VgPBzRal4b99z62CNkY4oDCrnC6ah7dxmTJ
	 PwVnGOKYPVpoA==
Message-ID: <01366bae-699e-45dc-bad1-9541883a8b42@kernel.org>
Date: Tue, 11 Jun 2024 17:02:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/26] block: move the nonrot flag to queue_limits
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-15-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-15-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <k6E6pZIlRqL.A.9X4N.BhAamB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2939
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/01366bae-699e-45dc-bad1-9541883a8b42@kernel.org
Resent-Date: Tue, 11 Jun 2024 08:18:09 +0000 (UTC)

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Move the norot flag into the queue_limits feature field so that it can be

s/norot/nonrot

> set atomically and all I/O is frozen when changing the flag.

and... -> with the queue frozen when... ?

> 
> Use the chance to switch to defaulting to non-rotational and require
> the driver to opt into rotational, which matches the polarity of the
> sysfs interface.
> 
> For the z2ram, ps3vram, 2x memstick, ubiblock and dcssblk the new
> rotational flag is not set as they clearly are not rotational despite
> this being a behavior change.  There are some other drivers that
> unconditionally set the rotational flag to keep the existing behavior
> as they arguably can be used on rotational devices even if that is
> probably not their main use today (e.g. virtio_blk and drbd).
> 
> The flag is automatically inherited in blk_stack_limits matching the
> existing behavior in dm and md.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Other than that, looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

