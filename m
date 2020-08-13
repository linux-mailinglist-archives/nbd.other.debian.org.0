Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F236243E65
	for <lists+nbd@lfdr.de>; Thu, 13 Aug 2020 19:36:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 646802044D; Thu, 13 Aug 2020 17:36:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 13 17:36:09 2020
Old-Return-Path: <egarver@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D3010203DD
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Aug 2020 17:18:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Vtw6X_6XjTjZ for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Aug 2020 17:18:16 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by bendel.debian.org (Postfix) with ESMTP id 3DCC820304
	for <nbd@other.debian.org>; Thu, 13 Aug 2020 17:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597339091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DTNlo/3A8czd9XPWCn43P7x6/SWZrsu40NZ6TSX3elE=;
	b=YwVfnUXxthob+Re0rvqiBNvbO/GieHhmha7yVxFf8o70RDAkGRvuTY8kaXbCKyG5/VIkCV
	VWM5Ti291NKaK3fi8gpgoZkAYkdzDpXSvKng7HziM4OoxfsWC5ExBAKrra77lG5LoGwkOa
	4UqjLggcWWnfnZ3J0r5YAP0ezK+7qzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-XHKq7tEINNWiv4YMC9Ug8g-1; Thu, 13 Aug 2020 12:47:17 -0400
X-MC-Unique: XHKq7tEINNWiv4YMC9Ug8g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 553A3801AD9;
	Thu, 13 Aug 2020 16:47:16 +0000 (UTC)
Received: from localhost (ovpn-115-40.rdu2.redhat.com [10.10.115.40])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 214DF5DA66;
	Thu, 13 Aug 2020 16:47:16 +0000 (UTC)
Date: Thu, 13 Aug 2020 12:47:15 -0400
From: Eric Garver <egarver@redhat.com>
To: Firewalld development list <firewalld-devel@lists.fedorahosted.org>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org
Subject: Re: [PATCH firewalld] feat: service: add nbd (Network Block Device)
 service
Message-ID: <20200813164715.xk52qsqbkvz4fl3g@egarver>
References: <20200813123854.967482-1-rjones@redhat.com>
 <20200813152831.GA5823@roberto>
 <12f630d0-edf6-399c-f907-bff288a21527@redhat.com>
MIME-Version: 1.0
In-Reply-To: <12f630d0-edf6-399c-f907-bff288a21527@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=egarver@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ER3KWH54PlC.A.v_C.JoXNfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/936
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200813164715.xk52qsqbkvz4fl3g@egarver
Resent-Date: Thu, 13 Aug 2020 17:36:09 +0000 (UTC)

On Thu, Aug 13, 2020 at 11:25:18AM -0500, Eric Blake wrote:
> On 8/13/20 10:28 AM, Eric Garver wrote:
> > On Thu, Aug 13, 2020 at 01:38:54PM +0100, Richard W.M. Jones wrote:
> > > ---
> > >   config/Makefile.am      | 1 +
> > >   config/services/nbd.xml | 6 ++++++
> > >   po/POTFILES.in          | 1 +
> > >   3 files changed, 8 insertions(+)
> > 
> > Thanks! I applied and pushed this upstream:
> > 
> >      8f562559dad8 ("feat: service: add nbd (Network Block Device)
> >      service")
> 
> Unrelated question - why can't firewalld automatically support an implied
> service for every listing in /etc/services, in order to reduce the number of
> patches needed to config/services/*.xml which end up duplicating efforts?

You can do that.

    # firewall-cmd --add-port gopher/tcp
    success

Internally it uses socket.getservbyname() [1].

Unfortunately listing the ports doesn't do the reverse translation, but
this could be addressed.

    # firewall-cmd --list-ports
    70/tcp

Services are useful if you want to open a collection of ports or the
service needs conntrack helpers.

[1]: https://docs.python.org/3/library/socket.html#socket.getservbyname

