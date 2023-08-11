Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 079BC7790F8
	for <lists+nbd@lfdr.de>; Fri, 11 Aug 2023 15:45:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DD67520628; Fri, 11 Aug 2023 13:45:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 11 13:45:11 2023
Old-Return-Path: <dsterba@suse.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8455420628
	for <lists-other-nbd@bendel.debian.org>; Fri, 11 Aug 2023 13:27:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jn141pgOVveq for <lists-other-nbd@bendel.debian.org>;
	Fri, 11 Aug 2023 13:27:31 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 570 seconds by postgrey-1.36 at bendel; Fri, 11 Aug 2023 13:27:31 UTC
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 40ACE20632
	for <nbd@other.debian.org>; Fri, 11 Aug 2023 13:27:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 41B8321875;
	Fri, 11 Aug 2023 13:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1691759877;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jxg4TxS/cWMUXDhX+Q9gfid5V2x8SK/7YZ4qzrUQGPw=;
	b=E4Sjzuw1+s9z57yqR8TqHdrTIAIfqlF0aO3xt916+YEZQoGQ8xf0cposTBZQU0wFD+mUPK
	N357zPJOSNrXTqUErUFX/4FCpghua6XQu5bD0bbJKzRFGyqM91yug32oJPZ4/ewNu8pmeX
	cwevnrFG+Ao1hj3ojRyKVt1OpDwiI6s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1691759877;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jxg4TxS/cWMUXDhX+Q9gfid5V2x8SK/7YZ4qzrUQGPw=;
	b=M+ZAVaWnqAM/Oi3IQFevlgwEaHXiAZnzmggT07Dkg7x9FI9GNAMFZc9doUlUu+4+yr8DFg
	d0l3iNDFg1Z2lXAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D88E813592;
	Fri, 11 Aug 2023 13:17:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id TMEFNAQ11mRafgAAMHmgww
	(envelope-from <dsterba@suse.cz>); Fri, 11 Aug 2023 13:17:56 +0000
Date: Fri, 11 Aug 2023 15:11:31 +0200
From: David Sterba <dsterba@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
	Jens Axboe <axboe@kernel.dk>, Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	"Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-s390@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 05/17] btrfs: open block devices after superblock creation
Message-ID: <20230811131131.GN2420@suse.cz>
Reply-To: dsterba@suse.cz
References: <20230811100828.1897174-1-hch@lst.de>
 <20230811100828.1897174-6-hch@lst.de>
 <20230811-wildpark-bronzen-5e30a56de1a1@brauner>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811-wildpark-bronzen-5e30a56de1a1@brauner>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UiKRcR9_eAP.A.YfG.ntj1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2623
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230811131131.GN2420@suse.cz
Resent-Date: Fri, 11 Aug 2023 13:45:11 +0000 (UTC)

On Fri, Aug 11, 2023 at 02:44:50PM +0200, Christian Brauner wrote:
> On Fri, Aug 11, 2023 at 12:08:16PM +0200, Christoph Hellwig wrote:
> > Currently btrfs_mount_root opens the block devices before committing to
> > allocating a super block. That creates problems for restricting the
> > number of writers to a device, and also leads to a unusual and not very
> > helpful holder (the fs_type).
> > 
> > Reorganize the code to first check whether the superblock for a
> > particular fsid does already exist and open the block devices only if it
> > doesn't, mirroring the recent changes to the VFS mount helpers.  To do
> > this the increment of the in_use counter moves out of btrfs_open_devices
> > and into the only caller in btrfs_mount_root so that it happens before
> > dropping uuid_mutex around the call to sget.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> 
> Looks good to me,
> Acked-by: Christian Brauner <brauner@kernel.org>
> 
> And ofc, would be great to get btrfs reviews.

I'll take a look but there are some performance regressions to deal with
and pre-merge window freeze so it won't be soon.

