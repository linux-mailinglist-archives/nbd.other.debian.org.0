Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 002554FC398
	for <lists+nbd@lfdr.de>; Mon, 11 Apr 2022 19:42:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D5D79203C7; Mon, 11 Apr 2022 17:42:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 11 17:42:09 2022
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
	by bendel.debian.org (Postfix) with ESMTP id C66F8203CE
	for <lists-other-nbd@bendel.debian.org>; Mon, 11 Apr 2022 17:26:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.49 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id c7WI6gGO1Cnw for <lists-other-nbd@bendel.debian.org>;
	Mon, 11 Apr 2022 17:26:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0C18E203D2
	for <nbd@other.debian.org>; Mon, 11 Apr 2022 17:26:25 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 80BF421606;
	Mon, 11 Apr 2022 17:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1649697983;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ojOMmoWG3Vi82iwkKmDthce/DTUxrqsrVMcEPPdM3So=;
	b=QZwWZVQwC0bnchneRkqJ/+jzsU6T9BsE/QwjE1iflJ8e+QPH7qzL+AxcI+atiGlV8qm9Lo
	u8oIaWSdY7hbFlYvzT8ENcrgX9LIGNQj4Ik1HCmhtpjbfJ75vgExpzBPpp974aNYAtu6v8
	bf5VKoGfQqIUb3Ou/OOGio4KxiUFZwg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1649697983;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ojOMmoWG3Vi82iwkKmDthce/DTUxrqsrVMcEPPdM3So=;
	b=98et+OqtZl3DiPU61ep6rcrI2VbwKFWZL1iuQ8dNt7YkOb55uCdVju/GMJmDyvRi7cAHwR
	HPLi3jycKdDWeJCw==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
	by relay2.suse.de (Postfix) with ESMTP id 1C7B9A3B83;
	Mon, 11 Apr 2022 17:26:23 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
	id 7FF53DA7F7; Mon, 11 Apr 2022 19:22:18 +0200 (CEST)
Date: Mon, 11 Apr 2022 19:22:18 +0200
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
	ocfs2-devel@oss.oracle.com, linux-mm@kvack.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: Re: [PATCH 08/27] btrfs: use bdev_max_active_zones instead of open
 coding it
Message-ID: <20220411172218.GT15609@twin.jikos.cz>
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
	ocfs2-devel@oss.oracle.com, linux-mm@kvack.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
References: <20220409045043.23593-1-hch@lst.de>
 <20220409045043.23593-9-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220409045043.23593-9-hch@lst.de>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <kAG8lmdcQ9E.A.ZdE.xhGViB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1968
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220411172218.GT15609@twin.jikos.cz
Resent-Date: Mon, 11 Apr 2022 17:42:09 +0000 (UTC)

On Sat, Apr 09, 2022 at 06:50:24AM +0200, Christoph Hellwig wrote:
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Acked-by: David Sterba <dsterba@suse.com>

