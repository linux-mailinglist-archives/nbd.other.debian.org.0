Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAEA57F524
	for <lists+nbd@lfdr.de>; Sun, 24 Jul 2022 15:04:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 448032051C; Sun, 24 Jul 2022 13:04:56 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jul 24 13:04:56 2022
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_LOW autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4AA6320516
	for <lists-other-nbd@bendel.debian.org>; Sun, 24 Jul 2022 13:04:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.624 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.714, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_LOW=-0.7, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hetgt-8YunJq for <lists-other-nbd@bendel.debian.org>;
	Sun, 24 Jul 2022 13:04:43 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-124.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 34F6B20439
	for <nbd@other.debian.org>; Sun, 24 Jul 2022 13:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658667876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3q4MDJ1eLQafnVxHtRqy9iuWrYMDoZjbTjb6h4XdN/w=;
	b=Gp2abn/QptM8eFNfvJpKsLV4q5tT5p0wEC4rCq1ZAvWHssFVMbzeyLAZOEwgb8uJH02kTr
	cKDrDXAY0zE9Ch93sspZ5rUxxbljC4svGCIc9qExM5MQ7NIc+9fCqxkhzFmiSnJA1MLyOI
	blaYIkKt6bgW29wWZLpTQkO6wSKolG4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-Eb1GqnB6OBSq1RdZik0F8Q-1; Sun, 24 Jul 2022 09:04:34 -0400
X-MC-Unique: Eb1GqnB6OBSq1RdZik0F8Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F0F9801755;
	Sun, 24 Jul 2022 13:04:33 +0000 (UTC)
Received: from localhost (unknown [10.39.194.225])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24E061121314;
	Sun, 24 Jul 2022 13:04:32 +0000 (UTC)
Date: Sun, 24 Jul 2022 14:04:32 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: Turakar <turakar23@gmail.com>, nbd@other.debian.org
Subject: Re: Setup NBD with TLS
Message-ID: <20220724130432.GA6837@redhat.com>
References: <618b6ab5-e275-6573-e00d-aa62019089bb@gmail.com>
 <0540e6c2-57c0-5c06-08e8-69be5b350201@gmail.com>
 <abab8c6e-1bba-8d89-3cde-cda678d785a7@gmail.com>
 <Yt0ru9B4fSraI90p@pc220518.home.grep.be>
MIME-Version: 1.0
In-Reply-To: <Yt0ru9B4fSraI90p@pc220518.home.grep.be>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <cr15oaLoW.A.quB.4NU3iB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2203
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220724130432.GA6837@redhat.com
Resent-Date: Sun, 24 Jul 2022 13:04:56 +0000 (UTC)

On Sun, Jul 24, 2022 at 01:23:39PM +0200, Wouter Verhelst wrote:
> On Wed, Jul 20, 2022 at 11:37:45AM +0200, Turakar wrote:
> >    Following the guide of nbdkit everything worked out.
> > 
> >    [1]https://libguestfs.org/nbdkit-tls.1.html
>
> Glad to hear everything is sorted.
> 
> Could you clarify how you managed to fix it in the end? I'm trying to
> figure out which part of the documentation is unclear, so we can clarify
> that for future users.

FYI the CI test we use for libnbd -> nbd-server uses these files/scripts:

https://gitlab.com/nbdkit/libnbd/-/blob/master/interop/nbd-server-tls.conf.in
https://gitlab.com/nbdkit/libnbd/-/blob/master/tests/make-pki.sh
https://gitlab.com/nbdkit/libnbd/-/blob/master/interop/Makefile.am#L87

I really need to add a CI test of nbd-client -> nbdkit, although I've
had it working (with TLS) in the past.

To the original poster: I highly recommend exploring TLS-PSK, so much
easier to manage than certificates.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org

