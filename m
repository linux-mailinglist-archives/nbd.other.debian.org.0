Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C8D243F5A
	for <lists+nbd@lfdr.de>; Thu, 13 Aug 2020 21:38:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3981C20493; Thu, 13 Aug 2020 19:38:02 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 13 19:38:02 2020
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9E74C203BA
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Aug 2020 19:37:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QlqX3JORcSaV for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Aug 2020 19:37:49 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by bendel.debian.org (Postfix) with ESMTP id BBB6D20486
	for <nbd@other.debian.org>; Thu, 13 Aug 2020 19:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597347464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jp8Gz5Grrv5iSaywhwre8M3Z9KKkz0Oomv5NVINF0Do=;
	b=Uh/kCd9ZNqvRD6x8pB4pzSG7yJ78XjokEunApgJKrCDg/voCSjBkUsuvyEeX+j4UDPmrHg
	1C8+yqVSHddCtlpevYumWNgRJNbdgWO7DEmT/EKNbIkb3NskWj9y2DzQxolpaLsAWQcnvU
	04nxsLrx6riZqQg4WXAvIAvdGwyWsBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-3gLsl-8lMeGnli5eYaVgfg-1; Thu, 13 Aug 2020 15:37:40 -0400
X-MC-Unique: 3gLsl-8lMeGnli5eYaVgfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7048D800683;
	Thu, 13 Aug 2020 19:37:39 +0000 (UTC)
Received: from localhost (ovpn-114-99.ams2.redhat.com [10.36.114.99])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1191A6FDB3;
	Thu, 13 Aug 2020 19:37:38 +0000 (UTC)
Date: Thu, 13 Aug 2020 20:37:38 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Garver <egarver@redhat.com>
Cc: Firewalld development list <firewalld-devel@lists.fedorahosted.org>,
	nbd@other.debian.org
Subject: Re: [PATCH firewalld] feat: service: add nbd (Network Block Device)
 service
Message-ID: <20200813193738.GY3888@redhat.com>
References: <20200813123854.967482-1-rjones@redhat.com>
 <20200813152831.GA5823@roberto>
 <12f630d0-edf6-399c-f907-bff288a21527@redhat.com>
 <20200813164715.xk52qsqbkvz4fl3g@egarver>
MIME-Version: 1.0
In-Reply-To: <20200813164715.xk52qsqbkvz4fl3g@egarver>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <HZ5fOL9My_E.A.TzG.aaZNfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/937
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200813193738.GY3888@redhat.com
Resent-Date: Thu, 13 Aug 2020 19:38:02 +0000 (UTC)

On Thu, Aug 13, 2020 at 12:47:15PM -0400, Eric Garver wrote:
> On Thu, Aug 13, 2020 at 11:25:18AM -0500, Eric Blake wrote:
> > On 8/13/20 10:28 AM, Eric Garver wrote:
> > > On Thu, Aug 13, 2020 at 01:38:54PM +0100, Richard W.M. Jones wrote:
> > > > ---
> > > >   config/Makefile.am      | 1 +
> > > >   config/services/nbd.xml | 6 ++++++
> > > >   po/POTFILES.in          | 1 +
> > > >   3 files changed, 8 insertions(+)
> > > 
> > > Thanks! I applied and pushed this upstream:
> > > 
> > >      8f562559dad8 ("feat: service: add nbd (Network Block Device)
> > >      service")
> > 
> > Unrelated question - why can't firewalld automatically support an implied
> > service for every listing in /etc/services, in order to reduce the number of
> > patches needed to config/services/*.xml which end up duplicating efforts?
> 
> You can do that.
> 
>     # firewall-cmd --add-port gopher/tcp
>     success
> 
> Internally it uses socket.getservbyname() [1].

I was initially prompted to provide this patch because I thought that
this would work in public.xml, but it did not:

 <service name="nbd"/>

Of course the equivalent <port port="nbd" protocol="tcp"/> works, but
it seems as if the same information is present in /etc/services
already.

Rich.

> Unfortunately listing the ports doesn't do the reverse translation, but
> this could be addressed.
> 
>     # firewall-cmd --list-ports
>     70/tcp
> 
> Services are useful if you want to open a collection of ports or the
> service needs conntrack helpers.
> 
> [1]: https://docs.python.org/3/library/socket.html#socket.getservbyname

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

