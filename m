Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 834423FA461
	for <lists+nbd@lfdr.de>; Sat, 28 Aug 2021 09:45:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3532820609; Sat, 28 Aug 2021 07:45:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Aug 28 07:45:10 2021
Old-Return-Path: <BATV+e82f36cbde774264a3b5+6579+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A3809205D5
	for <lists-other-nbd@bendel.debian.org>; Sat, 28 Aug 2021 07:29:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.38 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Nj4xGTZzrvMc for <lists-other-nbd@bendel.debian.org>;
	Sat, 28 Aug 2021 07:29:39 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B13FC205D1
	for <nbd@other.debian.org>; Sat, 28 Aug 2021 07:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AFQaUzUuTEkMjtfZe6vMif4NxOxYH1tc9yvqOWpaGoU=; b=Vs4fikiD3b55mVdKmwPinQOrql
	2AK33dcgloSKhkn3nQm8xle7mYrgJmLXAgTipd9aFP5lr84o1zbAU3TPW2gaOy/9PC9RjmDSU77eh
	W5g66CdX4UtfAWObohVlVtaWpEvcJB7SYXwghgc5PinRypDaQ9Ul9ftmpWp3nZmqmNrOXQRo6RYLj
	I1GNzV2d8ZOkQOMPt43abeCgMW7JLoZnq07JzKclv09cdG6BstHMpOqcTg4KAznS4BOBsifgIENfn
	IppcKUZOYarvjyhvlYas+2pl8emMMGCZHR1/eaXF0J4oz00GH8XZRstaxf66G63sob0aEQ20KB9eR
	5cPJv5CA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJsjt-00FNDf-Vc; Sat, 28 Aug 2021 07:27:05 +0000
Date: Sat, 28 Aug 2021 08:26:53 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, axboe@kernel.dk,
	martin.petersen@oracle.com, jejb@linux.ibm.com, kbusch@kernel.org,
	sagi@grimberg.me, adrian.hunter@intel.com, beanhuo@micron.com,
	ulf.hansson@linaro.org, avri.altman@wdc.com, swboyd@chromium.org,
	agk@redhat.com, snitzer@redhat.com, josef@toxicpanda.com,
	hare@suse.de, bvanassche@acm.org, ming.lei@redhat.com,
	linux-scsi@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-mmc@vger.kernel.org, dm-devel@redhat.com,
	nbd@other.debian.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] scsi/sd: use blk_cleanup_queue() insted of
 put_disk()
Message-ID: <YSnlPZD/LrVRZWx6@infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
 <20210823202930.137278-2-mcgrof@kernel.org>
 <YSSJNTxyLHu/LsNJ@infradead.org>
 <YSkumJBTztoYdzC7@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSkumJBTztoYdzC7@bombadil.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pr7l0QcpUxC.A.i-D.GmeKhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1353
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YSnlPZD/LrVRZWx6@infradead.org
Resent-Date: Sat, 28 Aug 2021 07:45:10 +0000 (UTC)

On Fri, Aug 27, 2021 at 11:27:36AM -0700, Luis Chamberlain wrote:
> On Tue, Aug 24, 2021 at 06:52:53AM +0100, Christoph Hellwig wrote:
> > On Mon, Aug 23, 2021 at 01:29:21PM -0700, Luis Chamberlain wrote:
> > > The single put_disk() is useful if you know you're not doing
> > > a cleanup after add_disk(), but since we want to add support
> > > for that, just use the normal form of blk_cleanup_disk() to
> > > cleanup the queue and put the disk.
> > 
> > Hmm, I don't think this is correct.  The request_queue is owned by the
> > core SCSI code.
> 
> Alright, I'll drop this one. For the life of me I can't find the respective
> probe call on the scsi layer.

What probe call?  SCSI allocates the request_queue using the normal
blk_mq_init_queue function in scsi_alloc_sdev.  It it then used to
send SCSI passthrough commands for probing before eventually binding
an upper level driver using the driver model (or something not binding
one at all if there is none for the device type).

