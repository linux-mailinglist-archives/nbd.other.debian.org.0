Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FB33D88C0
	for <lists+nbd@lfdr.de>; Wed, 28 Jul 2021 09:21:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C8E8D20787; Wed, 28 Jul 2021 07:21:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jul 28 07:21:16 2021
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=MURPHY_DRUGS_REL8 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 91492206D8
	for <lists-other-nbd@bendel.debian.org>; Wed, 28 Jul 2021 07:03:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tmw9pGTLW056 for <lists-other-nbd@bendel.debian.org>;
	Wed, 28 Jul 2021 07:03:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D26DF205B9
	for <nbd@other.debian.org>; Wed, 28 Jul 2021 07:03:15 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id C555868AFE; Wed, 28 Jul 2021 09:03:11 +0200 (CEST)
Date: Wed, 28 Jul 2021 09:03:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hou Tao <houtao1@huawei.com>
Cc: Christoph Hellwig <hch@lst.de>, Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH] nbd: do del_gendisk() asynchronously
Message-ID: <20210728070311.GB4815@lst.de>
References: <20210728044211.115787-1-houtao1@huawei.com> <20210728053915.GA3374@lst.de> <3b55c3e6-d286-9c64-46bf-3018929c7a54@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b55c3e6-d286-9c64-46bf-3018929c7a54@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <u1TKXgmZolP.A.t8C.sVQAhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1229
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210728070311.GB4815@lst.de
Resent-Date: Wed, 28 Jul 2021 07:21:16 +0000 (UTC)

On Wed, Jul 28, 2021 at 02:56:48PM +0800, Hou Tao wrote:
> Hi,
> 
> Thanks for your review.
> 
> Now I am not sure whether or not it is a better idea that doing synchronous or asynchronous del_gendisk()
> 
> according to NBD_CFLAG_DESTROY_ON_DISCONNECT, and will wait for some feedback from Josef.

The other option would be to add a variant of del_gendisk that does
expect the open_mutex to be held over the whole operation.  But I'd be
happy if we could avoid that.

