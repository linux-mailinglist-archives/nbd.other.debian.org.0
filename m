Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D2759A03CB1
	for <lists+nbd@lfdr.de>; Tue,  7 Jan 2025 11:42:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 939CC20740; Tue,  7 Jan 2025 10:42:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  7 10:42:09 2025
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1858C20739
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jan 2025 10:25:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.539 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tQwCLcvv9wUe for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jan 2025 10:25:44 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 10767 seconds by postgrey-1.36 at bendel; Tue, 07 Jan 2025 10:25:44 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 8756C20738
	for <nbd@other.debian.org>; Tue,  7 Jan 2025 10:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736245539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g+kgv40Nv3jmk18aQH5jxbGFwIkI3jfpro4OOu8qIeE=;
	b=QwGzK0qcfSUl+FIR3c9wA4D+1ZgGhpqQnszaxcsUt/ToQmBUFmzHgXN6N0W7tSE00jbL2M
	VfdA4b3lOLMnN9TQ+xd6v9zq2UgLWsOQpEMbKS5IJT/kVUEG2Z82oQpHBT4CXziK1bxL36
	qpJJ3+Um7rDUpt72P6nGLyoT1HA/LjI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-580-w5dnKRt2PPm84kKWsCv9qg-1; Tue,
 07 Jan 2025 05:25:36 -0500
X-MC-Unique: w5dnKRt2PPm84kKWsCv9qg-1
X-Mimecast-MFC-AGG-ID: w5dnKRt2PPm84kKWsCv9qg
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A16BB19560A3;
	Tue,  7 Jan 2025 10:25:32 +0000 (UTC)
Received: from fedora (unknown [10.72.116.66])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 318F5195605F;
	Tue,  7 Jan 2025 10:25:25 +0000 (UTC)
Date: Tue, 7 Jan 2025 18:25:20 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>, linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org, nbd@other.debian.org,
	linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH 4/8] block: add a store_limit operations for sysfs entries
Message-ID: <Z30AsQq89_lcstNl@fedora>
References: <20250107063120.1011593-1-hch@lst.de>
 <20250107063120.1011593-5-hch@lst.de>
 <Z3zXANbFk6GBZg_z@fedora>
 <ae6b7727-64d6-4d9e-9bf5-951e38d8a768@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae6b7727-64d6-4d9e-9bf5-951e38d8a768@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vcxYgapFuU.A.NfPK.BUQfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3264
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Z30AsQq89_lcstNl@fedora
Resent-Date: Tue,  7 Jan 2025 10:42:09 +0000 (UTC)

On Tue, Jan 07, 2025 at 01:21:14PM +0530, Nilay Shroff wrote:
> 
> 
> On 1/7/25 12:55 PM, Ming Lei wrote:
> > On Tue, Jan 07, 2025 at 07:30:36AM +0100, Christoph Hellwig wrote:
> >> De-duplicate the code for updating queue limits by adding a store_limit
> >> method that allows having common code handle the actual queue limits
> >> update.
> >>
> >> Note that this is a pure refactoring patch and does not address the
> >> existing freeze vs limits lock order problem in the refactored code,
> >> which will be addressed next.
> >>
> >> Signed-off-by: Christoph Hellwig <hch@lst.de>

...

> > Order between freeze and ->sysfs_lock is changed, and it may cause new
> > lockdep warning because we may freeze queue first before acquiring
> > ->sysfs_lock in del_gendisk().
> > 
> On contrary, in elevator_disable() and elevator_switch() we acquire 
> ->sysfs_lock first before freezing the queue. I think this is a mess and 
> we need to fix ordering. We need to decide ordering rules. IMO, the 
> correct order should be to acquire ->sysfs_lock before freezing queue. 
> Likewise with this patch now we acquire ->limits_lock before freezing the 
> queue.

__blk_mq_update_nr_hw_queues() freezes queue before acquiring ->syfs_lock too.

So yes, it is a mess wrt. order between ->sysfs_lock and freezing queue.


Thanks,
Ming

