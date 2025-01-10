Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 72432A08CE0
	for <lists+nbd@lfdr.de>; Fri, 10 Jan 2025 10:51:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 58070205EA; Fri, 10 Jan 2025 09:51:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 10 09:51:10 2025
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8768020577
	for <lists-other-nbd@bendel.debian.org>; Fri, 10 Jan 2025 09:33:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.002 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mToDxB2G6atC for <lists-other-nbd@bendel.debian.org>;
	Fri, 10 Jan 2025 09:33:17 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B310220562
	for <nbd@other.debian.org>; Fri, 10 Jan 2025 09:33:17 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B95E868BFE; Fri, 10 Jan 2025 10:33:11 +0100 (CET)
Date: Fri, 10 Jan 2025 10:33:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: John Garry <john.g.garry@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>, Ming Lei <ming.lei@redhat.com>,
	Nilay Shroff <nilay@linux.ibm.com>, linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org, nbd@other.debian.org,
	linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: Re: [PATCH 06/11] block: fix queue freeze vs limits lock order in
 sysfs store methods
Message-ID: <20250110093311.GA9083@lst.de>
References: <20250109055810.1402918-1-hch@lst.de> <20250109055810.1402918-7-hch@lst.de> <8cfe7690-0101-42e7-ba97-6c6b717c4706@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8cfe7690-0101-42e7-ba97-6c6b717c4706@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <wB2TDuFePsJ.A.U7qG.O2OgnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3342
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250110093311.GA9083@lst.de
Resent-Date: Fri, 10 Jan 2025 09:51:10 +0000 (UTC)

On Thu, Jan 09, 2025 at 01:07:47PM +0000, John Garry wrote:
> Do you mean that the sysfs_lock could be removed in future? I would have 
> thought that queue limits lock could be used for the same thing, but I am 
> probably failing to see some lock nesting/ordering issues...

More or less.  Think about it: what does it even try to protect?

Readіng/writing sysfs files vs itself and file removal it serialized by
sysfs/kernfs internally.

Any information tweaked in sysfs usually also has other places that can
modify it.  So we'll need a lock independent of sysfs for that anyway.
A big part, buy by far all of that is covered by limits_lock.

Serializing creating/removing sysfs attribues is supposed to be
serialized using sysfs_dir_lock, although that needs a careful audit.

It's also used to serialize a few debugfs things, but we'll need to look
carefully for what exactly and switch that over to debugfs_mutex or
something new.

And then there's a bunch of misc cruft that also needs a careful look.

