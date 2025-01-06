Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 237C8A02B9D
	for <lists+nbd@lfdr.de>; Mon,  6 Jan 2025 16:45:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0B027206C8; Mon,  6 Jan 2025 15:45:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan  6 15:45:29 2025
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=4.0 tests=LONGWORD,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BAEF92067F
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Jan 2025 15:27:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.002 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LONGWORD=2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uoNL_hS3lSWz for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Jan 2025 15:27:53 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0F64E20676
	for <nbd@other.debian.org>; Mon,  6 Jan 2025 15:27:52 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B42BE68C7B; Mon,  6 Jan 2025 16:27:48 +0100 (CET)
Date: Mon, 6 Jan 2025 16:27:48 +0100
From: Christoph Hellwig <hch@lst.de>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Ming Lei <ming.lei@redhat.com>, Nilay Shroff <nilay@linux.ibm.com>,
	linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
	nbd@other.debian.org, virtualization@lists.linux.dev,
	linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH 06/10] virtio_blk: use
 queue_limits_commit_update_frozen in cache_type_store
Message-ID: <20250106152748.GB27431@lst.de>
References: <20250106100645.850445-1-hch@lst.de> <20250106100645.850445-7-hch@lst.de> <07353499-b62d-488a-9575-12de5d9b6f2e@kernel.org> <20250106105957.GC21833@lst.de> <3cf61c5f-b53b-43b6-90de-e42272f74e3f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cf61c5f-b53b-43b6-90de-e42272f74e3f@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <wBE_q9ry6tH.A._W7J.Zq_enB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3234
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250106152748.GB27431@lst.de
Resent-Date: Mon,  6 Jan 2025 15:45:30 +0000 (UTC)

On Mon, Jan 06, 2025 at 10:09:16PM +0900, Damien Le Moal wrote:
> Sounds good to me, but let's be consistent then: do not remove the
> freeze/unfreeze from virtio_blk in patch 2 and do it here in this patch.
> Otherwise, patch 2 *does* change the behavior of virtio_blk, introducing a bug
> (missing freeze around commit update).

Yeah, I'll fix it up.  As mentioned in the cover letter I just brushed
this up just enough to be presentable for now.

