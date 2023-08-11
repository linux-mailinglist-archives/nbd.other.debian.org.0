Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3D2778FFA
	for <lists+nbd@lfdr.de>; Fri, 11 Aug 2023 14:57:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DF41B20616; Fri, 11 Aug 2023 12:57:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 11 12:57:11 2023
Old-Return-Path: <brauner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_HI autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4EF2C205D7
	for <lists-other-nbd@bendel.debian.org>; Fri, 11 Aug 2023 12:41:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id bOHhOzKurU1p for <lists-other-nbd@bendel.debian.org>;
	Fri, 11 Aug 2023 12:40:56 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 408342064B
	for <nbd@other.debian.org>; Fri, 11 Aug 2023 12:40:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DD96564B36;
	Fri, 11 Aug 2023 12:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7FAC433C7;
	Fri, 11 Aug 2023 12:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691757652;
	bh=zy6yguugoUgSRaMd817bUoOIpAK3qiNWAX7KHUkxXvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kqRC84LHdMiJo/qRRpOJUQXlSLc4kg2hhZDz1RNK5m4WfAI65m5IbSBi4KIau7nSO
	 99AgLCrH4Dna3zh1NWyzlg64B1OLVt6vajSXTShcNMx3qvc64Yv05aysP7VdSK4BuU
	 YleiIUg9pc6M/CLTf4Eof/tJfwGKqDsze4ENjpVg6Kwb6F11Oxoi+DgmaEn961rqpx
	 MJ16B7fDiGR1yVZbfRPL9iyknvANzAgZBEMmyd8BGBob7KD/hUkY2hwbOQf/fNWBEY
	 fR/hUKEkQp2NUmzi+q99Zs0UOa2LehixxwKiwLp0pVqTK13tiE88ngfv74bHQlQdcT
	 QTYlxaNLA4/3g==
Date: Fri, 11 Aug 2023 14:40:45 +0200
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
Subject: Re: [PATCH 04/17] btrfs: split btrfs_fs_devices.opened
Message-ID: <20230811-wildtier-fortbestand-f6ec45e09f4e@brauner>
References: <20230811100828.1897174-1-hch@lst.de>
 <20230811100828.1897174-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230811100828.1897174-5-hch@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Y0j1QyaHH9L.A.5SB.nAj1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2618
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230811-wildtier-fortbestand-f6ec45e09f4e@brauner
Resent-Date: Fri, 11 Aug 2023 12:57:11 +0000 (UTC)

On Fri, Aug 11, 2023 at 12:08:15PM +0200, Christoph Hellwig wrote:
> The btrfs_fs_devices.opened member mixes an in use counter for the
> fs_devices structure that prevents it from being garbage collected with
> a flag if the underlying devices were actually opened.  This not only
> makes the code hard to follow, but also prevents btrfs from switching
> to opening the block device only after super block creation.  Split it
> into an in_use counter and an is_open boolean flag instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

That looks like it will fix the issue we've seen with the first version.
So Acked-by: Christian Brauner <brauner@kernel.org>
but it'd be excellent to hear from btrfs maintainers.

