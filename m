Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 584FEA0607A
	for <lists+nbd@lfdr.de>; Wed,  8 Jan 2025 16:45:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1E548207BE; Wed,  8 Jan 2025 15:45:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan  8 15:45:09 2025
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2AC1020794
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Jan 2025 15:27:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.998 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8l2irjlvK-pD for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Jan 2025 15:27:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id DC7D82078F
	for <nbd@other.debian.org>; Wed,  8 Jan 2025 15:27:11 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4A05568BFE; Wed,  8 Jan 2025 16:27:06 +0100 (CET)
Date: Wed, 8 Jan 2025 16:27:05 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ming Lei <ming.lei@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>,
	Nilay Shroff <nilay@linux.ibm.com>, linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org, nbd@other.debian.org,
	linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH 03/10] block: don't update BLK_FEAT_POLL in
 __blk_mq_update_nr_hw_queues
Message-ID: <20250108152705.GA24792@lst.de>
References: <20250108092520.1325324-1-hch@lst.de> <20250108092520.1325324-4-hch@lst.de> <Z35T8xeLxhXe-zAS@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z35T8xeLxhXe-zAS@fedora>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <z7WkXaVRCtJ.A.ULhC.F2pfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3299
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250108152705.GA24792@lst.de
Resent-Date: Wed,  8 Jan 2025 15:45:10 +0000 (UTC)

On Wed, Jan 08, 2025 at 06:31:15PM +0800, Ming Lei wrote:
> > -	if (!(q->limits.features & BLK_FEAT_POLL) &&
> > -			(bio->bi_opf & REQ_POLLED)) {
> > +	if ((bio->bi_opf & REQ_POLLED) && !bdev_can_poll(bdev)) {
> 
> submit_bio_noacct() is called without grabbing .q_usage_counter,
> so tagset may be freed now, then use-after-free on q->tag_set?

Indeed.  That also means the previous check wasn't reliable either.
I think we can simple move the check into
blk_mq_submit_bio/__submit_bio which means we'll do a bunch more
checks before we eventually fail, but otherwise it'll work the
same.

