Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8F84F83FF
	for <lists+nbd@lfdr.de>; Thu,  7 Apr 2022 17:48:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A8B7D204E8; Thu,  7 Apr 2022 15:48:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr  7 15:48:31 2022
Old-Return-Path: <dsterba@suse.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 10DD6204E2
	for <lists-other-nbd@bendel.debian.org>; Thu,  7 Apr 2022 15:31:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.49 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id yJl1VPpE3YQM for <lists-other-nbd@bendel.debian.org>;
	Thu,  7 Apr 2022 15:31:01 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 57295204E3
	for <nbd@other.debian.org>; Thu,  7 Apr 2022 15:31:01 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 34AC9215FE;
	Thu,  7 Apr 2022 15:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1649345459;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VK52HHYwZ5mydc6ONgZ3weVRrNtBzOOpSIr7pOvXQbs=;
	b=WySqupirn7YZPnIWLV0GfVAqxihpYRle8XEAkyNVF3WBqDMBwi92kUG3G7Geq80fpEpqDG
	ac7ABA9wFAVhQVApAGDNJmbt/DMKsm4fE53BT+WEDXzbauuxegcpY8cjYEPD+30zCAK/0V
	/KcfIrKcEqFeLeaqKdylieoJrRuFiL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1649345459;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VK52HHYwZ5mydc6ONgZ3weVRrNtBzOOpSIr7pOvXQbs=;
	b=dPYi+hdX0iWuGGA7k7dxuydFXSe1+2WyOjXtxXeAslnPVSFPemFb/xuBKsBNhRAOcY4W1X
	dBEDeLvzeSqw+rCw==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
	by relay2.suse.de (Postfix) with ESMTP id 19364A3B83;
	Thu,  7 Apr 2022 15:30:59 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
	id A6C86DA80E; Thu,  7 Apr 2022 17:26:56 +0200 (CEST)
Date: Thu, 7 Apr 2022 17:26:56 +0200
From: David Sterba <dsterba@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, dm-devel@redhat.com,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com, linux-mm@kvack.org
Subject: Re: [PATCH 26/27] block: uncouple REQ_OP_SECURE_ERASE from
 REQ_OP_DISCARD
Message-ID: <20220407152656.GM15609@twin.jikos.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, dm-devel@redhat.com,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com, linux-mm@kvack.org
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-27-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406060516.409838-27-hch@lst.de>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Q2Qu-1-cm8I.A.xb.PfwTiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1913
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220407152656.GM15609@twin.jikos.cz
Resent-Date: Thu,  7 Apr 2022 15:48:31 +0000 (UTC)

On Wed, Apr 06, 2022 at 08:05:15AM +0200, Christoph Hellwig wrote:
> Secure erase is a very different operation from discard in that it is
> a data integrity operation vs hint.  Fully split the limits and helper
> infrastructure to make the separation more clear.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/blk-core.c                    |  2 +-
>  block/blk-lib.c                     | 64 ++++++++++++++++++++---------
>  block/blk-mq-debugfs.c              |  1 -
>  block/blk-settings.c                | 16 +++++++-
>  block/fops.c                        |  2 +-
>  block/ioctl.c                       | 43 +++++++++++++++----
>  drivers/block/drbd/drbd_receiver.c  |  5 ++-
>  drivers/block/rnbd/rnbd-clt.c       |  4 +-
>  drivers/block/rnbd/rnbd-srv-dev.h   |  2 +-
>  drivers/block/xen-blkback/blkback.c | 15 +++----
>  drivers/block/xen-blkback/xenbus.c  |  5 +--
>  drivers/block/xen-blkfront.c        |  5 ++-
>  drivers/md/bcache/alloc.c           |  2 +-
>  drivers/md/dm-table.c               |  8 ++--
>  drivers/md/dm-thin.c                |  4 +-
>  drivers/md/md.c                     |  2 +-
>  drivers/md/raid5-cache.c            |  6 +--
>  drivers/mmc/core/queue.c            |  2 +-
>  drivers/nvme/target/io-cmd-bdev.c   |  2 +-
>  drivers/target/target_core_file.c   |  2 +-
>  drivers/target/target_core_iblock.c |  2 +-

For

>  fs/btrfs/extent-tree.c              |  4 +-

Acked-by: David Sterba <dsterba@suse.com>

