Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5C86B9FFB
	for <lists+nbd@lfdr.de>; Tue, 14 Mar 2023 20:48:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B8ADE20472; Tue, 14 Mar 2023 19:48:52 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 14 19:48:52 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 0B66A2046F
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Mar 2023 19:48:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ePJUe6NzFIxt for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Mar 2023 19:48:33 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 2EBDB2046E
	for <nbd@other.debian.org>; Tue, 14 Mar 2023 19:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678823307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+vD1hTPmpfoYfjcw2L6T82uF4C58JvJXfmoViMGKRDk=;
	b=NhFrczodQOSRkjrOzSfVWL7iBYancvv+EhmRYYSp08VPlBRA9hL96bAAXTJ9K0iAk94M5e
	kdjpuSBTrvIqL88CiqJ7xMjxdDLXy5ATuUnzcHb8VAt9BTvZkbM48EbZDwr79vx2AjvKu+
	Pe4RbBCv6IiEEQxrNmEredlcJA8dJIY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-p5HJaO0UPQOvdirX1iZm3Q-1; Tue, 14 Mar 2023 15:48:26 -0400
X-MC-Unique: p5HJaO0UPQOvdirX1iZm3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 477D8811E9C;
	Tue, 14 Mar 2023 19:48:26 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2E03202701E;
	Tue, 14 Mar 2023 19:48:25 +0000 (UTC)
Date: Tue, 14 Mar 2023 14:48:24 -0500
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org
Subject: Re: [PATCH 1/3] uapi nbd: improve doc links to userspace spec
Message-ID: <20230314194824.2q6i5jooefxpwciy@redhat.com>
References: <20230310201525.2615385-1-eblake@redhat.com>
 <20230310201525.2615385-2-eblake@redhat.com>
 <ZBAg7+djXnGMd+b4@pc220518.home.grep.be>
MIME-Version: 1.0
In-Reply-To: <ZBAg7+djXnGMd+b4@pc220518.home.grep.be>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xrXIgojzLJN.A.MhB.k-MEkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2391
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230314194824.2q6i5jooefxpwciy@redhat.com
Resent-Date: Tue, 14 Mar 2023 19:48:52 +0000 (UTC)

On Tue, Mar 14, 2023 at 09:23:27AM +0200, Wouter Verhelst wrote:
> Hi Eric,
> 
> On Fri, Mar 10, 2023 at 02:15:23PM -0600, Eric Blake wrote:
> > The documentation file also had a stale link to sourceforge; nbd
> > ditched that several years ago in favor of github.
> 
> While it's accurate to say that we've mostly moved to github, I wouldn't
> describe the sourceforge link as "stale"; I've kept the information on
> that landing page generally up-to-date over the years (the most recent
> change was the addition of the link to Ceph for Windows for a Windows
> NBD client, in 2020), and I do still post file releases on sourceforge,
> primarily.
> 
> However, I guess it's been long enough, and there isn't really anything
> that sourceforge can provide us which github can't, so I suppose we
> might as well.
> 
> Since there is some stuff on that landing page that is currently nowhere
> else, I propose the following patch; comments are welcome. After that,
> I'm happy to move the link from the kernel documentation to github.

So for v2 of the kernel patch, should I split this into two parts -
one to add the spec link in <linux/nbd.h> (that one necessarily to
github.com), the other to tweak the README (where we delay pushing
that one until you are happy that github sufficiently replaces
sf.com)?

> 
> While we're at it, I noticed that the link to nbd.txt in the qemu
> section of doc/proto.md now redirects to gitlab.com, but not to the
> specific file anymore. I've updated that link.
> 
> diff --git a/README.md b/README.md
> index c091406..95df263 100644
> --- a/README.md
> +++ b/README.md
> @@ -21,6 +21,15 @@ If you want to send a patch, please do not open a pull request; instead, send
>  it to the
>  [mailinglist](https://lists.debian.org/nbd)

The README changes to nbd.git look fine to me.

(Always makes me do a double-take to see WHICH readme is being
updated, when we are cross-posting mails to two projects that both use
the file name)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

