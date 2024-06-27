Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D24E191A37C
	for <lists+nbd@lfdr.de>; Thu, 27 Jun 2024 12:06:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9DFBF20763; Thu, 27 Jun 2024 10:06:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 27 10:06:11 2024
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9DBBB20748
	for <lists-other-nbd@bendel.debian.org>; Thu, 27 Jun 2024 09:50:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Mgb4e3ZrFFXV for <lists-other-nbd@bendel.debian.org>;
	Thu, 27 Jun 2024 09:49:57 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C420120744
	for <nbd@other.debian.org>; Thu, 27 Jun 2024 09:49:57 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4527768BEB; Thu, 27 Jun 2024 11:49:50 +0200 (CEST)
Date: Thu, 27 Jun 2024 11:49:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>, Ming Lei <ming.lei@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
Message-ID: <20240627094950.GA30655@lst.de>
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de> <89164197-7218-4f24-bf24-0e67a1882c78@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89164197-7218-4f24-bf24-0e67a1882c78@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <co4B1CO29iM.A.TCoB.TmTfmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3089
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240627094950.GA30655@lst.de
Resent-Date: Thu, 27 Jun 2024 10:06:11 +0000 (UTC)

On Thu, Jun 27, 2024 at 10:43:24AM +0100, Jon Hunter wrote:
> We have just noticed that since Linux v6.9 was released, that if we
> build the kernel with 64kB MMU pages, then we see the following WARNING
> and probe failure ...

The old code upgraded the limits to the PAGE_SIZE for this case after
issunig a warning.  Your driver probably incorrectly advertised the
lower max_segment_size.  Try setting it to 64k.  I would have sent you
a patch for that, but I can't see what mmc host driver you are using.

