Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1040F4EBC7A
	for <lists+nbd@lfdr.de>; Wed, 30 Mar 2022 10:15:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C887A215AE; Wed, 30 Mar 2022 08:15:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 30 08:15:09 2022
Old-Return-Path: <jack@suse.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EED8E215A7
	for <lists-other-nbd@bendel.debian.org>; Wed, 30 Mar 2022 07:58:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.39 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tLhnoW__cfVx for <lists-other-nbd@bendel.debian.org>;
	Wed, 30 Mar 2022 07:58:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 27089214DD
	for <nbd@other.debian.org>; Wed, 30 Mar 2022 07:58:18 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 6FABD210E3;
	Wed, 30 Mar 2022 07:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1648627095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=btc3lxSUn9PcVitjKrtXKpgwEopvHljRAuljTFIUVlI=;
	b=Cc2PWxFsbVm023/0/w5hnMdoxtxyqBlgFUq+B92S4OCTzZsyTytTYrYqt0gCwZn6J0sAF5
	D6uPXUS65xESZfg9ZIHgKJodPZwl9aF9X1kIzpJK93O1YyaeXD2GiBtG7q+hGAluKwmc1R
	naMnPN76xSEY1dt1Onfp3ws2Q3Xfwns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1648627095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=btc3lxSUn9PcVitjKrtXKpgwEopvHljRAuljTFIUVlI=;
	b=RnrEnTIKj0ddOaGg++fbm9v8wc+F0UsBJQd/HFqoN7r/RI6GzKX2vmZlG0WKAi/bXpXKkF
	Br8d7xJ540nfQ8Bg==
Received: from quack3.suse.cz (unknown [10.163.28.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 1408BA3B83;
	Wed, 30 Mar 2022 07:58:15 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 5A529A0610; Wed, 30 Mar 2022 09:58:09 +0200 (CEST)
Date: Wed, 30 Mar 2022 09:58:09 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jan Kara <jack@suse.cz>,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	Dave Chinner <david@fromorbit.com>, Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH 12/13] loop: remove lo_refcount and avoid lo_mutex in
 ->open / ->release
Message-ID: <20220330075809.f7676hejthuwcyk6@quack3.lan>
References: <20220324075119.1556334-13-hch@lst.de>
 <20220324141321.pqesnshaswwk3svk@quack3.lan>
 <96a4e2e7-e16e-7e89-255d-8aa29ffca68b@I-love.SAKURA.ne.jp>
 <20220324172335.GA28299@lst.de>
 <0b47dbee-ce17-7502-6bf3-fad939f89bb7@I-love.SAKURA.ne.jp>
 <20220325162331.GA16355@lst.de>
 <20220328083045.ryoh7rbhauxgezgn@quack3.lan>
 <20220329063921.GA19778@lst.de>
 <20220329094203.zkgkqtumix7nygs2@quack3.lan>
 <20220329131427.GA1848@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329131427.GA1848@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vQ9yt-qFrFD.A.yiB.NGBRiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1839
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220330075809.f7676hejthuwcyk6@quack3.lan
Resent-Date: Wed, 30 Mar 2022 08:15:09 +0000 (UTC)

On Tue 29-03-22 15:14:27, Christoph Hellwig wrote:
> On Tue, Mar 29, 2022 at 11:42:03AM +0200, Jan Kara wrote:
> > > entirely, as loop_clr_fd now is safe against concurrent users - it
> > > has to anyway as there can be other users even without an open.
> > 
> > Ah, OK, so you'd always set LO_AUTOCLEAR and leave cleanup to happen
> > from lo_release()? That makes sense to me.
> 
> No, my idea was to never set LO_AUTOCLEAR.  We have a frozen queue and
> all protections in place to make clearing the file perfectly safe.
> In fact the change_fd case also allows this.

I see, thanks for explanation. But then there's the risk of userspace
regressions if someone relies on the current behavior that LOOP_CLR_FD
ioctl does only delayed teardown of the device if someone is using it.
Personally I don't think the risk of regression is worth the benefit of the
cleanup but maybe it's worth trying. At least I know that for loop device
handling inside mount(8) (which plays tricks with reusing existing bound
loop devices), this change should be safe.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

