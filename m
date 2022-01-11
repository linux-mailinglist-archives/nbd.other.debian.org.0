Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 906FB48B938
	for <lists+nbd@lfdr.de>; Tue, 11 Jan 2022 22:15:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4E0C920169; Tue, 11 Jan 2022 21:15:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan 11 21:15:26 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0F8DA202FA
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Jan 2022 21:15:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.827 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id wkh9dXIdWB-3 for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Jan 2022 21:15:15 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id E670020169
	for <nbd@other.debian.org>; Tue, 11 Jan 2022 21:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641935710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I02dI1tIXHWGHmCVCx/gqR6BgeKj6I62CUwt2GfIIHU=;
	b=HnGlZ5Kgu18pB/nXtBXmmxP7+9fOpvK8vVe4ofrr09hdvdkik/yiON1x/B9kzeshCI4lAm
	VoA9XkGJvHmUVZhDkcItaMrU9fxY5tnZBKaAZiZSik/mMD7Co+98nAH65cUokZ/x3z25ph
	aOZEzuukULU6FfTW/aCh7SMqZB1NRu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-nILBqMdJPK6iX-HGDjm1_w-1; Tue, 11 Jan 2022 15:42:18 -0500
X-MC-Unique: nILBqMdJPK6iX-HGDjm1_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0CB385EE63;
	Tue, 11 Jan 2022 20:42:17 +0000 (UTC)
Received: from redhat.com (unknown [10.22.35.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2517D4E2CB;
	Tue, 11 Jan 2022 20:42:16 +0000 (UTC)
Date: Tue, 11 Jan 2022 14:42:14 -0600
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: Manfred Spraul <manfred@colorfullife.com>, nbd@other.debian.org
Subject: Re: datalog including written data?
Message-ID: <20220111204214.dswtdkpa3mfgvsbc@redhat.com>
References: <fe55642d-be5c-5800-88a2-6fb13c2d2004@colorfullife.com>
 <Yc7mIwx/k0/TS/1q@pc181009.grep.be>
MIME-Version: 1.0
In-Reply-To: <Yc7mIwx/k0/TS/1q@pc181009.grep.be>
User-Agent: NeoMutt/20211029-144-b77af0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3Mz0au6MEQJ.A.4iG.uNf3hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1672
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220111204214.dswtdkpa3mfgvsbc@redhat.com
Resent-Date: Tue, 11 Jan 2022 21:15:26 +0000 (UTC)

On Fri, Dec 31, 2021 at 01:14:43PM +0200, Wouter Verhelst wrote:
> 
> > b) As first observation:
> > 
> > https://github.com/NetworkBlockDevice/nbd/blob/master/nbd-server.c#L294
> > 
> > The server supports
> > 
> > NBD_CMD_READ, NBD_CMD_WRITE, NBD_CMD_DISC, NBD_CMD_FLUSH, NBD_CMD_TRIM,
> > NBD_CMD_WRITE_ZEROES
> > 
> > https://github.com/NetworkBlockDevice/nbd/blob/master/nbd-trdump.c#L71
> > 
> > The trace dump utility supports
> > 
> > NBD_CMD_READ, NBD_CMD_WRITE, NBD_CMD_DISC, NBD_CMD_FLUSH
> > 
> > -> TRIM and WRITE_ZEROES is missing.
> > 
> > 
> > Should I create a patch that adds TRIM and WRITE_ZEROES to nbd-trdump?
> 
> Yes, that might be nice. nbd-trdump hasn't been looked at in a while,
> which is why TRIM and WRITE_ZEROES haven't been added to it yet.

It may also be worth adding NBD_CMD_CACHE trace support, even if that
is not yet implemented in nbd-server.

That said, it looks like your use of nbd-server transactionlog and
nbd-trdump is to analyze what happened after the fact.  It would also
be possible to achieve the same goal (with trim and write_zeroes
support already working) by using nbdkit's log filter[1], where you
may also use nbdkit's nbd plugin[2] as an intermediary between any NBD
server and client in order to inject arbitrary nbdkit filters in the
chain.

[1] https://libguestfs.org/nbdkit-log-filter.1.html
[2] https://libguestfs.org/nbdkit-nbd-plugin.1.html

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

