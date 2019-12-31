Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4536812DA29
	for <lists+nbd@lfdr.de>; Tue, 31 Dec 2019 17:11:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 27381206A6; Tue, 31 Dec 2019 16:11:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Dec 31 16:11:06 2019
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 780AF2065A
	for <lists-other-nbd@bendel.debian.org>; Tue, 31 Dec 2019 16:10:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jXjWu-wxAlBb for <lists-other-nbd@bendel.debian.org>;
	Tue, 31 Dec 2019 16:10:53 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A550420695
	for <nbd@other.debian.org>; Tue, 31 Dec 2019 16:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Bh9N333C1pTQbhsDJvz046vF9pPuIZoTGqhsyKt3RZY=; b=ok3sxPY3GaW1aaYhqCJAO8f7p3
	Tq/PsyutAlJB50ucxbbXS1P666wPckMxdQGoiifdNBdc1d7KpwgKcylaB9pNTcv8MSarjtbys8g45
	UWivp61gM9LuO/hIgqAWdU5d0hRCqpGEtPpOIYjkcHnvl/XZtWRL3gtRHhnqCbBwgsMqwBd7/xjxQ
	Mxn8/fQ6leUDZ08+DvapaYXO4DbIHHynSoWHchHaIkqc5bwfqVBdEDYRlGYSBj/oD+eppV5j4iLYv
	sxJP+abQ7+SajXfTG7c9Ex6vwAHrXKdlOIXghM7kEsI5ogdP29FG7cp8fgpr6cIoFY17MqGFARAFv
	ndhL5Lsg==;
Received: from wouter by latin.grep.be with local (Exim 4.92)
	(envelope-from <wouter@grep.be>)
	id 1imJoL-0000Zh-Ox; Tue, 31 Dec 2019 16:51:57 +0100
Date: Tue, 31 Dec 2019 16:51:57 +0100
From: Wouter Verhelst <wouter@grep.be>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Cc: Nir Soffer <nsoffer@redhat.com>, qemu-block <qemu-block@nongnu.org>,
	"nbd@other.debian.org" <nbd@other.debian.org>,
	Eric Blake <eblake@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: Selecting meta context when calling NBD_CMD_BLOCK_STATUS
Message-ID: <20191231155157.GB24908@grep.be>
References: <CAMRbyyv23h0nCjh3b9oWAT_XGe+0=fDanbHOuAyK=QQJGPH5Yg@mail.gmail.com>
 <11e45957-7a6c-53b6-824d-80f1d5515a4d@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11e45957-7a6c-53b6-824d-80f1d5515a4d@virtuozzo.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9AQotVTm6cJ.A.rwE.aM3CeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/765
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191231155157.GB24908@grep.be
Resent-Date: Tue, 31 Dec 2019 16:11:06 +0000 (UTC)

Hi Vladimir,

On Fri, Dec 27, 2019 at 12:13:17PM +0000, Vladimir Sementsov-Ogievskiy wrote:
> If we are going to extent the command, I also want a possibility to use 64bit length for
> commands with no payload: write_zero, discard, block_status.
> 
> I just don't remember what was the problems with extending the command structure,
> we already discussed it but somehow it was not simple..
> 
> Aha, the problem is that it would be completely incompatible extension: we can't implement
> it in a manner that server which don't support it will just reply EINVAL on extended command,
> as it will lose the correct position in the command stream..
> 
> But I don't think it's the reason to never extend the command. Maybe, the first step should
> be implementing cmd_length field feature, so, if it is negotiated, than all commands are
> extended by cmd_length field which defines the length of the command in the stream.

I agree that it would be useful to be able to add 64-bit commands to the
nbd_request structure at some point. Doing so could be done by having a
different magic number for the new type of the request, but only to
servers that set a transmission flag to state that they know the new
message format.

However, that is unrelated to the question that Nir asked, and so I'd
like to keep the two separate.

-- 
<Lo-lan-do> Home is where you have to wash the dishes.
  -- #debian-devel, Freenode, 2004-09-22

