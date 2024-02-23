Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB34861727
	for <lists+nbd@lfdr.de>; Fri, 23 Feb 2024 17:10:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4643721414; Fri, 23 Feb 2024 16:10:57 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb 23 16:10:57 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 203492140D
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Feb 2024 16:10:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.491 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.002, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id f3JOhq1y1t8j for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Feb 2024 16:10:38 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id E438D21401
	for <nbd@other.debian.org>; Fri, 23 Feb 2024 16:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708704632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GDOAzHSeWbX7wrx8kxXRUk78ytMetonCflRo4CMedB8=;
	b=UBRN9ugKcVfNuo8dDCVcJS1TnZmG3+uBFu2irq/mcSNAfbFK61mhSi+wW9KFXZcSTRgyfJ
	otGs0FcWrpWuZJpfcrQea8KnnTyIkIDl9pSxrd3OJGv3BcKhhC2uhav/5HdKNv+Fuxl9bG
	Z+cWJLkFlEebnu9Mbndpq0YPsp9EoLc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-244-35VvTBNQPTeBDr0ZfY7stQ-1; Fri,
 23 Feb 2024 11:10:28 -0500
X-MC-Unique: 35VvTBNQPTeBDr0ZfY7stQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF8593C0F1AA;
	Fri, 23 Feb 2024 16:10:27 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.61])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10FC91121337;
	Fri, 23 Feb 2024 16:10:26 +0000 (UTC)
Date: Fri, 23 Feb 2024 10:10:24 -0600
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: Lukasz Stelmach <l.stelmach@samsung.com>, nbd@other.debian.org, 
	Karol Lewandowski <k.lewandowsk@samsung.com>, =?utf-8?B?7J6s7ZuIIOyglQ==?= <jh80.chung@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Marek Pikula <m.pikula@partner.samsung.com>
Subject: Re: Fixes after static code analysis
Message-ID: <sckh6gmkef4ujvrzasopaat5ezz6pkvocmgkwkl6jcfbzek6gf@ahwc3iwsbcoy>
References: <ZdSVsGq3u83Z6w-V@pc220518.home.grep.be>
 <CGME20240222113509eucas1p1f1590778e4d4144d19b6a2d6df65fba5@eucas1p1.samsung.com>
 <oypijdcysohgv1.fsf%l.stelmach@samsung.com>
 <ZdhdeAVU9u1ZWnI4@pc220518.home.grep.be>
 <lu32cn26bocoaeotvzi2fsfrzavit7vo7vfc7yfvyil54isx7q@h43s2jqjmqmp>
MIME-Version: 1.0
In-Reply-To: <lu32cn26bocoaeotvzi2fsfrzavit7vo7vfc7yfvyil54isx7q@h43s2jqjmqmp>
User-Agent: NeoMutt/20240201
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XP3QlTIfCAG.A.hKD.ROM2lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2770
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/sckh6gmkef4ujvrzasopaat5ezz6pkvocmgkwkl6jcfbzek6gf@ahwc3iwsbcoy
Resent-Date: Fri, 23 Feb 2024 16:10:57 +0000 (UTC)

On Fri, Feb 23, 2024 at 09:08:49AM -0600, Eric Blake wrote:
> On Fri, Feb 23, 2024 at 10:55:20AM +0200, Wouter Verhelst wrote:
> > Hi Lukasz,
> > 
> > 
> > I've merged your branch, but removed those two commits (the original and
> > the revert).
> 
> FWIW, your branch temporarily broke the doc/proto.md rendering by
> removing trailing whitespace that was essential to a correct Markdown
> rendering; I've reverted that portion of your changes.  (Why markdown
> treats trailing whitespace as essential is beyond me - using something
> that is not visible to affect the ultimate visual layout is
> mind-boggling.)

Another side-effect of your series: after 'make', I'm now left with a
'man/NBDTAB.5' file not under version control; according to
.gitignore, we used to have man/nbdtab.5.  Creating files that differ
only in case is a recipe for disaster when building on a FAT or HFS
filesystem.  What's more, people really do want to do 'man nbdtab',
not 'man NBDTAB'.  It looks like commit 6ca4b637 is to blame; can you
provide a followup patch that restores the man page generation to
create the correct filename?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

