Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D536B8BE0
	for <lists+nbd@lfdr.de>; Tue, 14 Mar 2023 08:23:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 91CCA20449; Tue, 14 Mar 2023 07:23:56 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 14 07:23:56 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 356E520419
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Mar 2023 07:23:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ZeX27qv86FbN for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Mar 2023 07:23:37 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 43BD120446
	for <nbd@other.debian.org>; Tue, 14 Mar 2023 07:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xNzw/QeFxeawsmOIYQn1ZjLMQhs+RH5JPtr2Ujhc9Q4=; b=hoAXxwJiNXZZlRZEICuH//9CgO
	CJckX6s6EdaIkzu5kI1zLew6gwhbYaTukgks0cnh38goAxlmg7Vba7wY2BHEhqhayDpKyZl2O2nbf
	GpksdIW++f7DU3JR+W7V1M9Q1ynYK1WiLGQjV98WI4ltdelK9dzlVaxxgl7L5DUrnpjni+w2X8FTv
	3sIWpvkPQ5tzpE8jTGwDa8scjdqsWi9Ovs4+eY7Gz7qtw30wenGG59A4XPiVscXIJPForVlIicH+y
	x6RrC5IrnD4WRrCxbHz21K6ISz/6FDMJrHuNIitQSx6Q8hGGHk+HW3HanAjWdWcIm7SnrvO29BeXI
	4cj9g4PA==;
Received: from [196.251.239.242] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1pbz0P-0078Kz-Hn; Tue, 14 Mar 2023 08:23:33 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1pbz0J-0002HF-1o;
	Tue, 14 Mar 2023 09:23:27 +0200
Date: Tue, 14 Mar 2023 09:23:27 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org
Subject: Re: [PATCH 1/3] uapi nbd: improve doc links to userspace spec
Message-ID: <ZBAg7+djXnGMd+b4@pc220518.home.grep.be>
References: <20230310201525.2615385-1-eblake@redhat.com>
 <20230310201525.2615385-2-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310201525.2615385-2-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <lG7sYNDZE4E.A.-ZC.MECEkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2386
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZBAg7+djXnGMd+b4@pc220518.home.grep.be
Resent-Date: Tue, 14 Mar 2023 07:23:56 +0000 (UTC)

Hi Eric,

On Fri, Mar 10, 2023 at 02:15:23PM -0600, Eric Blake wrote:
> The documentation file also had a stale link to sourceforge; nbd
> ditched that several years ago in favor of github.

While it's accurate to say that we've mostly moved to github, I wouldn't
describe the sourceforge link as "stale"; I've kept the information on
that landing page generally up-to-date over the years (the most recent
change was the addition of the link to Ceph for Windows for a Windows
NBD client, in 2020), and I do still post file releases on sourceforge,
primarily.

However, I guess it's been long enough, and there isn't really anything
that sourceforge can provide us which github can't, so I suppose we
might as well.

Since there is some stuff on that landing page that is currently nowhere
else, I propose the following patch; comments are welcome. After that,
I'm happy to move the link from the kernel documentation to github.

While we're at it, I noticed that the link to nbd.txt in the qemu
section of doc/proto.md now redirects to gitlab.com, but not to the
specific file anymore. I've updated that link.

diff --git a/README.md b/README.md
index c091406..95df263 100644
--- a/README.md
+++ b/README.md
@@ -21,6 +21,15 @@ If you want to send a patch, please do not open a pull request; instead, send
 it to the
 [mailinglist](https://lists.debian.org/nbd)
 
+Security issues
+---------------
+
+If you think you found a security problem in NBD, please contact the
+mailinglist. Do *not* just file an issue for this (although you may do
+so too if you prefer).
+
+For embargoed issues, please contact Wouter Verhelst <wouter@debian.org>
+
 Using NBD
 ---------
 
@@ -96,6 +105,47 @@ systems; see the "Packaging status" badge below for details.
 
 For questions, please use the [nbd@other.debian.org](mailto:nbd@other.debian.org) mailinglist.
 
+Alternate implementations
+=========================
+
+Besides this project, the NBD protocol has been implemented by various
+other people. A (probably incomplete) list follows:
+
+* [nbdkit](https://gitlab.com/nbdkit/nbdkit) is a multithreaded NBD
+  server with a plugin architecture.
+* [libnbd](https://gitlab.com/nbdkit/libnbd) is a library to aid in
+  writing NBD clients
+* [qemu](https://www.qemu.org) contains an embedded NBD server, an
+  embedded NBD client, and a standalone NBD server (`qemu-nbd`). They
+  maintain a [status
+  document](https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/nbd.txt)
+  of their NBD implementation.
+* A [GEOM gate-based client implementation for
+  FreeBSD](https://github.com/freqlabs/nbd-client) exists. It has not
+  seen any updates since 2018, and only implements the client side
+  (any server should run on FreeBSD unmodified, however).
+* A Windows client implementation exists as part of the [RBD
+  implementation](https://docs.ceph.com/en/latest/rbd/rbd-windows/) of
+  [Ceph for Windows](https://cloudbase.it/ceph-for-windows/).
+
+Additionally, these implementations once existed but are now no longer
+maintained:
+
+* xnbd: This was an NBD implementation with a few extra protocol
+  messages that allowed for live migration. Its code repository has
+  disappeared.
+* enbd: This was an NBD implementation with a few extra protocol
+  messages that allowed extra ioctl calls to be passed on (e.g., the
+  "eject" message for a CD-ROM device that was being exported through
+  NBD). It appears to no longer be maintained.
+* Hurd translator: There was a [proof-of-concept
+  implementation](https://lists.debian.org/debian-hurd/2001/09/msg00174.html)
+  of the NBD protocol once as a translator for The Hurd. We do not know
+  what its current status is.
+* Christoph Lohmann once wrote a client implementation for Plan 9. The
+  link he provided us is now stale; we do not know what its current
+  status is.
+
 Badges
 ======
 

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

