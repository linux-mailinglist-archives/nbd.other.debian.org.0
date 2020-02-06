Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BE3154D05
	for <lists+nbd@lfdr.de>; Thu,  6 Feb 2020 21:37:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 80918204D9; Thu,  6 Feb 2020 20:37:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb  6 20:37:31 2020
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0A5FF204CE
	for <lists-other-nbd@bendel.debian.org>; Thu,  6 Feb 2020 20:37:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4NdUqLk5eBbF for <lists-other-nbd@bendel.debian.org>;
	Thu,  6 Feb 2020 20:37:19 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E40AA2047B
	for <nbd@other.debian.org>; Thu,  6 Feb 2020 20:37:19 +0000 (UTC)
Received: from [105.186.88.40] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1izntj-00043r-0t; Thu, 06 Feb 2020 21:37:15 +0100
Received: from wouter by gangtai.home.grep.be with local (Exim 4.93-RC4)
	(envelope-from <w@uter.be>)
	id 1iznhM-0003I1-M6; Thu, 06 Feb 2020 22:24:28 +0200
Date: Thu, 6 Feb 2020 22:24:28 +0200
From: Wouter Verhelst <w@uter.be>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Cc: Eric Blake <eblake@redhat.com>, nbd@other.debian.org,
	qemu-block@nongnu.org, nsoffer@redhat.com, den@openvz.org
Subject: Re: [PATCH 1/2] nbd/proto: introduce structured request
Message-ID: <20200206202428.GA11709@grep.be>
References: <20200205164352.16673-1-vsementsov@virtuozzo.com>
 <20200205164352.16673-2-vsementsov@virtuozzo.com>
 <5e72ec19-604e-5840-a164-4b7ab0222a3e@redhat.com>
 <792fea52-f3c1-4bc3-450a-ce30167310a7@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <792fea52-f3c1-4bc3-450a-ce30167310a7@virtuozzo.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <RN5bxY9ns0L.A.PK.LkHPeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/801
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200206202428.GA11709@grep.be
Resent-Date: Thu,  6 Feb 2020 20:37:31 +0000 (UTC)

Hi Vladimir,

On Thu, Feb 06, 2020 at 05:10:07PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Hmm, don't you think still, that structured writes may be useful at some
> point? Now we always translate structured read reply to real allocated in RAM
> zeroes. But at some point we may instead propagate this concept to the
> generic block layer, and make support for it in qcow2. Or even with support
> only in NBD we may benefit if we are coping data from one NBD to andother: we
> should not unpack zeroes.

No, I'm with Eric on this one.

It is the client who decides what the size of a request will be. If the
request is too large to handle in one go, the client can just decide to
split it up in multiple requests. The server can't do that, and
therefore needs to be able to split up a single request into multiple
chunks.

The logic that is required client side to reassemble the multiple chunks
with structured requests can already be quite complicated, and it would
be good if we could avoid having that happen on the server side, too.

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

