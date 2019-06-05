Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7CF361A0
	for <lists+nbd@lfdr.de>; Wed,  5 Jun 2019 18:47:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3758C2045D; Wed,  5 Jun 2019 16:47:38 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  5 16:47:38 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D4116202F5
	for <lists-other-nbd@bendel.debian.org>; Wed,  5 Jun 2019 16:47:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OKnN9RIcX3Zl for <lists-other-nbd@bendel.debian.org>;
	Wed,  5 Jun 2019 16:47:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 50BA020379
	for <nbd@other.debian.org>; Wed,  5 Jun 2019 16:47:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFC343086246
	for <nbd@other.debian.org>; Wed,  5 Jun 2019 16:47:17 +0000 (UTC)
Received: from localhost (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E44A19C65;
	Wed,  5 Jun 2019 16:47:16 +0000 (UTC)
Date: Wed, 5 Jun 2019 17:47:14 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org
Subject: Re: [PATCH] docs: Recommend TCP_NODELAY (disabling Nagle)
Message-ID: <20190605164714.GF9368@redhat.com>
References: <20190530190825.14580-1-eblake@redhat.com>
 <5c971670-2fec-f26b-24c2-6c286c2250e9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c971670-2fec-f26b-24c2-6c286c2250e9@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 05 Jun 2019 16:47:23 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DQ7A_rS6KXC.A.xXD.qI_9cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/559
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190605164714.GF9368@redhat.com
Resent-Date: Wed,  5 Jun 2019 16:47:38 +0000 (UTC)

On Tue, Jun 04, 2019 at 12:38:43PM -0500, Eric Blake wrote:
> On 5/30/19 2:08 PM, Eric Blake wrote:
> > This text from https://en.wikipedia.org/wiki/Nagle%27s_algorithm
> > is telling:
> > 
> > "In any request-response application protocols where request data can
> > be larger than a packet, this can artificially impose a few hundred
> > milliseconds latency between the requester and the responder, even if
> > the requester has properly buffered the request data. Nagle's
> > algorithm should be disabled by the requester in this case. If the
> > response data can be larger than a packet, the responder should also
> > disable Nagle's algorithm so the requester can promptly receive the
> > whole response."
> > 
> > And we hit it in real life with libnbd/nbdkit - more than an order of
> > magnitude in slowdown results when trying to saturate a connection
> > with as many parallel requests as possible when Nagle's algorithm
> > introduces artificial delay waiting for the ACKs:
> > https://www.redhat.com/archives/libguestfs/2019-May/msg00237.html
> > 
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---
> >  doc/proto.md | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> 
> Hearing no comments, I'll go ahead and push this.

Yes this had a dramatic positive effect on performance.  My
loopback-over-TCP test was literally 33 times faster after enabling
this.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

