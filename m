Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBC54F296F
	for <lists+nbd@lfdr.de>; Tue,  5 Apr 2022 11:27:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4B1BF20724; Tue,  5 Apr 2022 09:27:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr  5 09:27:09 2022
Old-Return-Path: <jack@suse.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8BC192074C
	for <lists-other-nbd@bendel.debian.org>; Tue,  5 Apr 2022 09:10:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.41 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1nn29u_hhQ-x for <lists-other-nbd@bendel.debian.org>;
	Tue,  5 Apr 2022 09:10:06 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9B0352074E
	for <nbd@other.debian.org>; Tue,  5 Apr 2022 09:10:06 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id D212F210F1;
	Tue,  5 Apr 2022 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1649149803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qm9Fw/mp1MiVZAnqKrxlsmgbwUCwCkA3r+UnMXLYLWg=;
	b=Vl1Lcf2uahRzky6OrpFam+WV5gyh6UhK36AhnrxkhDplU6GKZThjF25KBL0a8Y0cqNm58C
	OO6RvKOBAK1ub2bohI7VALe3P6w7+mDzWwyWp12QMDGNGj2wFLOwh6PSrwr2sz/9noOlxq
	vdzyJwlUBkJSIb+Wl0CPjQ+8CIiAwzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1649149803;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qm9Fw/mp1MiVZAnqKrxlsmgbwUCwCkA3r+UnMXLYLWg=;
	b=ldiVcerhgle2I+ScrQb+bng8wgkqa5Bvd80KZMKi792G8TAQbz4dSAOEsAnKwCC9l2xyhI
	hSixvqipPRdTo4Bw==
Received: from quack3.suse.cz (unknown [10.100.224.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id B6018A3B89;
	Tue,  5 Apr 2022 09:10:03 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 2C569A0615; Tue,  5 Apr 2022 11:10:03 +0200 (CEST)
Date: Tue, 5 Apr 2022 11:10:03 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jan Kara <jack@suse.cz>,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, Matteo Croce <mcroce@microsoft.com>,
	linux-block@vger.kernel.org, nbd@other.debian.org
Subject: Re: yet another approach to fix the loop lock order inversions v6
Message-ID: <20220405091003.gmeuhtrwj7nzebyx@quack3.lan>
References: <20220330052917.2566582-1-hch@lst.de>
 <20220404074235.GA1046@lst.de>
 <499de381-c81e-4bd0-b5f7-1ee6be45821d@I-love.SAKURA.ne.jp>
 <20220405062838.GA24373@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405062838.GA24373@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <By4ym48d21G.A.hFH.ttATiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1852
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220405091003.gmeuhtrwj7nzebyx@quack3.lan
Resent-Date: Tue,  5 Apr 2022 09:27:09 +0000 (UTC)

On Tue 05-04-22 08:28:38, Christoph Hellwig wrote:
> On Mon, Apr 04, 2022 at 06:39:31PM +0900, Tetsuo Handa wrote:
> > Two bugs which Jan has found in /bin/mount might not be yet fixed in
> > versions developers/users are using. Thus, let's wait for a while
> > before committing to linux.git.
> 
> Jan, which loop bugs might be relevant here?

So there was a bug in libmount code trying to reuse already setup loop
devices and changes in timing & removing the lo_mutex from lo_open() +
suitable racing with systemd-udev probing devices caused these bugs to
manifest. The visible effect was that a loop like:

while :; do mount -o loop,ro isofs.iso isofs/; umount isofs/; done

often failed with:

mount: /mnt: can't read superblock on /dev/loop0.
umount: /mnt: not mounted.

Bugs are fixed now by commits 3e1fc3bbe ("mount: Fix race in loop device
reuse code"), fb4b6b115 ("loopdev: Properly translate errors from
ul_path_read_*()"), 562990b552 ("loopdev: Do not treat errors when
detecting overlap as fatal") in util-linux git.

The only real-world impact I've heard about was LTP failing due to these
problems and those guys should be capable enough to update their util-linux
when we tell them. So I think we should be OK with pushing the kernel fixes
upstream but it may generate some noise from automated testers before
util-linux is updated on all of them...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

