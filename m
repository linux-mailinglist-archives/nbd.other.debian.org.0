Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAFC243D00
	for <lists+nbd@lfdr.de>; Thu, 13 Aug 2020 18:09:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B767D20425; Thu, 13 Aug 2020 16:09:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 13 16:09:19 2020
Old-Return-Path: <eric@garver.life>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=FROM_SUSPICIOUS_NTLD,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 858862024C
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Aug 2020 15:52:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FROM_SUSPICIOUS_NTLD=0.499,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id p4yAEzA9onp9 for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Aug 2020 15:52:38 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .garver. - helo: .relay8-d.mail.gandi. - helo-domain: .gandi.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3DA3520410
	for <nbd@other.debian.org>; Thu, 13 Aug 2020 15:52:37 +0000 (UTC)
X-Originating-IP: 69.14.212.82
Received: from roberto (d14-69-82-212.try.wideopenwest.com [69.14.212.82])
	(Authenticated sender: eric@garver.life)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 878E61BF207;
	Thu, 13 Aug 2020 15:52:34 +0000 (UTC)
Date: Thu, 13 Aug 2020 11:52:31 -0400
From: Eric Garver <eric@garver.life>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, firewalld-devel@lists.fedorahosted.org
Subject: Re: [PATCH firewalld] feat: service: add nbd (Network Block Device)
 service
Message-ID: <20200813155231.GB5823@roberto>
References: <20200813123854.967482-1-rjones@redhat.com>
 <20200813152831.GA5823@roberto>
 <20200813155017.GX3888@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813155017.GX3888@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ldV7om9KRwP.A.LT.vWWNfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/934
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200813155231.GB5823@roberto
Resent-Date: Thu, 13 Aug 2020 16:09:19 +0000 (UTC)

On Thu, Aug 13, 2020 at 04:50:17PM +0100, Richard W.M. Jones wrote:
> On Thu, Aug 13, 2020 at 11:28:31AM -0400, Eric Garver wrote:
> > On Thu, Aug 13, 2020 at 01:38:54PM +0100, Richard W.M. Jones wrote:
> > > ---
> > >  config/Makefile.am      | 1 +
> > >  config/services/nbd.xml | 6 ++++++
> > >  po/POTFILES.in          | 1 +
> > >  3 files changed, 8 insertions(+)
> > 
> > Thanks! I applied and pushed this upstream:
> > 
> >     8f562559dad8 ("feat: service: add nbd (Network Block Device)
> >     service")
> > 
> > The firewalld-devel list is defunct. Can you tell me where you found it
> > referenced so I can update/remove the reference?
> 
> Sure, it's mentioned on the website:
> 
> https://firewalld.org/contribute.html

Thanks. I've addressed the issues with the list - it should work again.
No need to remove it with the website now.

