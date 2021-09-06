Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FED401802
	for <lists+nbd@lfdr.de>; Mon,  6 Sep 2021 10:27:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A01E4212D9; Mon,  6 Sep 2021 08:27:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep  6 08:27:09 2021
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY,MURPHY_DRUGS_REL8
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B6A63212E8
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Sep 2021 08:09:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.02 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id d2gUpDZLDHCK for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Sep 2021 08:09:13 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D331921288
	for <nbd@other.debian.org>; Mon,  6 Sep 2021 08:09:13 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id E18B767373; Mon,  6 Sep 2021 10:09:08 +0200 (CEST)
Date: Mon, 6 Sep 2021 10:09:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Luis Chamberlain <mcgrof@kernel.org>, axboe@kernel.dk,
	martin.petersen@oracle.com, jejb@linux.ibm.com, kbusch@kernel.org,
	sagi@grimberg.me, adrian.hunter@intel.com, beanhuo@micron.com,
	ulf.hansson@linaro.org, avri.altman@wdc.com, swboyd@chromium.org,
	agk@redhat.com, snitzer@redhat.com, josef@toxicpanda.com,
	hch@infradead.org, bvanassche@acm.org, ming.lei@redhat.com,
	linux-scsi@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-mmc@vger.kernel.org, dm-devel@redhat.com,
	nbd@other.debian.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v3 3/8] nvme: add error handling support for add_disk()
Message-ID: <20210906080908.GA25575@lst.de>
References: <20210830212538.148729-1-mcgrof@kernel.org> <20210830212538.148729-4-mcgrof@kernel.org> <677ca876-b003-d3b5-9e2e-d50ebef82cce@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <677ca876-b003-d3b5-9e2e-d50ebef82cce@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oM6WjTAyFcI.A.s3G.dDdNhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1387
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210906080908.GA25575@lst.de
Resent-Date: Mon,  6 Sep 2021 08:27:09 +0000 (UTC)

On Mon, Sep 06, 2021 at 08:16:35AM +0200, Hannes Reinecke wrote:
> I would rather turn this around, and call 'nvme_put_ctrl()' after removing 
> the namespace from the list. But it's probably more a style issue, come to 
> think of it.

The order in the patch is the inverse of the order before the failure,
which generally is the right thing to do.

