Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id AC52225403F
	for <lists+nbd@lfdr.de>; Thu, 27 Aug 2020 10:06:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 710A920263; Thu, 27 Aug 2020 08:06:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 27 08:06:09 2020
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C7CEE20243
	for <lists-other-nbd@bendel.debian.org>; Thu, 27 Aug 2020 07:48:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id RwPQo3CDQSeH for <lists-other-nbd@bendel.debian.org>;
	Thu, 27 Aug 2020 07:48:04 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0690320241
	for <nbd@other.debian.org>; Thu, 27 Aug 2020 07:48:03 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id EC6DB68C65; Thu, 27 Aug 2020 09:47:58 +0200 (CEST)
Date: Thu, 27 Aug 2020 09:47:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>, Josef Bacik <josef@toxicpanda.com>,
	Xianting Tian <xianting_tian@126.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>, linux-kernel@vger.kernel.org,
	nbd@other.debian.org, linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: Re: fix block device size update serialization v2
Message-ID: <20200827074758.GA8009@lst.de>
References: <20200823091043.2600261-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823091043.2600261-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vkv6mZEMqnK.A.x9H.xl2RfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/958
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200827074758.GA8009@lst.de
Resent-Date: Thu, 27 Aug 2020 08:06:09 +0000 (UTC)

Jens, can you consider this for 5.9?  It reliably fixes the reported
hangs with nvme hotremoval that we've had for a few releases.

On Sun, Aug 23, 2020 at 11:10:40AM +0200, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series fixes how we update i_size for the block device inodes (and
> thus the block device).  Different helpers use two different locks
> (bd_mutex and i_rwsem) to protect the update, and it appears device
> mapper uses yet another internal lock.  A lot of the drivers do the
> update handcrafted in often crufty ways.  And in addition to that mess
> it turns out that the "main" lock, bd_mutex is pretty dead lock prone
> vs other spots in the block layer that acquire it during revalidation
> operations, as reported by Xianting.
> 
> Fix all that by adding a dedicated spinlock just for the size updates.
> 
> Changes since v1:
>  - don't call __invalidate_device under the new spinlock
>  - don't call into the file system code from the nvme removal code
---end quoted text---

