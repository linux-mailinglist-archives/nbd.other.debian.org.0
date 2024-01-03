Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF23822973
	for <lists+nbd@lfdr.de>; Wed,  3 Jan 2024 09:24:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CF83821013; Wed,  3 Jan 2024 08:24:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan  3 08:24:11 2024
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 72B4020F8D
	for <lists-other-nbd@bendel.debian.org>; Wed,  3 Jan 2024 08:07:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tcqh5B9atYWE for <lists-other-nbd@bendel.debian.org>;
	Wed,  3 Jan 2024 08:07:37 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 602 seconds by postgrey-1.36 at bendel; Wed, 03 Jan 2024 08:07:37 UTC
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 2DA5520F8B
	for <nbd@other.debian.org>; Wed,  3 Jan 2024 08:07:37 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id E3A7D68B05; Wed,  3 Jan 2024 08:57:29 +0100 (CET)
Date: Wed, 3 Jan 2024 08:57:29 +0100
From: Christoph Hellwig <hch@lst.de>
To: John Pittman <jpittman@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Coly Li <colyli@suse.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-um@lists.infradead.org,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/9] block: default the discard granularity to sector
 size
Message-ID: <20240103075729.GA485@lst.de>
References: <20231228075545.362768-1-hch@lst.de> <20231228075545.362768-4-hch@lst.de> <CA+RJvhwg3YXAzSk81nMGw=_3OMo6P=XcXBUFUAXSBcyXH6gkDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+RJvhwg3YXAzSk81nMGw=_3OMo6P=XcXBUFUAXSBcyXH6gkDg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <k4MnJShV3iJ.A._LB.rmRllB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2705
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240103075729.GA485@lst.de
Resent-Date: Wed,  3 Jan 2024 08:24:11 +0000 (UTC)

On Tue, Jan 02, 2024 at 05:11:19PM -0500, John Pittman wrote:
> Hi Christoph, is there a reason you used 512 instead of SECTOR_SIZE
> from include/linux/blk_types.h?  Thanks!

To match the logical_block_size/physical_block_size/io_min
assignments just below.

