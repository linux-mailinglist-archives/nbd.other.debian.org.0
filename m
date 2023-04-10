Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 161E76DC879
	for <lists+nbd@lfdr.de>; Mon, 10 Apr 2023 17:28:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BFF94207C7; Mon, 10 Apr 2023 15:28:02 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 10 15:28:02 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0516520533
	for <lists-other-nbd@bendel.debian.org>; Mon, 10 Apr 2023 15:27:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.563 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id H74n7MC_d6mG for <lists-other-nbd@bendel.debian.org>;
	Mon, 10 Apr 2023 15:27:49 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-124.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 054CE205B9
	for <nbd@other.debian.org>; Mon, 10 Apr 2023 15:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681140463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IgndDbBus1FBjf8ASfbBElDYeHMwdB4fP/mE3PdEmQc=;
	b=BrUYtF1thXse+/FjOpH5VZVxWJ2Z7OJCTKo8YwLoibSyA2vkj5SbG1/4IhoNPep4IKr8o7
	6Udw+RAHsJkcDLrZWNTZMfjxJoHaF8el8KAc63YhIeUV3S9P2GvIb9d+lUkH3EScf0AvKD
	kk6STd/vLiezY8ChO0ylB41hwtJ1zdY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-bN_ILFqeMsu6XmEjUw4mcw-1; Mon, 10 Apr 2023 11:27:41 -0400
X-MC-Unique: bN_ILFqeMsu6XmEjUw4mcw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E7893815F67;
	Mon, 10 Apr 2023 15:27:41 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.95])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4657D2166B30;
	Mon, 10 Apr 2023 15:27:40 +0000 (UTC)
Date: Mon, 10 Apr 2023 10:27:39 -0500
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, "Richard W . M . Jones" <rjones@redhat.com>
Subject: Re: [PATCH v2 1/3] docs: Prefer 'cookie' over 'handle'
Message-ID: <znam5jlldg73hkvfygkcaqbqjt2vvhzrapugwpwma7t6tganmo@xuqftept245y>
References: <20230309210623.2238671-1-eblake@redhat.com>
 <20230309210623.2238671-2-eblake@redhat.com>
 <ZAr8/hV1M8sS8hWt@pc220518.home.grep.be>
MIME-Version: 1.0
In-Reply-To: <ZAr8/hV1M8sS8hWt@pc220518.home.grep.be>
User-Agent: NeoMutt/20230322
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <o_hRQRrEO4I.A.cbB.CsCNkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2416
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/znam5jlldg73hkvfygkcaqbqjt2vvhzrapugwpwma7t6tganmo@xuqftept245y
Resent-Date: Mon, 10 Apr 2023 15:28:02 +0000 (UTC)

On Fri, Mar 10, 2023 at 11:48:46AM +0200, Wouter Verhelst wrote:
> So.
> 
> On Thu, Mar 09, 2023 at 03:06:21PM -0600, Eric Blake wrote:
> > In libnbd, we quickly learned that distinguishing between 'handle'
> > (verb for acting on an object) and 'handle' (noun describing which
> > object to act on) could get confusing; we solved it by renaming the
> > latter to 'cookie'.  Copy that approach into the NBD spec, and make it
> > obvious that a cookie is opaque data from the point of view of the
> > server.  Makes no difference to implementations (other than older code
> > still using 'handle' may be slightly harder to tie back to the spec).
> 
> One thing I didn't think about:
> 
> The kernel has a uapi include file that mentions "handle". That's where
> the name comes from, in fact: the nbd.h in the nbd project was
> originally not even there, we just required you either compile on Linux
> or copy the file somehow. It was so much of a bother that I eventually
> gave up on that and copied a (by now somewhat outdated and independently
> evolved) version of nbd.h into the nbd repository.
> 
> I'm still happy to make these changes, but we should consider what to do
> with the kernel and the uapi include file. Renaming it there is probably
> not going to happen; we might do some union or macro trickery to create
> an alias to "cookie" for the "handle" name, but I don't know what the
> kernel community is going to think about that.
> 
> Alternatively, perhaps we may have to tweak the wording a bit more to
> clarify that it's not just older code.

I've gone ahead and pushed this series (after rebasing it on top of
your structured reply work, and enhancing the commit messages), I'll
ping the kernel list again about the uapi header change proposed
there.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

