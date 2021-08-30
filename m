Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C959B3FBE06
	for <lists+nbd@lfdr.de>; Mon, 30 Aug 2021 23:18:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7F78F2043C; Mon, 30 Aug 2021 21:18:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 30 21:18:09 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 77663203CA
	for <lists-other-nbd@bendel.debian.org>; Mon, 30 Aug 2021 21:01:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.337 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3, RDNS_NONE=0.793]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id syZ1cyFz4dtd for <lists-other-nbd@bendel.debian.org>;
	Mon, 30 Aug 2021 21:01:32 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 07E4820394
	for <nbd@other.debian.org>; Mon, 30 Aug 2021 21:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YLeyIh36W9KZ0EdnGoneLXaI1P2Sf43R5mGsowkdW0g=; b=rHUGs8PC9SNCLr8+68pmjJ6j+O
	LtaWTZh9Q5B1+nQ2hrTGPF1fcfbSR3Bc4MaZvFu5VphNn3uzQki+n35xkL0bVrh1LapvtJXCTf9x2
	aX8wRYUgYbB46/sh+IyauBD/d0v+EUJxIYc5tPiQ59XAdDbtIw4Bl5TuloVoTzanjLZH6B4zEyu9Z
	cJfxaSEUPDqzy73KINJtfXG3JQEC+OVcdV8NY+mlstsLgVUnda0SZf0UpWRWmmrSNYHh6ccI4qX6Q
	jujgcYNbGhmMrYwBPve3x8mENOXlAOUdzlGIdtNTAxg2GKSXah81G/vdsWSHpKSkvVupm5BhcGwQl
	0RhmffIA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKoOo-000ZII-6j; Mon, 30 Aug 2021 21:00:58 +0000
Date: Mon, 30 Aug 2021 14:00:58 -0700
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
Message-ID: <YS1HCgP/XdWmMtFN@bombadil.infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
 <20210823202930.137278-9-mcgrof@kernel.org>
 <YSSP6ujNQttGN2sZ@infradead.org>
 <YSk1EhUIr9OjIoVv@bombadil.infradead.org>
 <YSnnXdKLvxEY8yay@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSnnXdKLvxEY8yay@infradead.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mu-1Aa0Z8i.A.IuF.RsULhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1358
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YS1HCgP/XdWmMtFN@bombadil.infradead.org
Resent-Date: Mon, 30 Aug 2021 21:18:09 +0000 (UTC)

On Sat, Aug 28, 2021 at 08:35:57AM +0100, Christoph Hellwig wrote:
> On Fri, Aug 27, 2021 at 11:55:14AM -0700, Luis Chamberlain wrote:
> > > I think the add_disk should just return r.  If you look at the
> > > callers they eventualy end up in dm_table_destroy, which does
> > > this cleanup.
> > 
> > I don't see it. What part of dm_table_destroy() does this?
> 
> Sorry, dm_destroy, not dm_table_destroy.  For dm_early_create it's
> trivial as that calls both dm_table_destroy and dm_destroy in the error
> path.  The normal table_load case is a separate ioctl, but if that
> fails userspace needs to call the DM_DEV_REMOVE_CMD to cleanup
> the state - similar to any other failure.

I see, ok sure I'll document this on the commit log as its not so
obvious.

  Luis

