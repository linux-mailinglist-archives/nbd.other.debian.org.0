Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 892986B4D49
	for <lists+nbd@lfdr.de>; Fri, 10 Mar 2023 17:38:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4F575206DF; Fri, 10 Mar 2023 16:38:53 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 10 16:38:53 2023
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
	by bendel.debian.org (Postfix) with ESMTP id CF50120530
	for <lists-other-nbd@bendel.debian.org>; Fri, 10 Mar 2023 16:38:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1hQcGlPS2a0b for <lists-other-nbd@bendel.debian.org>;
	Fri, 10 Mar 2023 16:38:33 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 4998F206DF
	for <nbd@other.debian.org>; Fri, 10 Mar 2023 16:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678466308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=93+pXV1mkXyuZTRTJpGo068zz1Kg/s4I6qCV3eo8j8c=;
	b=e68XTkhXoGSUSvema+g36G8XZQlAl9ai2ubJoEddXC7pyJ72qgS6YVX8e7vt1ccKqwRrfR
	rYn0cCGS0v9z2TmA4tEevuCAM/her4T7HiwjxQ6FraQm5dWqqNiSXO6E8rw0D84Atg1V2s
	TbcA5MmR4T1ZfdMINcdQkO7kqT+xq8U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-4tj_aEVpPBSTbM-8xV6kTA-1; Fri, 10 Mar 2023 11:38:26 -0500
X-MC-Unique: 4tj_aEVpPBSTbM-8xV6kTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8386B802D2E;
	Fri, 10 Mar 2023 16:38:26 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E6824014EB9;
	Fri, 10 Mar 2023 16:38:25 +0000 (UTC)
Date: Fri, 10 Mar 2023 10:38:24 -0600
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, "Richard W . M . Jones" <rjones@redhat.com>
Subject: Re: [PATCH v2 1/3] docs: Prefer 'cookie' over 'handle'
Message-ID: <20230310163824.ocxfrjyc7jdbkxsi@redhat.com>
References: <20230309210623.2238671-1-eblake@redhat.com>
 <20230309210623.2238671-2-eblake@redhat.com>
 <ZAr8/hV1M8sS8hWt@pc220518.home.grep.be>
MIME-Version: 1.0
In-Reply-To: <ZAr8/hV1M8sS8hWt@pc220518.home.grep.be>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <1VDVgZP-ZaM.A.ofC.d01CkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2368
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230310163824.ocxfrjyc7jdbkxsi@redhat.com
Resent-Date: Fri, 10 Mar 2023 16:38:53 +0000 (UTC)

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

Huh, I've never even tried to use that file.  I'll try my hand at
patching it to use an anonymous union allowing 'char handle[8]' and
'__be64 cookie' to coincide (doesn't change compilation of the kernel
code using handle, but lets user-space use cookie) - we'll see where
that goes (I do not have a track record of kernel commits to date).
Depending on what happens there, I'm happy to tweak this patch in
turn.

> 
> I'm still happy to make these changes, but we should consider what to do
> with the kernel and the uapi include file. Renaming it there is probably
> not going to happen; we might do some union or macro trickery to create
> an alias to "cookie" for the "handle" name, but I don't know what the
> kernel community is going to think about that.

I can wait a couple days for response from the kernel side.

> 
> Alternatively, perhaps we may have to tweak the wording a bit more to
> clarify that it's not just older code.
> 
> -- 
>      w@uter.{be,co.za}
> wouter@{grep.be,fosdem.org,debian.org}
> 
> I will have a Tin-Actinium-Potassium mixture, thanks.
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

