Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C363F9F17
	for <lists+nbd@lfdr.de>; Fri, 27 Aug 2021 20:45:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 84CB02080A; Fri, 27 Aug 2021 18:45:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 27 18:45:32 2021
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
	by bendel.debian.org (Postfix) with ESMTP id EB823207D5
	for <lists-other-nbd@bendel.debian.org>; Fri, 27 Aug 2021 18:29:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.337 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3, RDNS_NONE=0.793]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7LbH322Lp-hQ for <lists-other-nbd@bendel.debian.org>;
	Fri, 27 Aug 2021 18:29:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8C68F207D1
	for <nbd@other.debian.org>; Fri, 27 Aug 2021 18:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AUMiADqeBGFQaMKc9cx2vrmBW7Wcwtbw7Je/QSFxSbQ=; b=LaCxdIm2Zc6DkoIIu5Dj4I6WOS
	XX4xg9rxE8Mc+ybHnX26/zyaE5gVVNXp6X3ZPOds2VV4A1JJIwtGEMY7jV7g7WOYoGzUJeApuHRht
	Cr3RyH7KLNWOu6FMiODVq5p6mzPeRAxelMiwumvvdMsyxfEZ5vprK1y3NU0IdfLbsP9PRoPcPDZEv
	HmS1WjnHgIcI5JamGFEvK75UNtbPLJfgKrhqhH4hwnskUl5/LCBxvWhrYCSz6/XootHre8dvGh9Bl
	JLYTNkxoFOQ0WQqz7JrRo+K9dLT/8IY+DxAmJOuOZ4LrSxIQxpySXVFE8On+0yn8nuJ+Y13REd1Yu
	y04b03uA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJgb3-00CxJs-B2; Fri, 27 Aug 2021 18:28:57 +0000
Date: Fri, 27 Aug 2021 11:28:57 -0700
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
Subject: Re: [PATCH 03/10] scsi/sr: use blk_cleanup_disk() instead of
 put_disk()
Message-ID: <YSku6VaEOzitSTOg@bombadil.infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
 <20210823202930.137278-4-mcgrof@kernel.org>
 <YSSK+0afMcpUAKyK@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSSK+0afMcpUAKyK@infradead.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <1zj2UedkLEF.A.6uC.MLTKhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1348
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YSku6VaEOzitSTOg@bombadil.infradead.org
Resent-Date: Fri, 27 Aug 2021 18:45:32 +0000 (UTC)

On Tue, Aug 24, 2021 at 07:00:27AM +0100, Christoph Hellwig wrote:
> On Mon, Aug 23, 2021 at 01:29:23PM -0700, Luis Chamberlain wrote:
> > The single put_disk() is useful if you know you're not doing
> > a cleanup after add_disk(), but since we want to add support
> > for that, just use the normal form of blk_cleanup_disk() to
> > cleanup the queue and put the disk.
> > 
> > Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> 
> .. not needed as the cleanup is done by the core scsi code.

Dropped.

  Luis

