Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 366DD454303
	for <lists+nbd@lfdr.de>; Wed, 17 Nov 2021 09:54:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1C9062024E; Wed, 17 Nov 2021 08:54:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Nov 17 08:54:43 2021
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D11DA20244
	for <lists-other-nbd@bendel.debian.org>; Wed, 17 Nov 2021 08:54:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id UKkvav6aVCi8 for <lists-other-nbd@bendel.debian.org>;
	Wed, 17 Nov 2021 08:54:28 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id EC78720144
	for <nbd@other.debian.org>; Wed, 17 Nov 2021 08:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0lAeUjgZLtShG30xTJiLn8uHOC4oJu6vSMvYCSKIq90=; b=B75IqUgsEijUf0KX23yb0g4YqD
	qUMH+vxIlJ0U8HfVZuvhXtSi+QP8yJyM1fGcr+6xbE15YZoKdACixDziEyfwo+OXj7EAbL7FN6G4B
	7GgyHY7XQp0Vta72D3ljWMh94LIFVA4l4+GIkPEKQpzYtUwXpZPjMxvVv4rZl9Hqq5KgmBCyzILnv
	4NGG9ZXKqnkoxqZJtiFwDqG86bqJNnYf/0SwB9avyUoFRM9r7Rmi+zk83aCwE4SXd7G4nR19ADm2Y
	vUr3r6qN0QWzymk1DYFQbFTLNLdVlXWZLsDkC17HPVdKUsNVz8rBM3UZNBiibFxtRhUFkyrqhxesD
	Ss6eCGbw==;
Received: from [209.203.16.11] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mnGhz-002Rzt-M3; Wed, 17 Nov 2021 09:54:23 +0100
Received: from wouter by pc181009 with local (Exim 4.95)
	(envelope-from <w@uter.be>)
	id 1mnGhr-000P1u-3I;
	Wed, 17 Nov 2021 10:54:15 +0200
Date: Wed, 17 Nov 2021 10:54:15 +0200
From: Wouter Verhelst <w@uter.be>
To: Andreas Schneider <asn@redhat.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org
Subject: Re: NBD 3.23
Message-ID: <YZTDN4mN3UAc/RFz@pc181009.grep.be>
References: <YZODWCQS+9+JiVpi@pc181009.grep.be>
 <20211116144144.GA32364@redhat.com>
 <3164824.5WEQUB1sqc@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3164824.5WEQUB1sqc@magrathea>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rL_FGuLM3U.A.QWH.TNMlhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1616
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YZTDN4mN3UAc/RFz@pc181009.grep.be
Resent-Date: Wed, 17 Nov 2021 08:54:43 +0000 (UTC)

On Tue, Nov 16, 2021 at 05:53:43PM +0100, Andreas Schneider wrote:
> On Tuesday, November 16, 2021 3:41:44 PM CET Richard W.M. Jones wrote:
> > On Tue, Nov 16, 2021 at 12:09:28PM +0200, Wouter Verhelst wrote:
> > > Hi,
> > > 
> > > There was a small but crucial bug in NBD 3.22, which meant that the
> > > client would only connect to localhost (🤦). I've uploaded a new version
> > > of NBD to the usual spot to fix that issue.
> > > 
> > > If anyone can come up with a good way to test that nbd-client actually
> > > connects to a host that is *not* localhost which we can add to the test
> > > suite, that'd be nice :) otherwise, I'll try to remember to test this
> > > manually from now on.
> > 
> > If you don't mind another dependency (which I think is probably OK for
> > tests, but make it optional!) then cwrap can do this, specifically I
> > think you need nss_wrapper.
> > 
> > https://cwrap.org/
> > https://lwn.net/Articles/594863/
> > 
> > Fedora package:
> > https://src.fedoraproject.org/rpms/nss_wrapper
> > 
> > Debian package:
> > https://packages.debian.org/sid/libnss-wrapper
> 
> I think you want socket_wrapper and nss_wrapper. socket_wrapper is the tool to 
> create the network, nss_wrapper for name resolution :-)

Very interesting, thanks. I should probably also use socket_wrapper for
the main test suite; currently you can't run it if nbd-server is running
system-wide, which is a problem; with socket_wrapper that shouldn't be
an issue anymore.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

