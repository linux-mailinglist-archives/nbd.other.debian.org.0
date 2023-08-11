Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C42EC779006
	for <lists+nbd@lfdr.de>; Fri, 11 Aug 2023 15:00:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 929632063E; Fri, 11 Aug 2023 13:00:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 11 13:00:26 2023
Old-Return-Path: <brauner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0637E20609
	for <lists-other-nbd@bendel.debian.org>; Fri, 11 Aug 2023 12:45:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.481 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id M1CNYXTdZOg0 for <lists-other-nbd@bendel.debian.org>;
	Fri, 11 Aug 2023 12:45:00 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id AEC2D20602
	for <nbd@other.debian.org>; Fri, 11 Aug 2023 12:45:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 71A3964B36;
	Fri, 11 Aug 2023 12:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F6CC433C8;
	Fri, 11 Aug 2023 12:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691757896;
	bh=kOskk37y8nZjyvPH/Qy4aWj3xKWEsFGaCCRYUsKR8BI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tgpozOqGErBs+RHwvCOez2p6Wj0ytNS+EC+N+9BSLV60ICVcCocDxl0z+wJPAvD0X
	 7XmgSNieHweTiVgqDM9iZbdpBMexB9nColFt3UOQJediExKvVTtFzpmI0RBAuHEo3z
	 KJB5gOYHcUYuwQDeI9hBTOkee+ItGCYPBYO7XBAOScSLaRYwwWpGxbNChdAb7iwddY
	 f9iRHRC02rm98JA4ckHaIdKgKspwFFd/2mKsLBUZcy2fTt1JB/ilRJQAiQFnmedc4V
	 M/nsoNhkzuVCxhlK5fWhbPubKKc1KrMrnbF9rP7I5mgvUf+QrP8KklG6WMZdc9NdUd
	 amqoqor2FXzGA==
Date: Fri, 11 Aug 2023 14:44:50 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	"Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-s390@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 05/17] btrfs: open block devices after superblock creation
Message-ID: <20230811-wildpark-bronzen-5e30a56de1a1@brauner>
References: <20230811100828.1897174-1-hch@lst.de>
 <20230811100828.1897174-6-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230811100828.1897174-6-hch@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <72m43-b6a0H.A.aFD.qDj1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2619
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230811-wildpark-bronzen-5e30a56de1a1@brauner
Resent-Date: Fri, 11 Aug 2023 13:00:26 +0000 (UTC)

On Fri, Aug 11, 2023 at 12:08:16PM +0200, Christoph Hellwig wrote:
> Currently btrfs_mount_root opens the block devices before committing to
> allocating a super block. That creates problems for restricting the
> number of writers to a device, and also leads to a unusual and not very
> helpful holder (the fs_type).
> 
> Reorganize the code to first check whether the superblock for a
> particular fsid does already exist and open the block devices only if it
> doesn't, mirroring the recent changes to the VFS mount helpers.  To do
> this the increment of the in_use counter moves out of btrfs_open_devices
> and into the only caller in btrfs_mount_root so that it happens before
> dropping uuid_mutex around the call to sget.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good to me,
Acked-by: Christian Brauner <brauner@kernel.org>

And ofc, would be great to get btrfs reviews.

