Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB1B7622B1
	for <lists+nbd@lfdr.de>; Tue, 25 Jul 2023 21:52:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2D396206B5; Tue, 25 Jul 2023 19:52:44 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul 25 19:52:44 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=4.0 tests=ATTENDEES_DBSPAM_BODY3,
	ATTENDEES_DBSPAM_BODY6,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SARE_MSGID_LONG45,SARE_MSGID_LONG50,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B2DAC205CB
	for <lists-other-nbd@bendel.debian.org>; Tue, 25 Jul 2023 19:52:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.57 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY3=1, ATTENDEES_DBSPAM_BODY6=1,
	BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6_cmQH6js1F8 for <lists-other-nbd@bendel.debian.org>;
	Tue, 25 Jul 2023 19:52:23 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 5E2FA204D8
	for <nbd@other.debian.org>; Tue, 25 Jul 2023 19:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690314737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5fjqiDf82gV2hYHKs9HcPB6nsfipqEYdGIqeNGNfIc0=;
	b=BmxCUIh5U3G/whYBwoEhY2LuimwKDgo640Ohbr0c6Qjrc+m+vqhPR+JZxTKLY3x2K2jNSz
	FYmY88CtcJMjK2pbO4Is0EWU79ICVa3mih1u+N6MuCX2PZzwZrWgrMouvgKv9wVZRs4Eh/
	+SlJxT05jm8gDQyAxAMmcQ3KO9nwLNA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-NYtwbA5HOPOmicMQ3DzhBg-1; Tue, 25 Jul 2023 15:52:16 -0400
X-MC-Unique: NYtwbA5HOPOmicMQ3DzhBg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3800F88D541;
	Tue, 25 Jul 2023 19:52:16 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.93])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AB272166B25;
	Tue, 25 Jul 2023 19:52:15 +0000 (UTC)
Date: Tue, 25 Jul 2023 14:52:13 -0500
From: Eric Blake <eblake@redhat.com>
To: Matt Panaro <matt.panaro@gmail.com>
Cc: nbd@other.debian.org
Subject: Re: patch to fix short-option for certfile (-F) in nbd-client
Message-ID: <jd2n4koiyfufrnoxuw2um77sqgtm2fyxkzp26t6qputhf3zaxg@qx2tlt7ozthq>
References: <CAAki=DWr+Kft898C=ABtmXdSyWhPoL55vO5fFjwoH-m6TNNoqQ@mail.gmail.com>
 <awg5aw5d357ljrbhmordwtfjmlhbqhhkqdcbv6y3femzpjq3ca@q4xlmzddloqj>
 <CAAki=DWH-BT8hJkb+n0TOhB9e7z7vAQoCWdUDgW-dT_vRF2ypA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAki=DWH-BT8hJkb+n0TOhB9e7z7vAQoCWdUDgW-dT_vRF2ypA@mail.gmail.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <TRIZSZo-0YP.A.hAC.MgCwkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2581
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/jd2n4koiyfufrnoxuw2um77sqgtm2fyxkzp26t6qputhf3zaxg@qx2tlt7ozthq
Resent-Date: Tue, 25 Jul 2023 19:52:44 +0000 (UTC)

On Tue, Jul 25, 2023 at 10:07:34AM -0400, Matt Panaro wrote:
> I like the second option that avoids the #else branches, even at the cost
> of losing the alphabetical ordering.  this is the first time I've submitted
> a code-change through email rather than e.g. GitHub, so I'm a bit uncertain
> about how to proceed. should I reply with an updated diff? start a new
> thread?

I generally start a new thread if posting a v2 patch, otherwise reply
to the existing thread when adding more ideas on where the development
might go.  Also, technical lists tend to favor inline replies (as I'm
doing here), rather than top-posting.

Although the project is hosted on gitlab, Wouter would be the one to
say whether he's comfortable with gitlab's pull request model, or
whether he still prefers patches by email (I personally find email
easier to work with, and am not sure I have the rights to approve a
gitlab pull request although I do have the rights to push your patch
on your behalf if it came through email and is ready to go).  There
are ways for a maintainer to use an email-based flow even when
contributors prefer a gitlab-based UI flow, but not all projects are
set up that way.

> also, who would I ask for/how would I get the "signed off by"?

Git has the notion of a 'Signed-off-by:' tag that can be added to a
commit with project-dependent semantics; 'git commit --amend -s' is
one easy way to add it to an existing patch.  The Linux kernel has
well-defined semantics for what it means[1] (the tl;dr: "adding S-o-b
is a legal statement that my patch won't break the kernel's license"),
but other projects are laxer and some will accept submissions without
S-o-b.  Given how the nbd project is at the intersection of kernel and
userspace code, I personally use S-o-b for patches here, but Wouter as
the project owner has final say on whether it is a hard requirement
for NBD (you can find older commits in nbd.git that lacked one, and
'git grep -i "certificate of origin"' has no hits yet).

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html?highlight=signed%20off#sign-your-work-the-developer-s-certificate-of-origin

> 
> one more thing: there's a slightly larger additional change/feature I'd
> like to implement: is the correct thing to do start a codeless discussion
> on the mailing list? or just send a larger diff (with appropriate
> references to commit-hashes)?

Either is fine for me - getting consensus on the general idea of the
feature before spending time writing the patches may be the smoothest
path forward, but sometimes patches speak for themselves.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

