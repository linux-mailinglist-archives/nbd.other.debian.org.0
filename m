Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 522A53F585F
	for <lists+nbd@lfdr.de>; Tue, 24 Aug 2021 08:42:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C06732062A; Tue, 24 Aug 2021 06:42:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug 24 06:42:09 2021
Old-Return-Path: <BATV+f96701cc9b95d8800a83+6575+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6F46720606
	for <lists-other-nbd@bendel.debian.org>; Tue, 24 Aug 2021 06:26:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id GDVBiUAKm5bR for <lists-other-nbd@bendel.debian.org>;
	Tue, 24 Aug 2021 06:26:00 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 60C5C205E9
	for <nbd@other.debian.org>; Tue, 24 Aug 2021 06:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NKFJoeYTqWpvwgOnvXGlWBRk4r7Ma5K7sZ2OJmDpXzU=; b=U7bi6QnCeU8LmhajLwuLPmnZlS
	LjSyGkqk3km9uYYmJ7D5A9FFyl8qVqyLW2dfuD8Ey8BE2oTJ7QhvGHnt6NVlXtwcw0N/4OKry2xhN
	ba3337soV7oOg168NKc9dJPzJA1GboxJ1Qg8fj/tc7TI9Qcy7teO73MZ+eDQn7lsnB2FMUEps7QP0
	KaNE4SkdKl+SeKbKHrIYiizI5JxTpPKmjNEV88s8nzhoGAiwvVk2/fA1iL0kMowDCe/U8zlI41FuG
	QyC+3ZjOnn4G15hGXUmlVCQ6nZQOKtHTa5N3QvBQ3yFlhFGWpoMdoW17uzS4YCcvcRY36HbpEwDJc
	85FfU+PQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIPoQ-00AeEP-DQ; Tue, 24 Aug 2021 06:21:46 +0000
Date: Tue, 24 Aug 2021 07:21:30 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: axboe@kernel.dk, martin.petersen@oracle.com, jejb@linux.ibm.com,
	kbusch@kernel.org, sagi@grimberg.me, adrian.hunter@intel.com,
	beanhuo@micron.com, ulf.hansson@linaro.org, avri.altman@wdc.com,
	swboyd@chromium.org, agk@redhat.com, snitzer@redhat.com,
	josef@toxicpanda.com, hch@infradead.org, hare@suse.de,
	bvanassche@acm.org, ming.lei@redhat.com, linux-scsi@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-mmc@vger.kernel.org,
	dm-devel@redhat.com, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/10] dm: add add_disk() error handling
Message-ID: <YSSP6ujNQttGN2sZ@infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
 <20210823202930.137278-9-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823202930.137278-9-mcgrof@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2Ik6V0xZXLG.A.34H.BTJJhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1315
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YSSP6ujNQttGN2sZ@infradead.org
Resent-Date: Tue, 24 Aug 2021 06:42:09 +0000 (UTC)

On Mon, Aug 23, 2021 at 01:29:28PM -0700, Luis Chamberlain wrote:
> -	add_disk(md->disk);
> +	r = add_disk(md->disk);
> +	if (r)
> +		goto out_cleanup_disk;
>  
>  	r = dm_sysfs_init(md);
> -	if (r) {
> -		del_gendisk(md->disk);
> -		return r;
> -	}
> +	if (r)
> +		goto out_del_gendisk;
>  	md->type = type;
>  	return 0;
> +
> +out_cleanup_disk:
> +	blk_cleanup_disk(md->disk);
> +out_del_gendisk:
> +	del_gendisk(md->disk);
> +	return r;

I think the add_disk should just return r.  If you look at the
callers they eventualy end up in dm_table_destroy, which does
this cleanup.

