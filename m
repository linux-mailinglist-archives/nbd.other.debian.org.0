Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AFA3F2A00
	for <lists+nbd@lfdr.de>; Fri, 20 Aug 2021 12:18:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 154E8207BC; Fri, 20 Aug 2021 10:18:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 20 10:18:32 2021
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=none autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E05B320923
	for <lists-other-nbd@bendel.debian.org>; Fri, 20 Aug 2021 10:02:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6jQ89apUBGne for <lists-other-nbd@bendel.debian.org>;
	Fri, 20 Aug 2021 10:02:06 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3898C2093D
	for <nbd@other.debian.org>; Fri, 20 Aug 2021 10:02:06 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 446A26736F; Fri, 20 Aug 2021 12:02:03 +0200 (CEST)
Date: Fri, 20 Aug 2021 12:02:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hillf Danton <hdanton@sina.com>
Cc: Sven Schnelle <svens@linux.ibm.com>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: WARNING: possible circular locking dependency detected in nbd
Message-ID: <20210820100202.GB9872@lst.de>
References: <yt9dsfz7xm6e.fsf@linux.ibm.com> <20210819072938.3839-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819072938.3839-1-hdanton@sina.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DmxN0QDOJiI.A.A3F.4F4HhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1306
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210820100202.GB9872@lst.de
Resent-Date: Fri, 20 Aug 2021 10:18:32 +0000 (UTC)

On Thu, Aug 19, 2021 at 03:29:38PM +0800, Hillf Danton wrote:
> On Wed, 18 Aug 2021 09:10:49 +0200 Sven Schnelle wrote:
> > Hi,
> > 
> > i'm seeing the lockdep splat below in CI. I think this is because
> 
> Thanks for reporting it.
> 
> > nbd_open is called with disk->open_mutex held, and acquires
> > nbd_index_mutex. However, nbd_put() first takes the nbd_index_lock,
> > and calls del_gendisk, which locks disk->open_mutex, so the order is
> > reversed.
> 
> Right. See diff attached.

This is already fixed in linux-next.

