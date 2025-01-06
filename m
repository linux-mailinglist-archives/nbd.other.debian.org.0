Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C84A0243D
	for <lists+nbd@lfdr.de>; Mon,  6 Jan 2025 12:24:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7F647206BF; Mon,  6 Jan 2025 11:24:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan  6 11:24:12 2025
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=4.0 tests=FOURLA,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0768D206F2
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Jan 2025 11:08:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.898 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7SUC9q4UTRNb for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Jan 2025 11:07:59 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9399C206DB
	for <nbd@other.debian.org>; Mon,  6 Jan 2025 11:07:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7D08D68C7B; Mon,  6 Jan 2025 11:57:32 +0100 (CET)
Date: Mon, 6 Jan 2025 11:57:32 +0100
From: Christoph Hellwig <hch@lst.de>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Ming Lei <ming.lei@redhat.com>, Nilay Shroff <nilay@linux.ibm.com>,
	linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
	nbd@other.debian.org, virtualization@lists.linux.dev,
	linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH 03/10] block: add a store_limit operations for sysfs
 entries
Message-ID: <20250106105732.GA21833@lst.de>
References: <20250106100645.850445-1-hch@lst.de> <20250106100645.850445-4-hch@lst.de> <a461bbbc-f251-4f44-89c7-f80f72e6e96d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a461bbbc-f251-4f44-89c7-f80f72e6e96d@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <34DR7ao4qCO.A.cPiG.c17enB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3226
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250106105732.GA21833@lst.de
Resent-Date: Mon,  6 Jan 2025 11:24:12 +0000 (UTC)

On Mon, Jan 06, 2025 at 07:46:19PM +0900, Damien Le Moal wrote:
> The freeze must NOT be done for the "if (entry->store_limit)" case. So this
> needs to go int the "else". Otherwise, you still have freeze the take limit
> lock order which can cause the ABBA deadlocks in SCSI sd.

That is fixed in the next patch.  This one is pure refactoring without
behavior change.

