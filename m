Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 816733F5821
	for <lists+nbd@lfdr.de>; Tue, 24 Aug 2021 08:24:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3C78B205E9; Tue, 24 Aug 2021 06:24:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug 24 06:24:12 2021
Old-Return-Path: <BATV+f96701cc9b95d8800a83+6575+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 70A0F20620
	for <lists-other-nbd@bendel.debian.org>; Tue, 24 Aug 2021 06:07:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uat_uDDP31CE for <lists-other-nbd@bendel.debian.org>;
	Tue, 24 Aug 2021 06:07:04 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9AAF720606
	for <nbd@other.debian.org>; Tue, 24 Aug 2021 06:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JcT1aJS86g1/QsjFdAkPecRM4XBnficOBnxN044pPFQ=; b=NwDFWcCkHKbD2sOCndJXglXHqd
	K7MzimfAkHKuRQaTiSO2Zlf+HMWfZC2sihSBMQre3wLwOT09IliIQCvRfac9aYQJCsXP4iSRZk7tT
	rI3tdEITmFL96vtZQK4+225Nljv8fFVWOfTHHtfXHfLlyqSaEDS3y48+AuuaWeL3k6U1Hizv0H3g4
	UAkw7eMasY6QdYrfChNh4nw9Kt0WjAsv3848F0XH7f+3SJNNaQndpIblGi0kMDU3hL9skulY1fryC
	9uidUeYQJqGCuc7fsh81EBPHO6uTACeG/bHuJgqFZcp1W9l2hbpcXjnKMNLtt0lLj5wVbUCbxO5Qw
	0yMFkz4Q==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIPU3-00Acmq-BR; Tue, 24 Aug 2021 06:01:01 +0000
Date: Tue, 24 Aug 2021 07:00:27 +0100
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
Subject: Re: [PATCH 03/10] scsi/sr: use blk_cleanup_disk() instead of
 put_disk()
Message-ID: <YSSK+0afMcpUAKyK@infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
 <20210823202930.137278-4-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823202930.137278-4-mcgrof@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SXPsBaLVuGI.A.HyH.MCJJhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1310
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YSSK+0afMcpUAKyK@infradead.org
Resent-Date: Tue, 24 Aug 2021 06:24:12 +0000 (UTC)

On Mon, Aug 23, 2021 at 01:29:23PM -0700, Luis Chamberlain wrote:
> The single put_disk() is useful if you know you're not doing
> a cleanup after add_disk(), but since we want to add support
> for that, just use the normal form of blk_cleanup_disk() to
> cleanup the queue and put the disk.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

.. not needed as the cleanup is done by the core scsi code.

