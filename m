Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E32277A308
	for <lists+nbd@lfdr.de>; Sat, 12 Aug 2023 23:18:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4876020551; Sat, 12 Aug 2023 21:18:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Aug 12 21:18:12 2023
Old-Return-Path: <willy@infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AE025205D7
	for <lists-other-nbd@bendel.debian.org>; Sat, 12 Aug 2023 21:02:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.38 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id UK56E-McJjWB for <lists-other-nbd@bendel.debian.org>;
	Sat, 12 Aug 2023 21:01:52 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 1085 seconds by postgrey-1.36 at bendel; Sat, 12 Aug 2023 21:01:51 UTC
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id EDADD2051D
	for <nbd@other.debian.org>; Sat, 12 Aug 2023 21:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aB77Wk/7coo4TD642I2PGM5/78kptrrLVMQdKyaKs4E=; b=Ym3jI/2h44grHdRLpzf7ao0YDF
	V6fqK+7zAEHEOs3DXnXGEbJJJvuJWTWRO5OKz6AWWz8YGHkW3M8nHFsaIbFOz23Ts1XJ2LpsXHoxg
	aBO8P3OGS3PvV3xKy6fRsxaZce++2iPGaMiKTPTTb0jzFpGBfnB8P3mrzs/HOo+5bzDOuFWQ9LF7b
	JDscWMwRwHURGpYgKWnLo258DoDb4bEd0zw2zwQfFCiWMQmV5xq26vag0sidhRqH6ZdIhKMP3Ddrq
	huMJiqhGXZSdYgxa2n7YNt9ISkbY5DAyxN82/Pvw/vLgdP7cbMuiW2Oifioez/gRxhS/I9JCAhjPF
	43tMMd0A==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qUvSD-009TfJ-HK; Sat, 12 Aug 2023 20:43:21 +0000
Date: Sat, 12 Aug 2023 21:43:21 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	"Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-s390@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 13/17] block: consolidate __invalidate_device and
 fsync_bdev
Message-ID: <ZNfu6THHySvQWViA@casper.infradead.org>
References: <20230811100828.1897174-1-hch@lst.de>
 <20230811100828.1897174-14-hch@lst.de>
 <20230812105133.GA11904@lst.de>
 <20230812170400.11613-A-hca@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230812170400.11613-A-hca@linux.ibm.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <41U2Ak3o2M.A.Q0.Uc_1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2626
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZNfu6THHySvQWViA@casper.infradead.org
Resent-Date: Sat, 12 Aug 2023 21:18:12 +0000 (UTC)

On Sat, Aug 12, 2023 at 07:04:00PM +0200, Heiko Carstens wrote:
> On Sat, Aug 12, 2023 at 12:51:33PM +0200, Christoph Hellwig wrote:
> > The buildbot pointed out correctly (but rather late), that the special
> > s390/dasd export needs a _MODULE postfix, so this will have to be
> > folded in:
> > 
> > diff --git a/block/bdev.c b/block/bdev.c
> > index 2a035be7f3ee90..a20263fa27a462 100644
> > --- a/block/bdev.c
> > +++ b/block/bdev.c
> > @@ -967,7 +967,7 @@ void bdev_mark_dead(struct block_device *bdev, bool surprise)
> >  
> >  	invalidate_bdev(bdev);
> >  }
> > -#ifdef CONFIG_DASD
> > +#ifdef CONFIG_DASD_MODULE
> 
> This needs to be
> 
> #if IS_ENABLED(CONFIG_DASD)
> 
> to cover both CONFIG_DASD=y and CONFIG_DASD=m.

Sure, but if DASD is built-in, the symbol doesn't need to be exported

