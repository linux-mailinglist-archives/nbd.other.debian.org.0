Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 677C8285391
	for <lists+nbd@lfdr.de>; Tue,  6 Oct 2020 23:04:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 48F91203B0; Tue,  6 Oct 2020 21:04:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct  6 21:04:10 2020
Old-Return-Path: <josh@joshtriplett.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1972E203AC
	for <lists-other-nbd@bendel.debian.org>; Tue,  6 Oct 2020 21:04:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.681 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HGoBVG4kO_xl for <lists-other-nbd@bendel.debian.org>;
	Tue,  6 Oct 2020 21:03:57 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .joshtriplett. - helo: .relay12.mail.gandi. - helo-domain: .gandi.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A8DC4203A1
	for <nbd@other.debian.org>; Tue,  6 Oct 2020 21:03:57 +0000 (UTC)
Received: from localhost (unknown [67.5.25.97])
	(Authenticated sender: josh@joshtriplett.org)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id E029A200008;
	Tue,  6 Oct 2020 21:03:52 +0000 (UTC)
Date: Tue, 6 Oct 2020 14:03:49 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org
Subject: Re: [PATCH 1/2] Add option to treat device as read-only
Message-ID: <20201006210349.GA16846@localhost>
References: <20200701071038.GA301687@localhost>
 <20201002200453.GA286250@localhost>
 <20201006163654.GA5804@pc181009.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006163654.GA5804@pc181009.grep.be>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <VMgGgmwHWBM.A.PND.KvNffB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1011
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20201006210349.GA16846@localhost
Resent-Date: Tue,  6 Oct 2020 21:04:10 +0000 (UTC)

On Tue, Oct 06, 2020 at 06:36:54PM +0200, Wouter Verhelst wrote:
> On Fri, Oct 02, 2020 at 01:04:53PM -0700, Josh Triplett wrote:
> > Following up on this: I'm still interested in pursuing these two
> > patches. I'd love to get these merged, or find out what could be
> > improved to get them merged.
> 
> Sorry, this fell off my radar. I've just merged it.

Thank you! Once this gets into the Debian nbd-client package, this will
be incredibly helpful. I really appreciate it.

- Josh Triplett

