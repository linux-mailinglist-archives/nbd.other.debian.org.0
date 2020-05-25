Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 285311E0F9E
	for <lists+nbd@lfdr.de>; Mon, 25 May 2020 15:37:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D271E20369; Mon, 25 May 2020 13:37:50 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 25 13:37:50 2020
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7E2D020361
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 May 2020 13:37:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id dqHNF1QgRjlZ for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 May 2020 13:37:39 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 2A00A2035C
	for <nbd@other.debian.org>; Mon, 25 May 2020 13:37:38 +0000 (UTC)
Old-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ze0ax75rtIVwWjTgG+ZonYSqQb6oZF24aI2PrOBkiY4=; b=e2Zt0uAiQASoJGHZINnsU+sffo
	EbvG7M/UtkDZOX0XoJLErrzYaze6q2zC93qdmHtbzzWJcUGsvyD0TVh7XMc+XVOLFNHYdKRmboTIp
	FXKcdWUrqeTKoRM/nFa7D2FUcqHms5MdPooLpWWKPeveftK8nYvpl0slaz0zpStwlwagS5ZsWvdj+
	js44azrycozRg4ar4C9ZsocmfxUCV/Zeu5KeeTA584b0drg71nmEO/DHIzJcpHWanz2d8BKg3iDpR
	T2JsoofrhN8xhEPQ15rLwxb+n65Vwp+whBKh2vRkqvJBTO35bUh19FA5Cb6nVxvaavI2J1sgW//5f
	Lf9oO4Qw==;
Received: from wouter by latin.grep.be with local (Exim 4.92)
	(envelope-from <wouter@grep.be>)
	id 1jdDIL-0001Ir-0Z; Mon, 25 May 2020 15:37:33 +0200
Date: Mon, 25 May 2020 15:37:32 +0200
From: Wouter Verhelst <wouter@grep.be>
To: Eric Blake <eblake@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	nbd@other.debian.org, qemu-block@nongnu.org, w@uter.be,
	nsoffer@redhat.com, den@openvz.org
Subject: Re: [RFC v2] nbd/proto: introduce extended request and 64bit commands
Message-ID: <20200525133732.GC3459@grep.be>
References: <20200206151547.5812-1-vsementsov@virtuozzo.com>
 <2f56c11f-3380-9b83-6873-2ec8f4c3d07d@virtuozzo.com>
 <20200317161859.GD27056@grep.be>
 <fd6a5d69-36da-bb4f-b67d-44ef80577a88@virtuozzo.com>
 <20200318053337.GE27056@grep.be>
 <49e18291-7e7b-a363-c807-80d4cc589fd8@virtuozzo.com>
 <78efe37b-b54b-cc59-aec2-1ce39ec1676b@virtuozzo.com>
 <20200318080454.GH27056@grep.be>
 <f4f52b87-5520-4b8c-1b1d-2e681e1ff514@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4f52b87-5520-4b8c-1b1d-2e681e1ff514@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nW8OsfyyvjO.A._jB.uo8yeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/879
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200525133732.GC3459@grep.be
Resent-Date: Mon, 25 May 2020 13:37:50 +0000 (UTC)

Hi guys,

Sorry for slacking here.

On Wed, Mar 18, 2020 at 07:22:39AM -0500, Eric Blake wrote:
> On 3/18/20 3:04 AM, Wouter Verhelst wrote:
> > On Wed, Mar 18, 2020 at 09:19:45AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > > OK, understand. Reasonable thing, agreed. I'll resend.
> > > 
> > > Hmm. But we can't read in one go anyway, because we need to distinguish NBD_REQUEST_MAGIC
> > > from NBD_EXTENDED_REQUEST_MAGIC..
> > 
> > Yes, that needs to happen at any rate, indeed. So the difference will be
> > two reads rather than three, instead of one read rather than two.
> > 
> > That's still an advantage.
> 
> Not much of one.  You're micro-optimizing the read()s, but in reality, the
> sender will likely send() the entire packet at once, at which point the data
> is in the kernel and the reads will succeed back-to-back, or you can even
> write the client to read into a buffer to minimize syscalls and then parse
> as much as needed out of the buffer.
> 
> You've got a LOT more overhead in the TCP packet and network transmission
> time than you do in deciding whether the server has to do 2 or 3 read()s per
> client message.
> 
> While it might be nice to design a message that doesn't need the server to
> do additional decision points mid-packet in determining how much packet
> remains, that should not be your driving factor. Even with current servers,
> that is already the case (the server has to decide mid-packet whether it is
> handling NBD_CMD_WRITE and thus has more data to read).

Having payload length and affected length as separate entities also
makes the protocol context free, which should make things easier to
parse for things like wireshark etc. It also feels a bit cleaner to me,
in that a server implementation can separate "reading data" from
"handling data" more cleanly.

(e.g., nbd-server has to special-case NBD_CMD_WRITE in a generic "read
the next command" function, which I think is rather ugly)

Other than this (minor) issue, I think this proposal is certainly ready
to go, and I apologise for not having followed up on it ealier.

Would you be so kind as to propose a new patch, with changes as
suggested in this thread? I promise to not let it linger for months
again then ;-)

-- 
<Lo-lan-do> Home is where you have to wash the dishes.
  -- #debian-devel, Freenode, 2004-09-22

