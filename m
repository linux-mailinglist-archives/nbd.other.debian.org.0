Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D7A15A1F8
	for <lists+nbd@lfdr.de>; Wed, 12 Feb 2020 08:27:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2D5AD203E6; Wed, 12 Feb 2020 07:27:59 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb 12 07:27:59 2020
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C8EBB203DF
	for <lists-other-nbd@bendel.debian.org>; Wed, 12 Feb 2020 07:27:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LxiBXCOJDm_y for <lists-other-nbd@bendel.debian.org>;
	Wed, 12 Feb 2020 07:27:47 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8DCDE203CB
	for <nbd@other.debian.org>; Wed, 12 Feb 2020 07:27:47 +0000 (UTC)
Received: from [105.186.91.62] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1j1mQs-0003OD-RC; Wed, 12 Feb 2020 08:27:38 +0100
Received: from wouter by gangtai.home.grep.be with local (Exim 4.93)
	(envelope-from <w@uter.be>)
	id 1j1mQj-0006QW-NK; Wed, 12 Feb 2020 09:27:29 +0200
Date: Wed, 12 Feb 2020 09:27:29 +0200
From: Wouter Verhelst <w@uter.be>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Eric Blake <eblake@redhat.com>,
	"nbd@other.debian.org" <nbd@other.debian.org>,
	QEMU <qemu-devel@nongnu.org>,
	"qemu-block@nongnu.org" <qemu-block@nongnu.org>,
	"libguestfs@redhat.com" <libguestfs@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Alberto Garcia <berto@igalia.com>
Subject: Re: Cross-project NBD extension proposal: NBD_INFO_INIT_STATE
Message-ID: <20200212072729.GA22254@grep.be>
References: <a4394fde-f459-dcb5-1698-013e1e24c388@redhat.com>
 <20200210221234.GH3888@redhat.com>
 <cc6e1e2e-d3a9-c498-354b-d382b5623ca0@redhat.com>
 <20200210225255.GJ3888@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210225255.GJ3888@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xd8M27BV1sG.A.WDC._j6QeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/817
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200212072729.GA22254@grep.be
Resent-Date: Wed, 12 Feb 2020 07:27:59 +0000 (UTC)

Hi,

On Mon, Feb 10, 2020 at 10:52:55PM +0000, Richard W.M. Jones wrote:
> But anyway ... could a flag indicating that the whole image is sparse
> be useful, either as well as NBD_INIT_SPARSE or instead of it?  You
> could use it to avoid an initial disk trim, which is something that
> mke2fs does:

Yeah, I think that could definitely be useful. I honestly can't see a
use for NBD_INIT_SPARSE as defined in this proposal; and I don't think
it's generally useful to have a feature if we can't think of a use case
for it (that creates added complexity for no benefit).

If we can find a reasonable use case for NBD_INIT_SPARSE as defined in
this proposal, then just add a third bit (NBD_INIT_ALL_SPARSE or
something) that says "the whole image is sparse". Otherwise, I think we
should redefine NBD_INIT_SPARSE to say that.

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

