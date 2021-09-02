Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8AC3FF31A
	for <lists+nbd@lfdr.de>; Thu,  2 Sep 2021 20:17:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A72B220866; Thu,  2 Sep 2021 18:17:42 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep  2 18:17:42 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DEEFC20503
	for <lists-other-nbd@bendel.debian.org>; Thu,  2 Sep 2021 18:17:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.528 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.747, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xgZeUw8mD6GK for <lists-other-nbd@bendel.debian.org>;
	Thu,  2 Sep 2021 18:17:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 78463205CE
	for <nbd@other.debian.org>; Thu,  2 Sep 2021 18:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630606645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cBcXWMJlFEYsIgIpGxR/d3/09Zi4x7bQKv0tBPSuyB8=;
	b=JtcuP441wyIcMhj3KuH+1ly3ajs7WzgAWU/SVpWBmHZ9eRxVOgaDHstNxh9QpghVh7fP26
	lPurhHxcdtiUlGnB/SzfdxXGoPoHPCNEyl6Uew/X2MvQ+kasXGnnZiVKRYqfwAXirTt3k0
	TBtkgqHxjfE/fNebrart19JD10UxyvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-ExlY1fC4PeO85REat3IghQ-1; Thu, 02 Sep 2021 14:17:11 -0400
X-MC-Unique: ExlY1fC4PeO85REat3IghQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92575188E3C1;
	Thu,  2 Sep 2021 18:17:10 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29B1B1AC18;
	Thu,  2 Sep 2021 18:17:09 +0000 (UTC)
Date: Thu, 2 Sep 2021 13:17:08 -0500
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: Luis Chamberlain <mcgrof@kernel.org>, nbd@other.debian.org
Subject: Re: [PATCH] configure.ac: fix complaint by automake of missing
 AC_PROG_YACC
Message-ID: <20210902181708.xewyaufbz6lpaa52@redhat.com>
References: <20210826193727.2578866-1-mcgrof@kernel.org>
 <YSpuo+PUXSb0cOjp@pc181009.grep.be>
MIME-Version: 1.0
In-Reply-To: <YSpuo+PUXSb0cOjp@pc181009.grep.be>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EKb0vk3YFyM.A.fLF.GVRMhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1359
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210902181708.xewyaufbz6lpaa52@redhat.com
Resent-Date: Thu,  2 Sep 2021 18:17:42 +0000 (UTC)

On Sat, Aug 28, 2021 at 07:13:07PM +0200, Wouter Verhelst wrote:
> Hi Luis,
> 
> On Thu, Aug 26, 2021 at 12:37:27PM -0700, Luis Chamberlain wrote:
> > If automake sees you have a Yacc source but YACC is undefined
> > it will complain.
> > 
> > Makefile.am: error: Yacc source seen but 'YACC' is undefined
> > Makefile.am:   The usual way to define 'YACC' is to add 'AC_PROG_YACC'
> > Makefile.am:   to 'configure.ac' and run 'autoconf' again.
> > autoreconf: automake failed with exit status:
> > 
> > The recommended way to resolve this is to use AC_PROG_YACC on configure.ac,
> > but that is only if we care for yacc. Since we clearly are not fans of
> > it and seem to prefer bison, add the missing m4 helper which defines
> > AX_PROG_BISON().
> 
> We already have that? It assumes you have the "autoconf-archive"
> library[1] of m4 macros installed, though.
> 
> [1] https://www.gnu.org/software/autoconf-archive/, or as packaged in
> most distributions.

Correct - if autoconf-archive is installed, 'autoreconf -i' will
automatically pick up AX_PROG_BISON into aclocal.m4.  We don't need to
add the file to the repo.  But what we CAN do is make the error
message (when autoconf-archive was NOT installed) more useful, by
specifically telling autoreconf that we want ALL autoconf-archive
macros to be expanded.  Patch to follow...

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

