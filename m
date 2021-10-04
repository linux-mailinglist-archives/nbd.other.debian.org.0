Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8F1420ADD
	for <lists+nbd@lfdr.de>; Mon,  4 Oct 2021 14:25:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7781920632; Mon,  4 Oct 2021 12:25:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct  4 12:25:06 2021
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F0EDA20508
	for <lists-other-nbd@bendel.debian.org>; Mon,  4 Oct 2021 12:24:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id oTPbQMzywKcl for <lists-other-nbd@bendel.debian.org>;
	Mon,  4 Oct 2021 12:24:56 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 65FF9204FD
	for <nbd@other.debian.org>; Mon,  4 Oct 2021 12:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=22a0JVQgEO8y3FkbzXWg2pOK7RAXRqjyI19SCXOBqcc=; b=EjgGQFAbxHbmlIb2LyZ2MH6Hf6
	jNctqQqb8aB//+AIp4+2/2jL5SMN/sJymZUCChC5JkzPMhX8O+00HJeFfiyeaSKBa+P1o4EWlKIiN
	IOfNN+CpKFP27CFyd9JiO9oxddmsLknuJ6ktbsnVL3i1xUAz4tesabJ5pL7zvhjvSicfxnG8cUQT9
	FuPOGNhZEb5ymOl3aS4XpJ8CNhD0o+TUZkWvOvW1SYBo+rRz/vR4qIu9nd2GyVyUt/Hj35jtJ02gc
	sT7mFCAL6Zgabvahgbzft8Q2kprSqx6BFbRJK8yb9ewIwtrrk0HbjszDgWXdLi323yrMvp6QM71HL
	0CSPtLRA==;
Received: from [102.39.151.73] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mXN1Z-00EGD9-9F
	for nbd@other.debian.org; Mon, 04 Oct 2021 14:24:53 +0200
Received: from wouter by pc181009 with local (Exim 4.95-RC2)
	(envelope-from <w@uter.be>)
	id 1mXN1P-000hws-Ps
	for nbd@other.debian.org;
	Mon, 04 Oct 2021 14:24:43 +0200
Date: Mon, 4 Oct 2021 14:24:43 +0200
From: Wouter Verhelst <w@uter.be>
To: nbd@other.debian.org
Subject: NBD 3.22
Message-ID: <YVryi2p1oAnHQcxo@pc181009.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ARpxe9tnIOO.A.HzH.iKvWhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1536
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YVryi2p1oAnHQcxo@pc181009.grep.be
Resent-Date: Mon,  4 Oct 2021 12:25:06 +0000 (UTC)

Hi all,

I just released NBD 3.22.

There's a few fixes for new deprecation warnings in glib and autoconf.
Other than that, this release has the following fixes:

Bug fixes:
- v6-mapped IPv4 addresses will now be converted from their IPv6 format
  before matching them in the authfile.
- Rewritten nbdtab parser to use bison and properly support multiple
  options on a single line
- "autoreconf" will now produce a helpful error message when
  autoconf-archive is not installed
- nbd-client will now no longer use a unix domain socket filename as a
  TLS hostname when TLS verification was requested

Get it at the usual place.

Kind regards,

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

