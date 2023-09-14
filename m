Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1271779FFC8
	for <lists+nbd@lfdr.de>; Thu, 14 Sep 2023 11:12:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BB27920607; Thu, 14 Sep 2023 09:12:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 14 09:12:12 2023
Old-Return-Path: <jack@suse.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_MED,
	REMOVEDOT autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A2DE920606
	for <lists-other-nbd@bendel.debian.org>; Thu, 14 Sep 2023 08:54:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.6 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_MED=-2.3, REMOVEDOT=3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LrWpBUUPrK3S for <lists-other-nbd@bendel.debian.org>;
	Thu, 14 Sep 2023 08:54:37 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 358 seconds by postgrey-1.36 at bendel; Thu, 14 Sep 2023 08:54:37 UTC
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 42C6F205F4
	for <nbd@other.debian.org>; Thu, 14 Sep 2023 08:54:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E00E61F459;
	Thu, 14 Sep 2023 08:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1694681289; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w5UDwGteLFhh2/0nMPx8cref2hipYMXRtcBto7gypmo=;
	b=ohc5QJ47nEM1DELrLcNDtDJuBjJ52kpjAX1BCcO+w95Az6n602h5w9TLPjIYiOWjHNWhM3
	uaYXjMqLw0cK8zU3MyigcnHuTCYuufLliv2BXyQcLz17z1iJKqZDubzY17j+FyjV9y0uTA
	K4YlkoIgoc7mmW5dJosjmOH5ZjWfrAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1694681289;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w5UDwGteLFhh2/0nMPx8cref2hipYMXRtcBto7gypmo=;
	b=n+WVMWLOD1EYrdaY0Timu7z7Wrfr1A9IAp4nA5sBLbCV9YCprCs1JXDcnnUtC858zfeuP6
	PctuSy4uNLPnL3BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC89B13580;
	Thu, 14 Sep 2023 08:48:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6dfrMcnIAmVQNwAAMHmgww
	(envelope-from <jack@suse.cz>); Thu, 14 Sep 2023 08:48:09 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 66DB9A07C2; Thu, 14 Sep 2023 10:48:09 +0200 (CEST)
Date: Thu, 14 Sep 2023 10:48:09 +0200
From: Jan Kara <jack@suse.cz>
To: David Sterba <dsterba@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
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
Subject: Re: remove get_super
Message-ID: <20230914084809.arzw34svsvvkwivm@quack3>
References: <20230811100828.1897174-1-hch@lst.de>
 <20230912174245.GC20408@twin.jikos.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912174245.GC20408@twin.jikos.cz>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Dsna6nvI9uO.A.hvD.s5sAlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2637
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230914084809.arzw34svsvvkwivm@quack3
Resent-Date: Thu, 14 Sep 2023 09:12:12 +0000 (UTC)

On Tue 12-09-23 19:42:45, David Sterba wrote:
> On Fri, Aug 11, 2023 at 12:08:11PM +0200, Christoph Hellwig wrote:
> > Hi all,
> > 
> > this series against the VFS vfs.super branch finishes off the work to remove
> > get_super and move (almost) all upcalls to use the holder ops.
> > 
> > The first part is the missing btrfs bits so that all file systems use the
> > super_block as holder.
> > 
> > The second part is various block driver cleanups so that we use proper
> > interfaces instead of raw calls to __invalidate_device and fsync_bdev.
> > 
> > The last part than replaces __invalidate_device and fsync_bdev with upcalls
> > to the file system through the holder ops, and finally removes get_super.
> > 
> > It leaves user_get_super and get_active_super around.  The former is not
> > used for upcalls in the traditional sense, but for legacy UAPI that for
> > some weird reason take a dev_t argument (ustat) or a block device path
> > (quotactl).  get_active_super is only used for calling into the file system
> > on freeze and should get a similar treatment, but given that Darrick has
> > changes to that code queued up already this will be handled in the next
> > merge window.
> > 
> > A git tree is available here:
> > 
> >     git://git.infradead.org/users/hch/misc.git remove-get_super
> 
> FYI, I've added patches 2-5 as a topic branch to btrfs for-next.

Hum, I don't see them there. Some glitch somewhere?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

