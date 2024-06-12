Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E049056A7
	for <lists+nbd@lfdr.de>; Wed, 12 Jun 2024 17:18:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E9481207ED; Wed, 12 Jun 2024 15:18:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun 12 15:18:10 2024
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 31007207DF
	for <lists-other-nbd@bendel.debian.org>; Wed, 12 Jun 2024 15:00:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id e9EYJkVqsq3J for <lists-other-nbd@bendel.debian.org>;
	Wed, 12 Jun 2024 15:00:39 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1BCB3207DC
	for <nbd@other.debian.org>; Wed, 12 Jun 2024 15:00:39 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9E11668AFE; Wed, 12 Jun 2024 17:00:30 +0200 (CEST)
Date: Wed, 12 Jun 2024 17:00:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH 10/26] xen-blkfront: don't disable cache flushes when
 they fail
Message-ID: <20240612150030.GA29188@lst.de>
References: <20240611051929.513387-1-hch@lst.de> <20240611051929.513387-11-hch@lst.de> <ZmlVziizbaboaBSn@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZmlVziizbaboaBSn@macbook>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <1AjLXEEvqAF.A.rLkH.ywbamB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2988
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240612150030.GA29188@lst.de
Resent-Date: Wed, 12 Jun 2024 15:18:10 +0000 (UTC)

On Wed, Jun 12, 2024 at 10:01:18AM +0200, Roger Pau Monn� wrote:
> On Tue, Jun 11, 2024 at 07:19:10AM +0200, Christoph Hellwig wrote:
> > blkfront always had a robust negotiation protocol for detecting a write
> > cache.  Stop simply disabling cache flushes when they fail as that is
> > a grave error.
> 
> It's my understanding the current code attempts to cover up for the
> lack of guarantees the feature itself provides:

> So even when the feature is exposed, the backend might return
> EOPNOTSUPP for the flush/barrier operations.

How is this supposed to work?  I mean in the worst case we could
just immediately complete the flush requests in the driver, but
we're really lying to any upper layer.

> Such failure is tied on whether the underlying blkback storage
> supports REQ_OP_WRITE with REQ_PREFLUSH operation.  blkback will
> expose "feature-barrier" and/or "feature-flush-cache" without knowing
> whether the underlying backend supports those operations, hence the
> weird fallback in blkfront.

If we are just talking about the Linux blkback driver (I know there
probably are a few other implementations) it won't every do that.
I see it has code to do so, but the Linux block layer doesn't
allow the flush operation to randomly fail if it was previously
advertised.  Note that even blkfront conforms to this as it fixes
up the return value when it gets this notsupp error to ok.

> Overall blkback should ensure that REQ_PREFLUSH is supported before
> exposing "feature-barrier" or "feature-flush-cache", as then the
> exposed features would really match what the underlying backend
> supports (rather than the commands blkback knows about).

Yes.  The in-tree xen-blkback does that, but even without that the
Linux block layer actually makes sure flushes sent by upper layers
always succeed even when not supported.

