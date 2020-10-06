Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BA43F285000
	for <lists+nbd@lfdr.de>; Tue,  6 Oct 2020 18:37:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A04EC20377; Tue,  6 Oct 2020 16:37:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct  6 16:37:16 2020
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9D3152031A
	for <lists-other-nbd@bendel.debian.org>; Tue,  6 Oct 2020 16:37:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id J2SGfgfNs-Hj for <lists-other-nbd@bendel.debian.org>;
	Tue,  6 Oct 2020 16:37:04 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 51B23202CA
	for <nbd@other.debian.org>; Tue,  6 Oct 2020 16:37:04 +0000 (UTC)
Received: from [102.39.150.16] (helo=pc181009)
	by lounge.grep.be with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1kPpxV-0003Aq-Oi; Tue, 06 Oct 2020 18:37:01 +0200
Received: from wouter by pc181009 with local (Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1kPpxO-0001g0-CF; Tue, 06 Oct 2020 18:36:54 +0200
Date: Tue, 6 Oct 2020 18:36:54 +0200
From: Wouter Verhelst <w@uter.be>
To: Josh Triplett <josh@joshtriplett.org>
Cc: nbd@other.debian.org
Subject: Re: [PATCH 1/2] Add option to treat device as read-only
Message-ID: <20201006163654.GA5804@pc181009.grep.be>
References: <20200701071038.GA301687@localhost>
 <20201002200453.GA286250@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201002200453.GA286250@localhost>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UyuCehUGn3I.A.PJD.80JffB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1010
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20201006163654.GA5804@pc181009.grep.be
Resent-Date: Tue,  6 Oct 2020 16:37:16 +0000 (UTC)

Hi Josh,

On Fri, Oct 02, 2020 at 01:04:53PM -0700, Josh Triplett wrote:
> Following up on this: I'm still interested in pursuing these two
> patches. I'd love to get these merged, or find out what could be
> improved to get them merged.

Sorry, this fell off my radar. I've just merged it.

Thanks,

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

