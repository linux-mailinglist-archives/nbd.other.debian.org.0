Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D34784EA836
	for <lists+nbd@lfdr.de>; Tue, 29 Mar 2022 08:57:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8F85521034; Tue, 29 Mar 2022 06:57:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 29 06:57:09 2022
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=4.0 tests=CC_TOO_MANY,FOURLA,
	MURPHY_DRUGS_REL8,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 99A2C2108D
	for <lists-other-nbd@bendel.debian.org>; Tue, 29 Mar 2022 06:39:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.11 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id oK3EKGEC507H for <lists-other-nbd@bendel.debian.org>;
	Tue, 29 Mar 2022 06:39:27 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A799D2108A
	for <nbd@other.debian.org>; Tue, 29 Mar 2022 06:39:27 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3797168AFE; Tue, 29 Mar 2022 08:39:22 +0200 (CEST)
Date: Tue, 29 Mar 2022 08:39:21 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	Dave Chinner <david@fromorbit.com>, Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH 12/13] loop: remove lo_refcount and avoid lo_mutex in
 ->open / ->release
Message-ID: <20220329063921.GA19778@lst.de>
References: <20220324075119.1556334-1-hch@lst.de> <20220324075119.1556334-13-hch@lst.de> <20220324141321.pqesnshaswwk3svk@quack3.lan> <96a4e2e7-e16e-7e89-255d-8aa29ffca68b@I-love.SAKURA.ne.jp> <20220324172335.GA28299@lst.de> <0b47dbee-ce17-7502-6bf3-fad939f89bb7@I-love.SAKURA.ne.jp> <20220325162331.GA16355@lst.de> <20220328083045.ryoh7rbhauxgezgn@quack3.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328083045.ryoh7rbhauxgezgn@quack3.lan>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JGNUTMcpv0L.A.rKB.F3qQiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1815
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220329063921.GA19778@lst.de
Resent-Date: Tue, 29 Mar 2022 06:57:09 +0000 (UTC)

On Mon, Mar 28, 2022 at 10:30:45AM +0200, Jan Kara wrote:
> On Fri 25-03-22 17:23:31, Christoph Hellwig wrote:
> > On Fri, Mar 25, 2022 at 07:54:15PM +0900, Tetsuo Handa wrote:
> > > > But for now I'd really prefer to stop moving the goalpost further and
> > > > further.
> > > 
> > > Then, why not kill this code?
> > 
> > I think we should eventually do that, and I've indeed tested a patch
> > that is only cosmetically different.  I wasn't really convinced we
> > should do it in this series, but if there is consensus that we should
> > do it now I can respin the series with a patch like this included.
> 
> I'd defer it to a separate patchset. Because as much as the change to
> disallow LOOP_CLR_FD ioctl for used loop device makes sense, I'm not sure
> there isn't some framework using loop devices somewhere which relies on
> this just getting magically translated to setting LO_AUTOCLEAR flag. So IMO
> this has a big potential of userspace visible regression and as such I'd
> prefer doing it separately from the bugfixes.

At least my idea would not be to disallow LOOP_CLR_FD on a used block
devices as that would go back to the udev problems before Dave turned
it into a magic LO_AUTOCLEAR.  But to remove the lo_refcnt check
entirely, as loop_clr_fd now is safe against concurrent users - it
has to anyway as there can be other users even without an open.

> 
> 								Honza
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
---end quoted text---

