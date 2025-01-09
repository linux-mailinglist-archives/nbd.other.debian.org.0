Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 00807A06B31
	for <lists+nbd@lfdr.de>; Thu,  9 Jan 2025 03:36:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AB28C205AA; Thu,  9 Jan 2025 02:36:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan  9 02:36:09 2025
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C9142205A2
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Jan 2025 02:18:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.538 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mKFg7SdxnJcC for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Jan 2025 02:18:45 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 0D35A2058A
	for <nbd@other.debian.org>; Thu,  9 Jan 2025 02:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736389119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NI/7sQZJsUB7MRKETVbNrqqCnlEl+xyWkxCJ71vt8Ik=;
	b=IrIud1ZMZJ/v1hBEz1Y3r4b5g8euPQcXOswWdHJeybeZqev0iG81mNfrFLBOIb7P0cmogO
	SHdJLT1vQ7gbBuB4PaqqpQbjhMTodO7rGMRCY3RNruH+xeGYgFD+iMc1lFUrDO/Z0o5JZA
	47spXOf7nApqfznI6UiviEBt+knglJw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-357-7FSoSldJMXm3ogIjfdzqow-1; Wed,
 08 Jan 2025 21:18:37 -0500
X-MC-Unique: 7FSoSldJMXm3ogIjfdzqow-1
X-Mimecast-MFC-AGG-ID: 7FSoSldJMXm3ogIjfdzqow
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E3DF5195608B;
	Thu,  9 Jan 2025 02:18:34 +0000 (UTC)
Received: from fedora (unknown [10.72.116.23])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8EB1419560AD;
	Thu,  9 Jan 2025 02:18:28 +0000 (UTC)
Date: Thu, 9 Jan 2025 10:18:22 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Nilay Shroff <nilay@linux.ibm.com>, linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org, nbd@other.debian.org,
	linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH 03/10] block: don't update BLK_FEAT_POLL in
 __blk_mq_update_nr_hw_queues
Message-ID: <Z38x7mzrQPEiUOpv@fedora>
References: <20250108092520.1325324-1-hch@lst.de>
 <20250108092520.1325324-4-hch@lst.de>
 <Z35T8xeLxhXe-zAS@fedora>
 <20250108152705.GA24792@lst.de>
 <a3bd231c-0568-4dad-9268-bc7edaace94b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3bd231c-0568-4dad-9268-bc7edaace94b@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <TrBPbVraukE.A.VX9K.ZYzfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3303
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Z38x7mzrQPEiUOpv@fedora
Resent-Date: Thu,  9 Jan 2025 02:36:09 +0000 (UTC)

On Thu, Jan 09, 2025 at 09:05:49AM +0900, Damien Le Moal wrote:
> On 1/9/25 00:27, Christoph Hellwig wrote:
> > On Wed, Jan 08, 2025 at 06:31:15PM +0800, Ming Lei wrote:
> >>> -	if (!(q->limits.features & BLK_FEAT_POLL) &&
> >>> -			(bio->bi_opf & REQ_POLLED)) {
> >>> +	if ((bio->bi_opf & REQ_POLLED) && !bdev_can_poll(bdev)) {
> >>
> >> submit_bio_noacct() is called without grabbing .q_usage_counter,
> >> so tagset may be freed now, then use-after-free on q->tag_set?
> > 
> > Indeed.  That also means the previous check wasn't reliable either.
> > I think we can simple move the check into
> > blk_mq_submit_bio/__submit_bio which means we'll do a bunch more
> > checks before we eventually fail, but otherwise it'll work the
> > same.
> 
> Given that the request queue is the same for all tag sets, I do not think we

No, it isn't same.

> need to have the queue_limits_start_update()/commit_update() within the tag set
> loop in __blk_mq_update_nr_hw_queues(). So something like this should be enough
> for an initial fix, no ?
> 
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index 8ac19d4ae3c0..ac71e9cee25b 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -4986,6 +4986,7 @@ static void __blk_mq_update_nr_hw_queues(struct
> blk_mq_tag_set *set,
>                                                         int nr_hw_queues)
>  {
>         struct request_queue *q;
> +       struct queue_limits lim;
>         LIST_HEAD(head);
>         int prev_nr_hw_queues = set->nr_hw_queues;
>         int i;
> @@ -4999,8 +5000,10 @@ static void __blk_mq_update_nr_hw_queues(struct
> blk_mq_tag_set *set,
>         if (set->nr_maps == 1 && nr_hw_queues == set->nr_hw_queues)
>                 return;
> 
> +       lim = queue_limits_start_update(q);
>         list_for_each_entry(q, &set->tag_list, tag_set_list)
>                 blk_mq_freeze_queue(q);

It could be worse, since the limits_lock is connected with lots of other
subsystem's lock(debugfs, sysfs dir, ...), it may introduce new deadlock
risk.

Thanks,
Ming

