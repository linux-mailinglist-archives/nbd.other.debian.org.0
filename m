Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 574533F9FB0
	for <lists+nbd@lfdr.de>; Fri, 27 Aug 2021 21:12:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 35E00207AF; Fri, 27 Aug 2021 19:12:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 27 19:12:10 2021
Old-Return-Path: <mcgrof@infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RDNS_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 505B6205C4
	for <lists-other-nbd@bendel.debian.org>; Fri, 27 Aug 2021 18:55:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.337 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3, RDNS_NONE=0.793]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PMvsWJWn4qIt for <lists-other-nbd@bendel.debian.org>;
	Fri, 27 Aug 2021 18:55:45 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id ECB0B205AF
	for <nbd@other.debian.org>; Fri, 27 Aug 2021 18:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=29EMebI8fVZxvSV7znbN64wsv6+EiNoWIskTvZ79R/I=; b=zlFo3gJSSk9TErlt5pKfkCDZ9R
	AJL9XJkGVu1dNyQjPC6KhYgdRT6BPlnoAQQoC2uDUW9BPjEJslyXyQi0ckfY4xJjyRE+9FAkKRbXi
	vCGwC44tNE5qZaYMt1Hf1DwDBldJXTpxAjfN3w63Lb8tv84kK+6VP46hnZdkJm1vLzdNztgU4lHfJ
	O014zdxZ3PuBrtYH+OHCI/2G6xOc1SM0EYMDUWFHTyp64gLizYxYsSkwtZK2LG4ERPuXbNNPAA7Fo
	Vz+JcjoSbCdh12r2Os8ua9os5AQ2SaVqCICNJim0Cjph8UBOCeIGzn3ZbXDzPxC9aEhm4OhaxEwNl
	5Yg7APZw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJh0U-00CzW8-NG; Fri, 27 Aug 2021 18:55:14 +0000
Date: Fri, 27 Aug 2021 11:55:14 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: axboe@kernel.dk, martin.petersen@oracle.com, jejb@linux.ibm.com,
	kbusch@kernel.org, sagi@grimberg.me, adrian.hunter@intel.com,
	beanhuo@micron.com, ulf.hansson@linaro.org, avri.altman@wdc.com,
	swboyd@chromium.org, agk@redhat.com, snitzer@redhat.com,
	josef@toxicpanda.com, hare@suse.de, bvanassche@acm.org,
	ming.lei@redhat.com, linux-scsi@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-mmc@vger.kernel.org,
	dm-devel@redhat.com, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/10] dm: add add_disk() error handling
Message-ID: <YSk1EhUIr9OjIoVv@bombadil.infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
 <20210823202930.137278-9-mcgrof@kernel.org>
 <YSSP6ujNQttGN2sZ@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSSP6ujNQttGN2sZ@infradead.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zhPqWg2F7VM.A.N4B.KkTKhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1351
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YSk1EhUIr9OjIoVv@bombadil.infradead.org
Resent-Date: Fri, 27 Aug 2021 19:12:10 +0000 (UTC)

On Tue, Aug 24, 2021 at 07:21:30AM +0100, Christoph Hellwig wrote:
> On Mon, Aug 23, 2021 at 01:29:28PM -0700, Luis Chamberlain wrote:
> > -	add_disk(md->disk);
> > +	r = add_disk(md->disk);
> > +	if (r)
> > +		goto out_cleanup_disk;
> >  
> >  	r = dm_sysfs_init(md);
> > -	if (r) {
> > -		del_gendisk(md->disk);
> > -		return r;
> > -	}
> > +	if (r)
> > +		goto out_del_gendisk;
> >  	md->type = type;
> >  	return 0;
> > +
> > +out_cleanup_disk:
> > +	blk_cleanup_disk(md->disk);
> > +out_del_gendisk:
> > +	del_gendisk(md->disk);
> > +	return r;
> 
> I think the add_disk should just return r.  If you look at the
> callers they eventualy end up in dm_table_destroy, which does
> this cleanup.

I don't see it. What part of dm_table_destroy() does this?

  Luis

