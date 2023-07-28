Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4ED767322
	for <lists+nbd@lfdr.de>; Fri, 28 Jul 2023 19:21:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E5F122086D; Fri, 28 Jul 2023 17:21:01 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jul 28 17:21:01 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=4.0 tests=ATTENDEES_DBSPAM_BODY3,
	ATTENDEES_DBSPAM_BODY6,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A24A62050C
	for <lists-other-nbd@bendel.debian.org>; Fri, 28 Jul 2023 17:20:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.19 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY3=1, ATTENDEES_DBSPAM_BODY6=1,
	BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cqrPETF8-9ct for <lists-other-nbd@bendel.debian.org>;
	Fri, 28 Jul 2023 17:20:42 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E72E4204E2
	for <nbd@other.debian.org>; Fri, 28 Jul 2023 17:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=L2UnYkzi451NufjBkTwxJNwjTBwJzsJ4oAmv5qhLCCs=; b=dCVtfwbSf+VqkN1fc6f3uTEsQa
	SAZNARykGW/WIp1V14H/4ebR+yw+q1ZEfvzqDLs4n56f1RQ3ML9Dijqk0zUY7KVSfJc5SF0fUsFXe
	EeWbx96wgcUUAQvrcMKl62n5H62TdwI4Afdei077jECz9zHgtX1splkde21wVm04eLd4XT0fXLpNy
	rT7mrQbx5l5xNJq+iC9MtdV1dzvIaLPaLrY/l8C3KFZTRLCJ3j0UEMzyUvCL3my8vQR2MHu1cZaUa
	1N45GL5gqjnoo9dbict+/gzU1Ytz8yAyr4ZSUAXR8ev20Zc0S3ePRgEEOKxJfSfUg2EDxWLSWU/3T
	WUo063cg==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1qPR8o-00DLch-23; Fri, 28 Jul 2023 19:20:37 +0200
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1qPR8g-000Ryi-0W;
	Fri, 28 Jul 2023 19:20:30 +0200
Date: Fri, 28 Jul 2023 19:20:29 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: Matt Panaro <matt.panaro@gmail.com>, nbd@other.debian.org
Subject: Re: patch to fix short-option for certfile (-F) in nbd-client
Message-ID: <ZMP43TieixQqsFH5@pc220518.home.grep.be>
References: <CAAki=DWr+Kft898C=ABtmXdSyWhPoL55vO5fFjwoH-m6TNNoqQ@mail.gmail.com>
 <awg5aw5d357ljrbhmordwtfjmlhbqhhkqdcbv6y3femzpjq3ca@q4xlmzddloqj>
 <CAAki=DWH-BT8hJkb+n0TOhB9e7z7vAQoCWdUDgW-dT_vRF2ypA@mail.gmail.com>
 <jd2n4koiyfufrnoxuw2um77sqgtm2fyxkzp26t6qputhf3zaxg@qx2tlt7ozthq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jd2n4koiyfufrnoxuw2um77sqgtm2fyxkzp26t6qputhf3zaxg@qx2tlt7ozthq>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <uIRSODD9rsL.A.A3H.9j_wkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2583
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZMP43TieixQqsFH5@pc220518.home.grep.be
Resent-Date: Fri, 28 Jul 2023 17:21:01 +0000 (UTC)

Hi Eric,

On Tue, Jul 25, 2023 at 02:52:13PM -0500, Eric Blake wrote:
> On Tue, Jul 25, 2023 at 10:07:34AM -0400, Matt Panaro wrote:
> > I like the second option that avoids the #else branches, even at the cost
> > of losing the alphabetical ordering.  this is the first time I've submitted
> > a code-change through email rather than e.g. GitHub, so I'm a bit uncertain
> > about how to proceed. should I reply with an updated diff? start a new
> > thread?
> 
> I generally start a new thread if posting a v2 patch, otherwise reply
> to the existing thread when adding more ideas on where the development
> might go.  Also, technical lists tend to favor inline replies (as I'm
> doing here), rather than top-posting.
> 
> Although the project is hosted on gitlab, Wouter would be the one to
> say whether he's comfortable with gitlab's pull request model,

I'm not really opposed to pull requests, but given that there are more
people reading this mailinglist than there are who review pull requests,
for larger patches sending them here is preferred.

IOW, trivial, obviously-correct, patches like the one at the head of
this thread are fine through the github PR workflow, but for larger
things, send them to this list instead.

> or whether he still prefers patches by email (I personally find email
> easier to work with, and am not sure I have the rights to approve a
> gitlab pull request although I do have the rights to push your patch
> on your behalf if it came through email and is ready to go).

I believe you do have the relevant rights to do that, although only you
would be able to check :-)

> There are ways for a maintainer to use an email-based flow even when
> contributors prefer a gitlab-based UI flow, but not all projects are
> set up that way.

Github has some form of "subscribe" button somewhere in the UI which
makes all PRs be sent through email, too. Although then you don't get
the patch and you'll have to manually pull the branch from the PR. A bit
more involved. I don't see it as a replacement, really.

> > also, who would I ask for/how would I get the "signed off by"?
> 
> Git has the notion of a 'Signed-off-by:' tag that can be added to a
> commit with project-dependent semantics; 'git commit --amend -s' is
> one easy way to add it to an existing patch.  The Linux kernel has
> well-defined semantics for what it means[1] (the tl;dr: "adding S-o-b
> is a legal statement that my patch won't break the kernel's license"),
> but other projects are laxer and some will accept submissions without
> S-o-b.  Given how the nbd project is at the intersection of kernel and
> userspace code, I personally use S-o-b for patches here, but Wouter as
> the project owner has final say on whether it is a hard requirement
> for NBD (you can find older commits in nbd.git that lacked one, and
> 'git grep -i "certificate of origin"' has no hits yet).

I tend to agree that it's probably a good idea to have them for NBD, but
I keep forgetting to add them myself, and so it seems... improper? to
then require it from others ;-)

[...]
> > one more thing: there's a slightly larger additional change/feature I'd
> > like to implement: is the correct thing to do start a codeless discussion
> > on the mailing list? or just send a larger diff (with appropriate
> > references to commit-hashes)?
> 
> Either is fine for me - getting consensus on the general idea of the
> feature before spending time writing the patches may be the smoothest
> path forward, but sometimes patches speak for themselves.

Agreed. If you're not sure whether your patch would even be accepted and
want to discuss the general idea first, that's certainly welcome. If you
just send a patch and it's not quite what I would like to see, however,
I'm happy to work with you to massage it into something that will be
more acceptable.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

