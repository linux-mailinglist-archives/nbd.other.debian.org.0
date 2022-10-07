Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A722C5F7EA5
	for <lists+nbd@lfdr.de>; Fri,  7 Oct 2022 22:24:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2997C205C2; Fri,  7 Oct 2022 20:24:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Oct  7 20:24:13 2022
Old-Return-Path: <mcgrof@infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 71EA720672
	for <lists-other-nbd@bendel.debian.org>; Fri,  7 Oct 2022 20:06:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.13 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 08wXdKvIfJC1 for <lists-other-nbd@bendel.debian.org>;
	Fri,  7 Oct 2022 20:06:16 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 5929 seconds by postgrey-1.36 at bendel; Fri, 07 Oct 2022 20:06:16 UTC
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 45A3320671
	for <nbd@other.debian.org>; Fri,  7 Oct 2022 20:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IudIrA3q3WpPWuZzZUKujefONUnAfceTWjlveYaPvio=; b=y3TnHRe5LU2pfTWpYrKhFoSYbh
	jboFN1RMi5CjIniehZGNTOJpkF2sr617jJ4vb6Ib6lSQpyC0ek2+SlWngTW1ubM41ZOvqG9t87RGe
	LZXDSjCQvYJpbTl+VRQpi8LkTLFVyXqr+kFALUeMkSNjyvXp3VTfiu6Hin9S6c12kBhwJdLbNbYn4
	4szHif4ftpjkLWks7RWt2NtkOf4pQQWV+FmMEugetSNijqYdLE8QwTu09Ycl6RznABM1+qPym5ADr
	Od764RzqJQFgxId6v9nZqSWYrZBx/EX1oe/ZXXPNJJb8O2jtIyGdk61SSE07/zRW76XLArhkeRZ+1
	ZC4+w/vg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogs33-00A41Z-Ot; Fri, 07 Oct 2022 18:26:13 +0000
Date: Fri, 7 Oct 2022 11:26:13 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, axboe@kernel.dk, efremov@linux.com,
	josef@toxicpanda.com, idryomov@gmail.com,
	dongsheng.yang@easystack.cn, haris.iqbal@ionos.com,
	jinpu.wang@ionos.com, mst@redhat.com, jasowang@redhat.com,
	pbonzini@redhat.com, stefanha@redhat.com, ohad@wizery.com,
	andersson@kernel.org, baolin.wang@linux.alibaba.com,
	ulf.hansson@linaro.org, richard@nod.at, miquel.raynal@bootlin.com,
	vigneshr@ti.com, marcan@marcan.st, sven@svenpeter.dev,
	alyssa@rosenzweig.io, kbusch@kernel.org, hch@lst.de,
	sagi@grimberg.me, sth@linux.ibm.com, hoeppner@linux.ibm.com,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, hare@suse.de, bhelgaas@google.com,
	john.garry@huawei.com, christophe.jaillet@wanadoo.fr,
	vaibhavgupta40@gmail.com, wsa+renesas@sang-engineering.com,
	damien.lemoal@opensource.wdc.com, johannes.thumshirn@wdc.com,
	bvanassche@acm.org, ming.lei@redhat.com,
	shinichiro.kawasaki@wdc.com, vincent.fu@samsung.com,
	christoph.boehmwalder@linbit.com, joel@jms.id.au,
	vincent.whitchurch@axis.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, asahi@lists.linux.dev
Subject: Re: [RFC PATCH 00/21] block: add and use init tagset helper
Message-ID: <Y0BvRaVO0iUVmHgB@bombadil.infradead.org>
References: <20221005032257.80681-1-kch@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005032257.80681-1-kch@nvidia.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <eCgqma83PcC.A.0OH.trIQjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2235
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Y0BvRaVO0iUVmHgB@bombadil.infradead.org
Resent-Date: Fri,  7 Oct 2022 20:24:13 +0000 (UTC)

On Tue, Oct 04, 2022 at 08:22:36PM -0700, Chaitanya Kulkarni wrote:
> Hi,
> 
> Add and use the helper to initialize the common fields of the tag_set
> such as blk_mq_ops, number of h/w queues, queue depth, command size,
> numa_node, timeout, BLK_MQ_F_XXX flags, driver data. This initialization
> is spread all over the block drivers. This avoids repetation of
> inialization code of the tag set in current block drivers and any future
> ones.
> 
> P.S. I'm aware of the EXPORT_SYMBOL_GPL() checkpatch warn just to make
> get some feedback to so I can remove the RFC tag.
> 

*If* there were commonalities at init and these could be broken up into
common groups, each having their own set of calls, then we simplify and
can abstract these. I say this without doing a complete review of the
removals, but if there really isn't much of commonalities I tend to
agree with Bart that open coding this is better.

  Luis

