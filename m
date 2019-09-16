Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DCEB34F2
	for <lists+nbd@lfdr.de>; Mon, 16 Sep 2019 08:58:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2CFDB20617; Mon, 16 Sep 2019 06:58:50 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 16 06:58:50 2019
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1ECF620596
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 Sep 2019 06:58:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Znw_qAXzMB2s for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 Sep 2019 06:58:39 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6C6AF201D5
	for <nbd@other.debian.org>; Mon, 16 Sep 2019 06:58:39 +0000 (UTC)
Received: from [105.184.149.17] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1i9ky4-0002Er-U3
	for nbd@other.debian.org; Mon, 16 Sep 2019 08:58:36 +0200
Received: from wouter by gangtai.home.grep.be with local (Exim 4.92.1)
	(envelope-from <w@uter.be>)
	id 1i9kxv-0004Pj-Dc
	for nbd@other.debian.org; Mon, 16 Sep 2019 08:58:27 +0200
Date: Mon, 16 Sep 2019 08:58:27 +0200
From: Wouter Verhelst <w@uter.be>
To: nbd@other.debian.org
Subject: NBD 3.20 released
Message-ID: <20190916065827.GA16767@grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <flW80nFygeO.A.BsB.qKzfdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/690
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190916065827.GA16767@grep.be
Resent-Date: Mon, 16 Sep 2019 06:58:50 +0000 (UTC)

Hi,

I just released NBD 3.20 to the usual place.

This is a maintenance release, with few changes, though there are a few
user-visible ones.

The changes since NBD 3.19 include:

New features:
-------------
- Handling of NBD_CMD_TRIM on block devices with the BLKDISCARD ioctl(),
  rather than only on files.

Bugs fixed:
-----------
- Allow the -g option to nbd-client to also be used when netlink is in
  use.
- Fix for a segfault in nbd-server related to free() of an uninitialized
  pointer and AF_UNIX handling.
- Fix in SIGHUP handling should prevent disconnects of unrelated exports
  on reconfiguration; Thanks, Juha Erkkilä.
- Fixes for various minor and unlikely issues caught by Coverity (some
  in nbd-server, some in the test suite).

Thanks,

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

