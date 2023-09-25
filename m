Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DE17AD2E4
	for <lists+nbd@lfdr.de>; Mon, 25 Sep 2023 10:12:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 10E0E2068D; Mon, 25 Sep 2023 08:12:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 25 08:12:11 2023
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DAF912060F
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 Sep 2023 07:56:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YUEG6P7mw7w6 for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 Sep 2023 07:56:22 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
X-Greylist: delayed 459 seconds by postgrey-1.36 at bendel; Mon, 25 Sep 2023 07:56:22 UTC
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 11784205F5
	for <nbd@other.debian.org>; Mon, 25 Sep 2023 07:56:22 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id F173068D05; Mon, 25 Sep 2023 09:48:38 +0200 (CEST)
Date: Mon, 25 Sep 2023 09:48:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	"Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-s390@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: Re: [PATCH 07/17] nbd: call blk_mark_disk_dead in
 nbd_clear_sock_ioctl
Message-ID: <20230925074838.GA28522@lst.de>
References: <20230811100828.1897174-1-hch@lst.de> <20230811100828.1897174-8-hch@lst.de> <79af9398-167f-440e-a493-390dc4ccbd85@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79af9398-167f-440e-a493-390dc4ccbd85@sifive.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <o8kxP0J-2ZG.A.aBH.bDUElB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2641
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230925074838.GA28522@lst.de
Resent-Date: Mon, 25 Sep 2023 08:12:12 +0000 (UTC)

On Wed, Sep 20, 2023 at 03:41:11PM -0500, Samuel Holland wrote:
> [   14.619101] Buffer I/O error on dev nbd0, logical block 0, async page read
> 
> [   14.630490]  nbd0: unable to read partition table
> 
> I wonder if disk_force_media_change() is the right thing to call here instead.

So what are the semantics of clearing the socket?

The <= 6.5 behavior of invalidating fs caches, but not actually marking
the fs shutdown is pretty broken, especially if this expects to resurrect
the device and thus the file system later on.

