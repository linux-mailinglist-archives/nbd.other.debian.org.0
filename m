Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F34A4E67E3
	for <lists+nbd@lfdr.de>; Thu, 24 Mar 2022 18:36:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 30C1A20364; Thu, 24 Mar 2022 17:36:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 24 17:36:10 2022
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=MURPHY_DRUGS_REL8,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A2DD4202ED
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Mar 2022 17:19:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QBWTO8xVWdHP for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Mar 2022 17:19:48 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 475 seconds by postgrey-1.36 at bendel; Thu, 24 Mar 2022 17:19:48 UTC
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E5A8F2023E
	for <nbd@other.debian.org>; Thu, 24 Mar 2022 17:19:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B71D068B05; Thu, 24 Mar 2022 18:11:48 +0100 (CET)
Date: Thu, 24 Mar 2022 18:11:48 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH 01/13] nbd: use the correct block_device in nbd_ioctl
Message-ID: <20220324171148.GA28007@lst.de>
References: <20220324075119.1556334-1-hch@lst.de> <20220324075119.1556334-2-hch@lst.de> <20220324122041.itc55zladc5sax5p@quack3.lan> <20220324132322.2t3y4evcxunlpvzm@quack3.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324132322.2t3y4evcxunlpvzm@quack3.lan>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GeNkmuLFqO.A.ABH.KwKPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1775
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220324171148.GA28007@lst.de
Resent-Date: Thu, 24 Mar 2022 17:36:10 +0000 (UTC)

On Thu, Mar 24, 2022 at 02:23:22PM +0100, Jan Kara wrote:
> Should't we call __invalidate_device() for the partition bdev here? Because
> if the NBD device has partitions, filesystem will be mounted on this
> partition and we want to invalidate it. Similarly the partition buffer
> cache is different from the buffer cache of the whole device and we should
> invalidate the partition one. In fact in cases like this I think we need
> to invalidate all the partitions and filesystems that are there on this
> disk so neither the old, nor the new code looks quite correct to me. Am I
> missing something?

Well, that assumes just one partition is used, which kinda defeats the
purpose of partitions.  I can exclude the __invalidate_device to not
change from one kind of broken to another, but I suspect the real
question is why we have this __invalidate_device call at all.

