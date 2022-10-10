Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FDD5F9B98
	for <lists+nbd@lfdr.de>; Mon, 10 Oct 2022 11:06:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 912512041B; Mon, 10 Oct 2022 09:06:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 10 09:06:15 2022
Old-Return-Path: <BATV+04e4e05a438ac94c6a9b+6987+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9F29A20553
	for <lists-other-nbd@bendel.debian.org>; Mon, 10 Oct 2022 08:50:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8R2wOlVldS7Q for <lists-other-nbd@bendel.debian.org>;
	Mon, 10 Oct 2022 08:50:27 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 3059 seconds by postgrey-1.36 at bendel; Mon, 10 Oct 2022 08:50:27 UTC
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D87C020658
	for <nbd@other.debian.org>; Mon, 10 Oct 2022 08:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sWolSNkLX1ZPnLQhfmowne8piiQT5rQ6uM09AjXa5Dc=; b=aJIBlsb0nSpWjrle4oZywMion1
	d0M1TLezw/OcG2P0MgPxI6aB4/HTO9AxzYy4TBBhT7iUcr9rtBjX/6QDGEY3NVp14bJ4/jDCFWOLR
	AQbNGi/LTMEXH3wmTjrkT5Y5SGv/Ib9V7XughQZRpp+pgf73tDFKD5qBO9fZNJp7D5XdpZAn047TZ
	EiJJmMepreW3fKePOipspGiOfrSt007DayqpG0JoDUJoeTic1aqPtkls/MHiWNJVicPA3qcsuILrN
	M+txLRN4vmfGm/5lZL3wxlLajTmeHmNW15SUYd9J3te7dVhIl6aHu6Zoczw8l4kTSbppDR+vGd2rO
	RUq4Vc7g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohngj-00HSJR-TP; Mon, 10 Oct 2022 07:59:01 +0000
Date: Mon, 10 Oct 2022 00:59:01 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Chaitanya Kulkarni <kch@nvidia.com>
Cc: ogeert@linux-m68k.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linux-mtd@lists.infradead.org, axboe@kernel.dk,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, efremov@linux.com,
	josef@toxicpanda.com, tim@cyberelk.net, haris.iqbal@ionos.com,
	jinpu.wang@ionos.com, richard@nod.at, miquel.raynal@bootlin.com,
	vigneshr@ti.com, mcgrof@kernel.org, hare@suse.de,
	damien.lemoal@opensource.wdc.com, johannes.thumshirn@wdc.com,
	bvanassche@acm.org, ming.lei@redhat.com, vincent.fu@samsung.com,
	shinichiro.kawasaki@wdc.com
Subject: Re: [RFC PATCH 01/18] block: add and use init disk helper
Message-ID: <Y0PQxdzmMzAAW0KF@infradead.org>
References: <20221005050027.39591-1-kch@nvidia.com>
 <20221005050027.39591-2-kch@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005050027.39591-2-kch@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <g05zUhbBhTD.A.UMB.HC-QjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2237
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Y0PQxdzmMzAAW0KF@infradead.org
Resent-Date: Mon, 10 Oct 2022 09:06:15 +0000 (UTC)

On Tue, Oct 04, 2022 at 10:00:10PM -0700, Chaitanya Kulkarni wrote:
> +void init_disk(struct gendisk *disk, int major, int first_minor,
> +		int minors, sector_t sectors, void *private_data,
> +		const struct block_device_operations *fops)
> +{
> +	disk->major = major;
> +	disk->first_minor = first_minor;
> +	disk->minors = minors;
> +	set_capacity(disk, sectors);
> +	disk->private_data = private_data;
> +	disk->fops = fops;

I don't like this at all.  For one major/first_minor/minors are
optional and discouraged for new drivers.  Setting the capacity is
a different thing and is done by helpers also used for revalidation
in many drivers.

It might make sense to pass the fops (and maybe private_data) to
blk_mq_alloc_disk / blk_alloc_disk, but even then I'm not quite
sure it is worth the churn.

