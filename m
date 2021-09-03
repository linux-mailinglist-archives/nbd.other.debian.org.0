Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1973FFFF0
	for <lists+nbd@lfdr.de>; Fri,  3 Sep 2021 14:43:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D4D5B20B7B; Fri,  3 Sep 2021 12:43:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Sep  3 12:43:58 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EF96820B78
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Sep 2021 12:43:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.628 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.747, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9Fz2YHn2CpYT for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Sep 2021 12:43:45 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 5A63420B77
	for <nbd@other.debian.org>; Fri,  3 Sep 2021 12:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630673020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NPKKUdoFRPJr9svDTlFWX6fiCnbBBZPJzPb4SfyK7yE=;
	b=OljDLTNq2iNDLzUtsEfuV4YE/491Jxtm0oXAxwmkOlQz6J/+gSnW3wC30EY+yRMz/HNb28
	tC8EM2EokrRxC7L89A6YwBtiChkekQqgTUWi7WF8RES4xqYjXGpnXwXATLeO46BrflS2vz
	IpmpebRzq28sZlV6vgRk8N4dVOqhl2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-PV4-NEZxNVuxGwjPJ9qMIw-1; Fri, 03 Sep 2021 08:43:30 -0400
X-MC-Unique: PV4-NEZxNVuxGwjPJ9qMIw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BC62107ACCA;
	Fri,  3 Sep 2021 12:43:29 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E22CC18038;
	Fri,  3 Sep 2021 12:43:28 +0000 (UTC)
Date: Fri, 3 Sep 2021 07:43:27 -0500
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH] maint: Nicer warning if autoconf-archive not available
Message-ID: <20210903124327.mahmnepexzinijpl@redhat.com>
References: <20210902181743.935724-1-eblake@redhat.com>
 <YTHzGiXennqn+nDc@pc181009.grep.be>
MIME-Version: 1.0
In-Reply-To: <YTHzGiXennqn+nDc@pc181009.grep.be>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <MukkkOupM3H.A.ebE.OihMhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1372
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210903124327.mahmnepexzinijpl@redhat.com
Resent-Date: Fri,  3 Sep 2021 12:43:58 +0000 (UTC)

On Fri, Sep 03, 2021 at 12:04:10PM +0200, Wouter Verhelst wrote:
> > With this change, the error changes to:
> > 
> > configure.ac:117: error: possibly undefined macro: AX_PROG_BISON
> >       If this token and others are legitimate, please use m4_pattern_allow.
> >       See the Autoconf documentation.
> > 
> > which is still not a direct finger pointing to missing
> > autoconf-archives, but at least provides more relevant hits in a
> > google search for how to resolve it (compared to recommended remedies
> > for the first message).
> 
> I've used
> 
> m4_ifdef([AX_CXX_COMPILE_STDCXX_11],,
>  [m4_fatal([The m4 macro AX_CXX_COMPILE_STDCXX_11 has not been defined. Please install the autoconf-archive package.])])
> 
> in a different project, which produces a more helpful error message that
> does point directly to the missing package and the correct solution.

Indeed, that's even nicer!

I would have written
m4_ifndef([AX_...],
  [m4_fatal([...])])

for one less empty argument, but that's cosmetic.  No point in further
tweaking what you pushed.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

