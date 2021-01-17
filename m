Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 438D32F926D
	for <lists+nbd@lfdr.de>; Sun, 17 Jan 2021 14:16:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2445A208B5; Sun, 17 Jan 2021 13:16:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jan 17 13:16:17 2021
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 65BBD208B4
	for <lists-other-nbd@bendel.debian.org>; Sun, 17 Jan 2021 13:16:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pnRw187mMjic for <lists-other-nbd@bendel.debian.org>;
	Sun, 17 Jan 2021 13:16:04 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5FAFD2089C
	for <nbd@other.debian.org>; Sun, 17 Jan 2021 13:16:03 +0000 (UTC)
Received: from [41.193.138.174] (helo=pc181009)
	by lounge.grep.be with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1l17uT-0007tE-Mq
	for nbd@other.debian.org; Sun, 17 Jan 2021 14:16:01 +0100
Received: from wouter by pc181009 with local (Exim 4.94)
	(envelope-from <w@uter.be>)
	id 1l17uM-000oZX-I6
	for nbd@other.debian.org; Sun, 17 Jan 2021 15:15:54 +0200
Date: Sun, 17 Jan 2021 15:15:54 +0200
From: Wouter Verhelst <w@uter.be>
To: nbd@other.debian.org
Subject: NBD 3.21
Message-ID: <YAQ4il0ZGrYRZKMa@pc181009.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <coLHnMUXoNO.A.-gH.hiDBgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1104
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YAQ4il0ZGrYRZKMa@pc181009.grep.be
Resent-Date: Sun, 17 Jan 2021 13:16:17 +0000 (UTC)

Hi,

I just released NBD 3.21 with a few minor fixes. Get it at the usual
place.

On an aside, I haven't been very active on NBD in the past year. The
pandemic and the resulting online-only variants of the conferences that
I'm involved in the video team of (FOSDEM & DebConf, FWIW) has eaten up
most of my free time this year.

I'm pretty sure I've dropped some balls here and there, and so if
there's something that I promised to do but forgot, please don't take it
personal and remind me of it. Hopefully once FOSDEM is finished I'll be
able to forget about all things video and focus on NBD again.

Regards,

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

