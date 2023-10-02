Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9C07B4B8C
	for <lists+nbd@lfdr.de>; Mon,  2 Oct 2023 08:39:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9410E206CD; Mon,  2 Oct 2023 06:39:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct  2 06:39:11 2023
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F3108209E4
	for <lists-other-nbd@bendel.debian.org>; Mon,  2 Oct 2023 06:22:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id MjhvFtdhDVcs for <lists-other-nbd@bendel.debian.org>;
	Mon,  2 Oct 2023 06:22:04 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id BA3D8209CD
	for <nbd@other.debian.org>; Mon,  2 Oct 2023 06:22:04 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 91BE168D07; Mon,  2 Oct 2023 08:21:59 +0200 (CEST)
Date: Mon, 2 Oct 2023 08:21:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: Wouter Verhelst <w@uter.be>
Cc: Christoph Hellwig <hch@lst.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
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
Message-ID: <20231002062159.GB1140@lst.de>
References: <20230811100828.1897174-1-hch@lst.de> <20230811100828.1897174-8-hch@lst.de> <79af9398-167f-440e-a493-390dc4ccbd85@sifive.com> <20230925074838.GA28522@lst.de> <ZRmoHaSojk6ra5OU@pc220518.home.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRmoHaSojk6ra5OU@pc220518.home.grep.be>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0H_LDO9v8UB.A.-BC.PWmGlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2655
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20231002062159.GB1140@lst.de
Resent-Date: Mon,  2 Oct 2023 06:39:11 +0000 (UTC)

On Sun, Oct 01, 2023 at 07:10:53PM +0200, Wouter Verhelst wrote:
> > So what are the semantics of clearing the socket?
> > 
> > The <= 6.5 behavior of invalidating fs caches, but not actually marking
> > the fs shutdown is pretty broken, especially if this expects to resurrect
> > the device and thus the file system later on.
> 
> nbd-client -d calls
> 
> ioctl(nbd, NBD_DISCONNECT);
> ioctl(nbd, NBD_CLEAR_SOCK);
> 
> (error handling removed for clarity)
> 
> where "nbd" is the file handle to the nbd device. This expects that the
> device is cleared and that then the device can be reused for a different
> connection, much like "losetup -d". Expecting that the next connection
> would talk to the same file system is wrong.

So a fs shutdown seems like a the right thing.  So I'm a little confused
on what actualy broke here.

