Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 700A57A0520
	for <lists+nbd@lfdr.de>; Thu, 14 Sep 2023 15:12:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 373B62052A; Thu, 14 Sep 2023 13:12:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 14 13:12:12 2023
Old-Return-Path: <jack@suse.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_MED,
	REMOVEDOT autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AA32A20583
	for <lists-other-nbd@bendel.debian.org>; Thu, 14 Sep 2023 12:54:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.6 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_MED=-2.3, REMOVEDOT=3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id f2arqZZxBKpr for <lists-other-nbd@bendel.debian.org>;
	Thu, 14 Sep 2023 12:54:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 14762 seconds by postgrey-1.36 at bendel; Thu, 14 Sep 2023 12:54:15 UTC
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7F6A220555
	for <nbd@other.debian.org>; Thu, 14 Sep 2023 12:54:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 212A421845;
	Thu, 14 Sep 2023 12:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1694696053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2P4CCIAtnMeq3zaMem7MKL9pDBcUYiJ/s09jYtJe+Vw=;
	b=TDH+0sRsDYbNxyLehgDUK+EOz/MHao6bdQ4QvXGGH6AAebfS4KsCrIv6GePGqaBy73tP6+
	4vNOm37ylF3YFxOEoZxsPNbrI79EGI32seGDEV25HzxIMVnE3PIRybd3bTJO2XcTklc8pz
	c6k4CNvW9qCfOMDPQiNNw5rBALu7Svc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1694696053;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2P4CCIAtnMeq3zaMem7MKL9pDBcUYiJ/s09jYtJe+Vw=;
	b=WVgJ5i2BMtmqpv3vBR1sx6yyyF7kaUn8NHHiht9xdjQ8sWqFGnqrUcteTNQZoxvXRpnSMY
	bgjpnOXowl3HWwCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0F63F13580;
	Thu, 14 Sep 2023 12:54:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YkivA3UCA2WTQAAAMHmgww
	(envelope-from <jack@suse.cz>); Thu, 14 Sep 2023 12:54:13 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 8771BA07C2; Thu, 14 Sep 2023 14:54:12 +0200 (CEST)
Date: Thu, 14 Sep 2023 14:54:12 +0200
From: Jan Kara <jack@suse.cz>
To: David Sterba <dsterba@suse.cz>
Cc: Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>,
	Al Viro <viro@zeniv.linux.org.uk>,
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
Message-ID: <20230914125412.wlpoixwljdzqu2ih@quack3>
References: <20230811100828.1897174-1-hch@lst.de>
 <20230912174245.GC20408@twin.jikos.cz>
 <20230914084809.arzw34svsvvkwivm@quack3>
 <20230914120320.GY20408@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914120320.GY20408@suse.cz>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <yH53t06EVuO.A.CRG.sawAlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2639
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230914125412.wlpoixwljdzqu2ih@quack3
Resent-Date: Thu, 14 Sep 2023 13:12:12 +0000 (UTC)

On Thu 14-09-23 14:03:20, David Sterba wrote:
> On Thu, Sep 14, 2023 at 10:48:09AM +0200, Jan Kara wrote:
> > On Tue 12-09-23 19:42:45, David Sterba wrote:
> > > On Fri, Aug 11, 2023 at 12:08:11PM +0200, Christoph Hellwig wrote:
> > > > Hi all,
> > > > 
> > > > this series against the VFS vfs.super branch finishes off the work to remove
> > > > get_super and move (almost) all upcalls to use the holder ops.
> > > > 
> > > > The first part is the missing btrfs bits so that all file systems use the
> > > > super_block as holder.
> > > > 
> > > > The second part is various block driver cleanups so that we use proper
> > > > interfaces instead of raw calls to __invalidate_device and fsync_bdev.
> > > > 
> > > > The last part than replaces __invalidate_device and fsync_bdev with upcalls
> > > > to the file system through the holder ops, and finally removes get_super.
> > > > 
> > > > It leaves user_get_super and get_active_super around.  The former is not
> > > > used for upcalls in the traditional sense, but for legacy UAPI that for
> > > > some weird reason take a dev_t argument (ustat) or a block device path
> > > > (quotactl).  get_active_super is only used for calling into the file system
> > > > on freeze and should get a similar treatment, but given that Darrick has
> > > > changes to that code queued up already this will be handled in the next
> > > > merge window.
> > > > 
> > > > A git tree is available here:
> > > > 
> > > >     git://git.infradead.org/users/hch/misc.git remove-get_super
> > > 
> > > FYI, I've added patches 2-5 as a topic branch to btrfs for-next.
> > 
> > Hum, I don't see them there. Some glitch somewhere?
> 
> There will be a delay before the patches show up in the pushed for-next
> branch, some tests failed (maybe not related to this series) and there
> are other merge conflicts that I need to resolve first.

Ah, I see. Thanks for explanation!

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

