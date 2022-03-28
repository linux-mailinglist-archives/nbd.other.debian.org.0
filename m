Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9AA4E9070
	for <lists+nbd@lfdr.de>; Mon, 28 Mar 2022 10:48:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id ABB1120C37; Mon, 28 Mar 2022 08:48:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Mar 28 08:48:09 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 48A7020BD6
	for <lists-other-nbd@bendel.debian.org>; Mon, 28 Mar 2022 08:31:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.39 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DrvhdFnUJBzW for <lists-other-nbd@bendel.debian.org>;
	Mon, 28 Mar 2022 08:30:49 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .suse. - helo: .smtp-out2.suse. - helo-domain: .suse.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 30A1A20BCE
	for <nbd@other.debian.org>; Mon, 28 Mar 2022 08:30:48 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 0FDC71F385;
	Mon, 28 Mar 2022 08:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1648456246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zTwNET6NFHGhSKFNWoO4/wxCz/Ohx5B7SlCtUBVlQec=;
	b=LN9Jptd9hAjIgEC4ZJmFQX/Z9N5TuwM0oNuHpyuekuzMosDdN1+zZQiQlk9wDeSDjvd2w6
	ZxFgWJEf/CWf2/8tIhQnBn/W8HtC/uyzq3SlpMwYxmRZpCMMYusgMHB6sxcdWXEiHHej60
	Cxrr6S6oSUaYbCkw3obQzRimu/FAwEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1648456246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zTwNET6NFHGhSKFNWoO4/wxCz/Ohx5B7SlCtUBVlQec=;
	b=seQ2j4KoWErxklMTXjF+mwYwb3/OrpqVESFpdXgFmwVUZOxc+X1TKBuIpVHUt68YYxe2YJ
	q2O2KFm4JeBQ1vBw==
Received: from quack3.suse.cz (unknown [10.163.43.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 8993BA3B87;
	Mon, 28 Mar 2022 08:30:45 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 3BB61A0610; Mon, 28 Mar 2022 10:30:45 +0200 (CEST)
Date: Mon, 28 Mar 2022 10:30:45 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	Dave Chinner <david@fromorbit.com>, Jan Kara <jack@suse.cz>,
	Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH 12/13] loop: remove lo_refcount and avoid lo_mutex in
 ->open / ->release
Message-ID: <20220328083045.ryoh7rbhauxgezgn@quack3.lan>
References: <20220324075119.1556334-1-hch@lst.de>
 <20220324075119.1556334-13-hch@lst.de>
 <20220324141321.pqesnshaswwk3svk@quack3.lan>
 <96a4e2e7-e16e-7e89-255d-8aa29ffca68b@I-love.SAKURA.ne.jp>
 <20220324172335.GA28299@lst.de>
 <0b47dbee-ce17-7502-6bf3-fad939f89bb7@I-love.SAKURA.ne.jp>
 <20220325162331.GA16355@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220325162331.GA16355@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <IMKUx2jk9MO.A.26C.JZXQiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1814
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220328083045.ryoh7rbhauxgezgn@quack3.lan
Resent-Date: Mon, 28 Mar 2022 08:48:09 +0000 (UTC)

On Fri 25-03-22 17:23:31, Christoph Hellwig wrote:
> On Fri, Mar 25, 2022 at 07:54:15PM +0900, Tetsuo Handa wrote:
> > > But for now I'd really prefer to stop moving the goalpost further and
> > > further.
> > 
> > Then, why not kill this code?
> 
> I think we should eventually do that, and I've indeed tested a patch
> that is only cosmetically different.  I wasn't really convinced we
> should do it in this series, but if there is consensus that we should
> do it now I can respin the series with a patch like this included.

I'd defer it to a separate patchset. Because as much as the change to
disallow LOOP_CLR_FD ioctl for used loop device makes sense, I'm not sure
there isn't some framework using loop devices somewhere which relies on
this just getting magically translated to setting LO_AUTOCLEAR flag. So IMO
this has a big potential of userspace visible regression and as such I'd
prefer doing it separately from the bugfixes.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

