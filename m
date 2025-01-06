Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8B7A02B93
	for <lists+nbd@lfdr.de>; Mon,  6 Jan 2025 16:45:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 11D8B206D8; Mon,  6 Jan 2025 15:45:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan  6 15:45:11 2025
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5FC17206CB
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Jan 2025 15:27:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.998 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eNV0MXJgep9c for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Jan 2025 15:27:14 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A985E2067C
	for <nbd@other.debian.org>; Mon,  6 Jan 2025 15:27:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 98D4A68C7B; Mon,  6 Jan 2025 16:27:08 +0100 (CET)
Date: Mon, 6 Jan 2025 16:27:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
	nbd@other.debian.org, virtualization@lists.linux.dev,
	linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH 05/10] block: don't update BLK_FEAT_POLL in
 __blk_mq_update_nr_hw_queues
Message-ID: <20250106152708.GA27431@lst.de>
References: <20250106100645.850445-1-hch@lst.de> <20250106100645.850445-6-hch@lst.de> <4addcb5e-fc88-4a86-a464-cc25d8674267@linux.ibm.com> <20250106110532.GA22062@lst.de> <3fb212e4-8fff-45fc-9cff-f5b5eaff4231@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fb212e4-8fff-45fc-9cff-f5b5eaff4231@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <MZnwz37WKTC.A.ZM7J.Hq_enB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3233
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250106152708.GA27431@lst.de
Resent-Date: Mon,  6 Jan 2025 15:45:12 +0000 (UTC)

On Mon, Jan 06, 2025 at 05:36:52PM +0530, Nilay Shroff wrote:
> Oh yes, I saw that you moved blk_mq_can_poll() to blk-mq.h and 
> made it inline so thought why bdev_can_poll() can't be made inline?

It can be, but why would you want it to?  What do you gain from forcing
the compiler to inline it, when sane compilers with a sane inlining
threshold will do that anyway.

> BTW, bdev_can_poll() is  called from IO fastpath and so making it inline 
> may slightly improve performance. 
> On another note, I do see that blk_mq_can_poll() is now only called 
> from bdev_can_poll(). So you may want to merge these two functions 
> in a single call and make that inline.

I'd rather keep generic block layer logic separate from blk-mq logic.
We tend to do a few direct calls into blk-mq from the core code to
avoid the indirect call overhead, but we should still keep the code
as separate as possible to keep it somewhat modular.

