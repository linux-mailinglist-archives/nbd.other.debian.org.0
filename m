Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB1C57F5C8
	for <lists+nbd@lfdr.de>; Sun, 24 Jul 2022 17:30:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3AD66204FE; Sun, 24 Jul 2022 15:30:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jul 24 15:30:19 2022
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,RCVD_IN_DNSWL_LOW
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 358FD204F3
	for <lists-other-nbd@bendel.debian.org>; Sun, 24 Jul 2022 15:30:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.624 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.714,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_LOW=-0.7, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id WbDoTMgnVvrc for <lists-other-nbd@bendel.debian.org>;
	Sun, 24 Jul 2022 15:30:05 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id BD8A7204DA
	for <nbd@other.debian.org>; Sun, 24 Jul 2022 15:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658676600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vWlez7urKU5hd2ZTjYRUEO/mC8ZSDWoE8A5S2/Tsp9o=;
	b=bm6ob4cQWZwED2N2+xhidB1RlGKj3Z3D1VK5IdUzzvq8vaHo9ZPtSx0nCtwWwIw6vXAqF8
	UBLr8A4Ypg2xjU4/JQvbYozwQqRv3COzGLcY8DqiBuPa+6aRNLTcZWp+xbOgO+s70wZho2
	YG3Rn4V/oltqi5kAsjTwh5YSWevUuxg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-M9EK-lnZOmqvm3y4rAENIA-1; Sun, 24 Jul 2022 11:28:36 -0400
X-MC-Unique: M9EK-lnZOmqvm3y4rAENIA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 444CC101A54E;
	Sun, 24 Jul 2022 15:28:36 +0000 (UTC)
Received: from localhost (unknown [10.39.194.225])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 045E41415118;
	Sun, 24 Jul 2022 15:28:35 +0000 (UTC)
Date: Sun, 24 Jul 2022 16:28:35 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: Turakar <turakar23@gmail.com>, nbd@other.debian.org
Subject: Re: Setup NBD with TLS
Message-ID: <20220724152835.GB6837@redhat.com>
References: <618b6ab5-e275-6573-e00d-aa62019089bb@gmail.com>
 <0540e6c2-57c0-5c06-08e8-69be5b350201@gmail.com>
 <abab8c6e-1bba-8d89-3cde-cda678d785a7@gmail.com>
 <Yt0ru9B4fSraI90p@pc220518.home.grep.be>
 <20220724130432.GA6837@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220724130432.GA6837@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YCiwKV61Y6M.A.ONE.LWW3iB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2204
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220724152835.GB6837@redhat.com
Resent-Date: Sun, 24 Jul 2022 15:30:19 +0000 (UTC)

On Sun, Jul 24, 2022 at 02:04:32PM +0100, Richard W.M. Jones wrote:
> On Sun, Jul 24, 2022 at 01:23:39PM +0200, Wouter Verhelst wrote:
> > On Wed, Jul 20, 2022 at 11:37:45AM +0200, Turakar wrote:
> > >    Following the guide of nbdkit everything worked out.
> > > 
> > >    [1]https://libguestfs.org/nbdkit-tls.1.html
> >
> > Glad to hear everything is sorted.
> > 
> > Could you clarify how you managed to fix it in the end? I'm trying to
> > figure out which part of the documentation is unclear, so we can clarify
> > that for future users.
> 
> FYI the CI test we use for libnbd -> nbd-server uses these files/scripts:
> 
> https://gitlab.com/nbdkit/libnbd/-/blob/master/interop/nbd-server-tls.conf.in
> https://gitlab.com/nbdkit/libnbd/-/blob/master/tests/make-pki.sh
> https://gitlab.com/nbdkit/libnbd/-/blob/master/interop/Makefile.am#L87
> 
> I really need to add a CI test of nbd-client -> nbdkit, although I've
> had it working (with TLS) in the past.

Works fine, both plaintext and TLS:

https://gitlab.com/nbdkit/nbdkit/-/commit/9bbd6579de06764be46435c610213013182a8fa8

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

