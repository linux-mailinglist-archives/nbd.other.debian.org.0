Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFECA041AF
	for <lists+nbd@lfdr.de>; Tue,  7 Jan 2025 15:09:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 76C0920763; Tue,  7 Jan 2025 14:09:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  7 14:09:10 2025
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C0E012070D
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jan 2025 13:52:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.998 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zVp6DmrX19AS for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jan 2025 13:52:00 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6501F20701
	for <nbd@other.debian.org>; Tue,  7 Jan 2025 13:52:00 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 830B868D07; Tue,  7 Jan 2025 14:51:53 +0100 (CET)
Date: Tue, 7 Jan 2025 14:51:53 +0100
From: Christoph Hellwig <hch@lst.de>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
	nbd@other.debian.org, linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH 3/8] block: don't update BLK_FEAT_POLL in
 __blk_mq_update_nr_hw_queues
Message-ID: <20250107135153.GB22046@lst.de>
References: <20250107063120.1011593-1-hch@lst.de> <20250107063120.1011593-4-hch@lst.de> <220cdd33-527f-405d-90af-2abaace36645@linux.ibm.com> <20250107082145.GA15960@lst.de> <90ae40c5-b695-4e17-8293-6a61648ed24a@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90ae40c5-b695-4e17-8293-6a61648ed24a@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <81ma8PsaPJB.A.DtAO.GWTfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3266
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250107135153.GB22046@lst.de
Resent-Date: Tue,  7 Jan 2025 14:09:10 +0000 (UTC)

On Tue, Jan 07, 2025 at 02:53:40PM +0530, Nilay Shroff wrote:
> When I applied you patch on my system and access io_poll attribute
> of one of my nvme disk, I see it returns 1, though I didn't configure 
> poll queue for the disk. With this patch, as we're now always setting 
> BLK_FEAT_POLL (under blk_mq_alloc_queue()) it return 1. So when I haven't
> configured poll queue for NVMe driver, shouldn't it return 0 when I access 
> /sys/block/nvmeXnY/queue/io_poll ?  

While that was the case with the previous RFC series it should not be
the case with this version, as the nvme driver does not enable the
poll tag set map unless poll queues are enabled.  I also double checked
that I do not see it on any of my test setups.

