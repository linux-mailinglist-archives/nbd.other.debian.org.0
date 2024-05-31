Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FD18D5A5A
	for <lists+nbd@lfdr.de>; Fri, 31 May 2024 08:12:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A6F0420557; Fri, 31 May 2024 06:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 31 06:12:09 2024
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CC1C620533
	for <lists-other-nbd@bendel.debian.org>; Fri, 31 May 2024 05:55:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id P1dqt3Lj_d6g for <lists-other-nbd@bendel.debian.org>;
	Fri, 31 May 2024 05:55:02 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 383 seconds by postgrey-1.36 at bendel; Fri, 31 May 2024 05:55:01 UTC
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id ECEC52050F
	for <nbd@other.debian.org>; Fri, 31 May 2024 05:55:01 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id D3CD568BFE; Fri, 31 May 2024 07:54:56 +0200 (CEST)
Date: Fri, 31 May 2024 07:54:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ilya Dryomov <idryomov@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	Roger Pau Monn?? <roger.pau@citrix.com>,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	nbd@other.debian.org, ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 02/12] block: take io_opt and io_min into account for
 max_sectors
Message-ID: <20240531055456.GC17396@lst.de>
References: <20240529050507.1392041-1-hch@lst.de> <20240529050507.1392041-3-hch@lst.de> <CAOi1vP-F0FO4WTnrEt7FC-uu2C8NTbejvJQQGdZqT475c2G1jA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOi1vP-F0FO4WTnrEt7FC-uu2C8NTbejvJQQGdZqT475c2G1jA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <G1dao0iq_jL.A.IJlF.5oWWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2853
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240531055456.GC17396@lst.de
Resent-Date: Fri, 31 May 2024 06:12:09 +0000 (UTC)

On Thu, May 30, 2024 at 09:48:06PM +0200, Ilya Dryomov wrote:
> For rbd, this change effectively lowers max_sectors from 4M to 64K or
> less and that is definitely not desirable.  From previous interactions
> with users we want max_sectors to match max_hw_sectors -- this has come
> up a quite a few times over the years.  Some people just aren't aware
> of the soft cap and the fact that it's adjustable and get frustrated
> over the time poured into debugging their iostat numbers for workloads
> that can send object (set) size I/Os.
> 
> Looking at the git history, we lowered io_opt from objset_bytes to
> opts->alloc_size in commit [1], but I guess io_opt was lowered just
> along for the ride.  What that commit was concerned with is really
> discard_granularity and to a smaller extent io_min.
> 
> How much difference does io_opt make in the real world?  If what rbd
> does stands in the way of a tree-wide cleanup, I would much rather bump
> io_opt back to objset_bytes (i.e. what max_user_sectors is currently
> set to).

The only existing in-kernel usage is to set the readahead size.
Based on your comments I seems like we should revert io_opt to
objset to ->alloc_size in a prep patch?

