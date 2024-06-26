Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id CA29D917904
	for <lists+nbd@lfdr.de>; Wed, 26 Jun 2024 08:33:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 92E7420596; Wed, 26 Jun 2024 06:33:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun 26 06:33:26 2024
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 539B1206BB
	for <lists-other-nbd@bendel.debian.org>; Wed, 26 Jun 2024 06:18:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vleb7VUcHjjW for <lists-other-nbd@bendel.debian.org>;
	Wed, 26 Jun 2024 06:18:10 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E3A7D206A0
	for <nbd@other.debian.org>; Wed, 26 Jun 2024 06:18:10 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 85E4B68BEB; Wed, 26 Jun 2024 08:18:04 +0200 (CEST)
Date: Wed, 26 Jun 2024 08:18:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Oliver Sang <oliver.sang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, oe-lkp@lists.linux.dev, lkp@intel.com,
	Jens Axboe <axboe@kernel.dk>, Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>, linux-m68k@lists.linux-m68k.org,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
	nbd@other.debian.org, linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	nvdimm@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [axboe-block:for-next] [block]  bd4a633b6f:
 fsmark.files_per_sec -64.5% regression
Message-ID: <20240626061804.GA23481@lst.de>
References: <202406241546.6bbd44a7-oliver.sang@intel.com> <20240624083537.GA19941@lst.de> <Znuw/4zMD4w5Oq2a@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Znuw/4zMD4w5Oq2a@xsang-OptiPlex-9020>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <CKE5Dn0DDfF.A.y1SF.2Y7emB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3084
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240626061804.GA23481@lst.de
Resent-Date: Wed, 26 Jun 2024 06:33:26 +0000 (UTC)

On Wed, Jun 26, 2024 at 02:11:11PM +0800, Oliver Sang wrote:
> hi, Christoph Hellwig,
> 
> On Mon, Jun 24, 2024 at 10:35:37AM +0200, Christoph Hellwig wrote:
> > This is odd to say at least.  Any chance you can check the value
> > of /sys/block/$DEVICE/queue/rotational for the relevant device before
> > and after this commit?  And is this an ATA or NVMe SSD?
> > 
> 
> yeah, as Niklas mentioned, it's an ATA SSD.
> 
> I checked the /sys/block/$DEVICE/queue/rotational before and after this commit,
> both show '0'. not sure if this is expected.
> 
> anyway, I noticed you send a patch [1]
> 
> so I applied this patch upon bd4a633b6f, and found the performance restored.

Thanks for testing!

