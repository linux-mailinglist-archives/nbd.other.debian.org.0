Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4F96B2F75
	for <lists+nbd@lfdr.de>; Thu,  9 Mar 2023 22:19:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 686A52066C; Thu,  9 Mar 2023 21:19:40 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar  9 21:19:40 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AA3DF2066A
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Mar 2023 21:19:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qx0G2Kr4B70H for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Mar 2023 21:19:22 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 1F04C20669
	for <nbd@other.debian.org>; Thu,  9 Mar 2023 21:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678396757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WAnSEQ4PKB9JD2BXCELrC2MFJAbKbmYtIdtcy+NewZY=;
	b=CCbfX+zDbIwlONb9ngGHqjeXbQ/r9E8JEYY9bByWrCCnGhuQpdmFfLkcGISwqpzswrNdHF
	bLJrD4exj5csB5KLIqjCBqv3xM0hPy8YsI+o2/BbHm2LU9W1utwropbyovNJRdVzLVyPtH
	WgD3IAO8UK9aH83w7+GqnIojpQBb1PE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-257AziXxMfK2SWillZUe1g-1; Thu, 09 Mar 2023 16:19:16 -0500
X-MC-Unique: 257AziXxMfK2SWillZUe1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C21B429AA3BC;
	Thu,  9 Mar 2023 21:19:15 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E1C12026D4B;
	Thu,  9 Mar 2023 21:19:15 +0000 (UTC)
Date: Thu, 9 Mar 2023 15:19:13 -0600
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org
Subject: Re: Structured replies in nbd-server
Message-ID: <20230309211913.wptrs2u4amjsq5re@redhat.com>
References: <ZAdyUMh80sxzluyX@pc220518.home.grep.be>
MIME-Version: 1.0
In-Reply-To: <ZAdyUMh80sxzluyX@pc220518.home.grep.be>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <sPvaQ2otEHE.A.B7F.s1kCkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2363
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230309211913.wptrs2u4amjsq5re@redhat.com
Resent-Date: Thu,  9 Mar 2023 21:19:40 +0000 (UTC)

On Tue, Mar 07, 2023 at 07:20:16PM +0200, Wouter Verhelst wrote:
> Hi,
> 
> I've finally been working on structured replies in nbd-server (what?
> it's only been 7 years), and today I managed to make it go through
> nbdkit's "nbddump" without crashing. (yay!)

'nbddump' comes from the libnbd project (client side), not nbdkit
(server side).  But the two are closely related ;) And I'm glad to see
that it helped you!

> 
> I'm currently not (yet) implementing any other features that depend on
> structured replies, but would like to see if people can poke holes in
> what I've done so far -- I'd like to find bugs before release, rather
> than after ;-)
> 
> The code is in the "structured" branch of
> https://github.com/NetworkBlockDevice/nbd and feedback is more than
> welcome.

Since you didn't post the code to the list, I've likewise only left my
review comments on the patches on github.  If we want to copy the
discussion to the list, I can do that too.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

