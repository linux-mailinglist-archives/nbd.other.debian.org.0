Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD7BA039EB
	for <lists+nbd@lfdr.de>; Tue,  7 Jan 2025 09:41:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 80C3D20701; Tue,  7 Jan 2025 08:41:03 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  7 08:41:03 2025
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9A35A20664
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jan 2025 08:23:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.998 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id AMwXjJVkVV3r for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jan 2025 08:23:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 56A6A20630
	for <nbd@other.debian.org>; Tue,  7 Jan 2025 08:23:11 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1282468AFE; Tue,  7 Jan 2025 09:23:07 +0100 (CET)
Date: Tue, 7 Jan 2025 09:23:06 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ming Lei <ming.lei@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>,
	Nilay Shroff <nilay@linux.ibm.com>, linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org, nbd@other.debian.org,
	linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH 4/8] block: add a store_limit operations for sysfs
 entries
Message-ID: <20250107082306.GC15960@lst.de>
References: <20250107063120.1011593-1-hch@lst.de> <20250107063120.1011593-5-hch@lst.de> <Z3zXANbFk6GBZg_z@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3zXANbFk6GBZg_z@fedora>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5BZxpFTH0wJ.A.g2oI.fiOfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3252
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250107082306.GC15960@lst.de
Resent-Date: Tue,  7 Jan 2025 08:41:03 +0000 (UTC)

Hi Ming,

this is a friendly reminder to reply without quoting the entire mail.
I did not find any content after scrolling half a dozend page of
full quote and gave up.

> > +	.attr		= { .name = _name, .mode = 0644 },	\
> > +	.show		= _prefix##_show,			\
> > +	.store_limit	= _prefix##_store,			\
> > +}
> > +
> >  #define QUEUE_RW_LOAD_MODULE_ENTRY(_prefix, _name)		\
> >  static struct queue_sysfs_entry _prefix##_entry = {		\
> >  	.attr		= { .name = _name, .mode = 0644 },	\
> > @@ -441,7 +422,7 @@ static struct queue_sysfs_entry _prefix##_entry = {		\
> >  
> >  QUEUE_RW_ENTRY(queue_requests, "nr_requests");
> >  QUEUE_RW_ENTRY(queue_ra, "read_ahead_kb");
> > -QUEUE_RW_ENTRY(queue_max_sectors, "max_sectors_kb");
> > +QUEUE_LIM_RW_ENTRY(queue_max_sectors, "max_sectors_kb");
> >  QUEUE_RO_ENTRY(queue_max_hw_sectors, "max_hw_sectors_kb");
> >  QUEUE_RO_ENTRY(queue_max_segments, "max_segments");
> >  QUEUE_RO_ENTRY(queue_max_integrity_segments, "max_integrity_segments");
> > @@ -457,7 +438,7 @@ QUEUE_RO_ENTRY(queue_io_opt, "optimal_io_size");
> >  QUEUE_RO_ENTRY(queue_max_discard_segments, "max_discard_segments");
> >  QUEUE_RO_ENTRY(queue_discard_granularity, "discard_granularity");
> >  QUEUE_RO_ENTRY(queue_max_hw_discard_sectors, "discard_max_hw_bytes");
> > -QUEUE_RW_ENTRY(queue_max_discard_sectors, "discard_max_bytes");
> > +QUEUE_LIM_RW_ENTRY(queue_max_discard_sectors, "discard_max_bytes");
> >  QUEUE_RO_ENTRY(queue_discard_zeroes_data, "discard_zeroes_data");
> >  
> >  QUEUE_RO_ENTRY(queue_atomic_write_max_sectors, "atomic_write_max_bytes");
> > @@ -477,11 +458,11 @@ QUEUE_RO_ENTRY(queue_max_open_zones, "max_open_zones");
> >  QUEUE_RO_ENTRY(queue_max_active_zones, "max_active_zones");
> >  
> >  QUEUE_RW_ENTRY(queue_nomerges, "nomerges");
> > -QUEUE_RW_ENTRY(queue_iostats_passthrough, "iostats_passthrough");
> > +QUEUE_LIM_RW_ENTRY(queue_iostats_passthrough, "iostats_passthrough");
> >  QUEUE_RW_ENTRY(queue_rq_affinity, "rq_affinity");
> >  QUEUE_RW_ENTRY(queue_poll, "io_poll");
> >  QUEUE_RW_ENTRY(queue_poll_delay, "io_poll_delay");
> > -QUEUE_RW_ENTRY(queue_wc, "write_cache");
> > +QUEUE_LIM_RW_ENTRY(queue_wc, "write_cache");
> >  QUEUE_RO_ENTRY(queue_fua, "fua");
> >  QUEUE_RO_ENTRY(queue_dax, "dax");
> >  QUEUE_RW_ENTRY(queue_io_timeout, "io_timeout");
> > @@ -494,10 +475,10 @@ static struct queue_sysfs_entry queue_hw_sector_size_entry = {
> >  	.show = queue_logical_block_size_show,
> >  };
> >  
> > -QUEUE_RW_ENTRY(queue_rotational, "rotational");
> > -QUEUE_RW_ENTRY(queue_iostats, "iostats");
> > -QUEUE_RW_ENTRY(queue_add_random, "add_random");
> > -QUEUE_RW_ENTRY(queue_stable_writes, "stable_writes");
> > +QUEUE_LIM_RW_ENTRY(queue_rotational, "rotational");
> > +QUEUE_LIM_RW_ENTRY(queue_iostats, "iostats");
> > +QUEUE_LIM_RW_ENTRY(queue_add_random, "add_random");
> > +QUEUE_LIM_RW_ENTRY(queue_stable_writes, "stable_writes");
> >  
> >  #ifdef CONFIG_BLK_WBT
> >  static ssize_t queue_var_store64(s64 *var, const char *page)
> > @@ -695,7 +676,7 @@ queue_attr_store(struct kobject *kobj, struct attribute *attr,
> >  	struct request_queue *q = disk->queue;
> >  	ssize_t res;
> >  
> > -	if (!entry->store)
> > +	if (!entry->store_limit && !entry->store)
> >  		return -EIO;
> >  
> >  	/*
> > @@ -706,11 +687,24 @@ queue_attr_store(struct kobject *kobj, struct attribute *attr,
> >  	if (entry->load_module)
> >  		entry->load_module(disk, page, length);
> >  
> > -	blk_mq_freeze_queue(q);
> >  	mutex_lock(&q->sysfs_lock);
> > -	res = entry->store(disk, page, length);
> > -	mutex_unlock(&q->sysfs_lock);
> > +	blk_mq_freeze_queue(q);
> 
> Order between freeze and ->sysfs_lock is changed, and it may cause new
> lockdep warning because we may freeze queue first before acquiring
> ->sysfs_lock in del_gendisk().
> 
> 
> thanks,
> Ming
---end quoted text---

