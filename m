Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD29A02430
	for <lists+nbd@lfdr.de>; Mon,  6 Jan 2025 12:21:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 04C19206F2; Mon,  6 Jan 2025 11:21:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan  6 11:21:08 2025
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F3C8720679
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Jan 2025 11:05:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.998 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 0Lmyou1A8vqC for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Jan 2025 11:05:37 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 479 seconds by postgrey-1.36 at bendel; Mon, 06 Jan 2025 11:05:37 UTC
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A3B1120670
	for <nbd@other.debian.org>; Mon,  6 Jan 2025 11:05:37 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4122D68B05; Mon,  6 Jan 2025 12:05:32 +0100 (CET)
Date: Mon, 6 Jan 2025 12:05:32 +0100
From: Christoph Hellwig <hch@lst.de>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
	nbd@other.debian.org, virtualization@lists.linux.dev,
	linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH 05/10] block: don't update BLK_FEAT_POLL in
 __blk_mq_update_nr_hw_queues
Message-ID: <20250106110532.GA22062@lst.de>
References: <20250106100645.850445-1-hch@lst.de> <20250106100645.850445-6-hch@lst.de> <4addcb5e-fc88-4a86-a464-cc25d8674267@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4addcb5e-fc88-4a86-a464-cc25d8674267@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <s9KsyslREeL.A.ArcG.ky7enB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3225
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250106110532.GA22062@lst.de
Resent-Date: Mon,  6 Jan 2025 11:21:09 +0000 (UTC)

On Mon, Jan 06, 2025 at 04:31:23PM +0530, Nilay Shroff wrote:
> > +static bool bdev_can_poll(struct block_device *bdev)
> > +{
> > +	struct request_queue *q = bdev_get_queue(bdev);
> > +
> > +	if (queue_is_mq(q))
> > +		return blk_mq_can_poll(q->tag_set);
> > +	return q->limits.features & BLK_FEAT_POLL;
> > +}
> > +
> 
> Should we make bdev_can_poll() inline ?

I don't really see the point.  It's file local and doesn't have any
magic that could confuse the code generator, so we might as well leave
it to the compiler.  Although that might be about to change per the
discussion with Damien, which could require it in blk-sysfs, in
which case it should become an inline in a header.

