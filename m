Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D6E3FA472
	for <lists+nbd@lfdr.de>; Sat, 28 Aug 2021 09:57:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E8E8120603; Sat, 28 Aug 2021 07:57:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Aug 28 07:57:09 2021
Old-Return-Path: <BATV+e82f36cbde774264a3b5+6579+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 03EC820600
	for <lists-other-nbd@bendel.debian.org>; Sat, 28 Aug 2021 07:39:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nUkDgxKzRqh7 for <lists-other-nbd@bendel.debian.org>;
	Sat, 28 Aug 2021 07:38:56 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E9416205FF
	for <nbd@other.debian.org>; Sat, 28 Aug 2021 07:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0ts55k9K+AeTzI9UinkPG1HeoaDA8i8L+H7cb7KVKcM=; b=gQt5y7F7KIDyZaXkososCL+fcG
	T2PIBhRo7HPDBmFHt+eO5KVFvLgVeZGwIKrYR2niVA+3/g2ZgL6e5pKHzjoJmm0lyXek03Dv0Du9P
	aZPQdbYOqZW9kGWcEzCGEYiBC3pfLH7iGVFSfZM5kWNvH0m++Rshqf/nGe+kSXO61lpgRAxS2aPru
	Uo7s6HzZswFEg9QYlOpn1F2dRXGqoTY6EN01HI7Kx5/EERLBx+3USkpv/0tBhHPTid8VxgaTIH1K8
	0szPfLe0HpykgcgAKjnsv0AbqbOddfn9BTTTgLf36cdVT819hgNoou8J9itvpsS1yuvX6iIb4uQTj
	9lt1aQUw==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJssf-00FNYs-A6; Sat, 28 Aug 2021 07:36:12 +0000
Date: Sat, 28 Aug 2021 08:35:57 +0100
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
Subject: Re: [PATCH 08/10] dm: add add_disk() error handling
Message-ID: <YSnnXdKLvxEY8yay@infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
 <20210823202930.137278-9-mcgrof@kernel.org>
 <YSSP6ujNQttGN2sZ@infradead.org>
 <YSk1EhUIr9OjIoVv@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSk1EhUIr9OjIoVv@bombadil.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oYwv9l7_hkM.A.Rv.VxeKhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1355
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YSnnXdKLvxEY8yay@infradead.org
Resent-Date: Sat, 28 Aug 2021 07:57:09 +0000 (UTC)

On Fri, Aug 27, 2021 at 11:55:14AM -0700, Luis Chamberlain wrote:
> > I think the add_disk should just return r.  If you look at the
> > callers they eventualy end up in dm_table_destroy, which does
> > this cleanup.
> 
> I don't see it. What part of dm_table_destroy() does this?

Sorry, dm_destroy, not dm_table_destroy.  For dm_early_create it's
trivial as that calls both dm_table_destroy and dm_destroy in the error
path.  The normal table_load case is a separate ioctl, but if that
fails userspace needs to call the DM_DEV_REMOVE_CMD to cleanup
the state - similar to any other failure.

