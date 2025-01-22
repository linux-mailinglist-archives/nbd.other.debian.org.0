Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E4DA18C53
	for <lists+nbd@lfdr.de>; Wed, 22 Jan 2025 07:51:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C736B20824; Wed, 22 Jan 2025 06:51:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan 22 06:51:08 2025
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8537420A4C
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Jan 2025 06:33:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.998 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3wICChCRBaZd for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Jan 2025 06:32:56 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C8C1C20A05
	for <nbd@other.debian.org>; Wed, 22 Jan 2025 06:32:56 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5197C68D05; Wed, 22 Jan 2025 07:32:51 +0100 (CET)
Date: Wed, 22 Jan 2025 07:32:51 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ming Lei <ming.lei@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	ceph-devel@vger.kernel.org, virtualization@lists.linux.dev,
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH 1/2] loop: force GFP_NOIO for underlying file systems
 allocations
Message-ID: <20250122063251.GA31207@lst.de>
References: <20250117074442.256705-1-hch@lst.de> <20250117074442.256705-2-hch@lst.de> <Z4pFgIqB50gz-ODi@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4pFgIqB50gz-ODi@fedora>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4xV4_EfrwTH.A.P-TN.cVJknB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3360
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250122063251.GA31207@lst.de
Resent-Date: Wed, 22 Jan 2025 06:51:08 +0000 (UTC)

On Fri, Jan 17, 2025 at 07:56:48PM +0800, Ming Lei wrote:
> If we call memalloc_noio_save() here, setting PF_MEMALLOC_NOIO can be removed
> from loop_process_work().

Nah, we can skip this patch as the explicit PF_MEMALLOC_NOIO does
everything that is needed.

