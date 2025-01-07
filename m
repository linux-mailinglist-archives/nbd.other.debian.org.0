Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 514D5A03ADA
	for <lists+nbd@lfdr.de>; Tue,  7 Jan 2025 10:15:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3D95520712; Tue,  7 Jan 2025 09:15:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  7 09:15:21 2025
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C969D20711
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jan 2025 08:58:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.998 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fBaG5cppUv0I for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jan 2025 08:58:31 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3D7DE20701
	for <nbd@other.debian.org>; Tue,  7 Jan 2025 08:58:31 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id E40C968AFE; Tue,  7 Jan 2025 09:58:25 +0100 (CET)
Date: Tue, 7 Jan 2025 09:58:25 +0100
From: Christoph Hellwig <hch@lst.de>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
	nbd@other.debian.org, linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH 6/8] nvme: fix queue freeze vs limits lock order
Message-ID: <20250107085825.GA16827@lst.de>
References: <20250107063120.1011593-1-hch@lst.de> <20250107063120.1011593-7-hch@lst.de> <96c48ba0-3db5-4504-a456-e57440aa1b56@linux.ibm.com> <20250107082224.GB15960@lst.de> <263963d9-ac40-4f87-b38a-edb4202d294c@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <263963d9-ac40-4f87-b38a-edb4202d294c@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Ya_GziYHUaM.A.ufGJ.pCPfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3255
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250107085825.GA16827@lst.de
Resent-Date: Tue,  7 Jan 2025 09:15:21 +0000 (UTC)

On Tue, Jan 07, 2025 at 02:15:05PM +0530, Nilay Shroff wrote:
> The nvme_set_ctrl_limits() sets certain queue limits which are 
> also used during IO processing. For instance, ->max_segment_size
> is used while submitting bio.

nvme_set_ctrl_limits only sets them in the on-stack queue_limits
structure, which is local to the calling thread.

