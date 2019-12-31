Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A21112D9FA
	for <lists+nbd@lfdr.de>; Tue, 31 Dec 2019 16:59:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CB1D62071B; Tue, 31 Dec 2019 15:59:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Dec 31 15:59:30 2019
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=DIGITS_LETTERS,DKIM_INVALID,
	DKIM_SIGNED,LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1902820714
	for <lists-other-nbd@bendel.debian.org>; Tue, 31 Dec 2019 15:59:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zvElmnyX-9To for <lists-other-nbd@bendel.debian.org>;
	Tue, 31 Dec 2019 15:59:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 601 seconds by postgrey-1.36 at bendel; Tue, 31 Dec 2019 15:59:18 UTC
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D0DE8206E7
	for <nbd@other.debian.org>; Tue, 31 Dec 2019 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nVYgmjkCFCobvhM5QiMTzhbfE57xLktMugvi/bYcskQ=; b=Vgsp2UsFhBbfJ0QSWQM5nvz/wC
	UziOFucEtJJm1CuOna3xc03swLVYIL4A1AQ+VW7XILrXfGfAcv15D1SRaEj0KSQKrEgs5G6HHXMbc
	laJy2y9cspdQuGSiWd5JMTwF/5PWWsyAptrc+NJ8O4apquVQ1O+Vc3+fOh02Utz03vrt4domDuaHv
	c8Wl9VkMTUza0J9cm9K+fBPtB33jNBE3A/rT6wdLWW36rvGJmfsjTo7kD6AlA/vTMBSN+HuezoO6Y
	ru7exr18WKk5cWBaoWp7ttOTbvhEVcsKM5RgVCB3yh5JsqrfrmCTNAUGhCZ/bgYetmIoyyxRK9vZv
	OgZiSK/w==;
Received: from wouter by latin.grep.be with local (Exim 4.92)
	(envelope-from <wouter@grep.be>)
	id 1imJvQ-0007jB-ET
	for nbd@other.debian.org; Tue, 31 Dec 2019 16:59:16 +0100
Date: Tue, 31 Dec 2019 16:59:16 +0100
From: Wouter Verhelst <wouter@grep.be>
To: nbd@other.debian.org
Subject: [PATCH] proto: document use of NBD_REP_ERR_PLATFORM
Message-ID: <20191231155916.GC24908@grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jva5qZ_R8qF.A.giC.iB3CeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/763
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191231155916.GC24908@grep.be
Resent-Date: Tue, 31 Dec 2019 15:59:30 +0000 (UTC)

Hi,

When I implemented TLS support into nbd-server, I made it send
NBD_REP_ERR_PLATFORM to the client if it asked for TLS support and that
was disabled at compile time. I think this is a valid use for that error
message (which is otherwise not ever used), and I think I should update
the docs to account for it.

What do other people think?

Thanks,

>From 590fc470ff08dab5969f9c7f6851a2e30d9f9353 Mon Sep 17 00:00:00 2001
From: Wouter Verhelst <w@uter.be>
Date: Tue, 31 Dec 2019 17:31:02 +0200
Subject: [PATCH] NBD_REP_ERR_PLATFORM: make useful

"not available on this platform" is rather weird, and probably too narrow a
choice. "not enabled at compile time" might be slightly more useful, and
nbd-server uses that for STARTTLS when it was disabled currently.

This might be a good idea, so explicitly allow for it.
---
 doc/proto.md | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/doc/proto.md b/doc/proto.md
index fc7baf6..be83b78 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -1582,7 +1582,8 @@ case that data is an error message string suitable for display to the user.
 * `NBD_REP_ERR_PLATFORM` (2^31 + 4)
 
     The option sent by the client is not supported on the platform on
-    which the server is running. Not currently used.
+    which the server is running, or requires compile-time options that
+    were disabled, e.g., upon trying to use TLS.
 
 * `NBD_REP_ERR_TLS_REQD` (2^31 + 5)
 
-- 
2.20.1


-- 
<Lo-lan-do> Home is where you have to wash the dishes.
  -- #debian-devel, Freenode, 2004-09-22

