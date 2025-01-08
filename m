Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C56A3A0607E
	for <lists+nbd@lfdr.de>; Wed,  8 Jan 2025 16:45:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B2D00207AF; Wed,  8 Jan 2025 15:45:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan  8 15:45:21 2025
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CB8652078F
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Jan 2025 15:29:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.998 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id a5Ti92tH1PnW for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Jan 2025 15:29:14 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3012A20784
	for <nbd@other.debian.org>; Wed,  8 Jan 2025 15:29:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id F1EFA68BFE; Wed,  8 Jan 2025 16:29:08 +0100 (CET)
Date: Wed, 8 Jan 2025 16:29:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ming Lei <ming.lei@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>,
	Nilay Shroff <nilay@linux.ibm.com>, linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org, nbd@other.debian.org,
	linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH 05/10] block: fix queue freeze vs limits lock order in
 sysfs store methods
Message-ID: <20250108152908.GB24792@lst.de>
References: <20250108092520.1325324-1-hch@lst.de> <20250108092520.1325324-6-hch@lst.de> <Z35Vl6ob0zLH_Kh-@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z35Vl6ob0zLH_Kh-@fedora>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2V3Zy9S4aWN.A.NPhC.R2pfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3300
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250108152908.GB24792@lst.de
Resent-Date: Wed,  8 Jan 2025 15:45:21 +0000 (UTC)

On Wed, Jan 08, 2025 at 06:38:15PM +0800, Ming Lei wrote:
> Looks fine, but now ->store_limit() is called without holding
> ->sysfs_lock, maybe it should be documented.

Ok, I had this in my own commit log, but it got lost when I stole
Damien's much better one instead :)

I assume you're fine with just documenting it in the commit log?

