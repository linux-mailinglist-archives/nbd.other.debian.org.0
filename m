Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A31333F586A
	for <lists+nbd@lfdr.de>; Tue, 24 Aug 2021 08:45:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 48E322060E; Tue, 24 Aug 2021 06:45:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug 24 06:45:13 2021
Old-Return-Path: <BATV+f96701cc9b95d8800a83+6575+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C50CA20621
	for <lists-other-nbd@bendel.debian.org>; Tue, 24 Aug 2021 06:29:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8nU2Zn4WZoQN for <lists-other-nbd@bendel.debian.org>;
	Tue, 24 Aug 2021 06:29:51 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 2D70D20611
	for <nbd@other.debian.org>; Tue, 24 Aug 2021 06:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=h3MydBBxPtnCn8mECKrga5hLvZ89hWgHnN/iC3nPPtw=; b=X0xFkwNCQeDfxPyCeeHS3KtJFY
	qOQtl/+7Y+F4gcfDj91x4YthWDlyyTu7bo8m5zxAM4yepyJYc0B884cRelvurJ+vMbaJOJ006Svtp
	4YzWZNbdbrQ54HMBkDsthzWAZ5nFEL7NSD3Ehm8MMy8ZuliBZ+65hp5HgEmud87d6W11ymY+XVYqm
	dkOT3wHIIFhYqQu48r/hYk2iyojImtPbmt+x7SyaINEuO/RWu+7VpcKs717E4+mPM118wO8c9GQ+1
	2TZRPOE8RLSx3LkhPbRNTS2esfKFrUw0YYwPXB26xDKqRZva/6Zaix4f8WCrQGMRUPA3Y5/e528VW
	A99X0qbw==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIPsH-00AePY-Vj; Tue, 24 Aug 2021 06:25:57 +0000
Date: Tue, 24 Aug 2021 07:25:29 +0100
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
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 09/10] loop: add error handling support for add_disk()
Message-ID: <YSSQ2Qa5HkDQCF0J@infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
 <20210823202930.137278-10-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823202930.137278-10-mcgrof@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <VKdgY_ktVvN.A.HX.5VJJhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1316
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YSSQ2Qa5HkDQCF0J@infradead.org
Resent-Date: Tue, 24 Aug 2021 06:45:13 +0000 (UTC)

On Mon, Aug 23, 2021 at 01:29:29PM -0700, Luis Chamberlain wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

and I think you can drop my signoff.  I added this when I planned
to send out with the original conversion, but dropped it for simpler
examples.

