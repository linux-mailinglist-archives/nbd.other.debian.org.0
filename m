Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D16189691
	for <lists+nbd@lfdr.de>; Wed, 18 Mar 2020 09:05:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9E85E20673; Wed, 18 Mar 2020 08:05:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 18 08:05:10 2020
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E4A342067C
	for <lists-other-nbd@bendel.debian.org>; Wed, 18 Mar 2020 08:05:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4r6OTx8nmLS4 for <lists-other-nbd@bendel.debian.org>;
	Wed, 18 Mar 2020 08:04:58 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 61B4620673
	for <nbd@other.debian.org>; Wed, 18 Mar 2020 08:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=sxdn+vM+HTYEGGGeHLu4IWebhs84cRFkQjzXzftMJ+U=; b=sYXf5hnE0ypL/0bwB2Ppm+ixVx
	IreGllATN6JjqD4c5Wl78fstXvh4sEW8Y4BIZ6Mynn8SWQoSbSKXwkQ+tEcMmnKK11Qk2LwbGwDTF
	QxxNUByOQkHpn1r6lvQLN8BZBVjA/UeYEEmZLR2RtOUZAUPFMKFsYjW58jU4xQitGx/nhTX9pzB2f
	BFHJdSCbx7Pt2VkxTHtmUYUSoQGTvGFFy1LLJ1X3GateO4SUvEls/rR42Y9XnfiZEF1KW8UcqFrpd
	LFtoT9XuQBXi956cj+s8Zr4KS7shgJ1qgleNn/W18wLE1yrtqe8RgRIxN+b8oJPmnqJaGNDobiJ8a
	gpW9tDoQ==;
Received: from wouter by latin.grep.be with local (Exim 4.92)
	(envelope-from <wouter@grep.be>)
	id 1jETh8-00008i-8V; Wed, 18 Mar 2020 09:04:54 +0100
Date: Wed, 18 Mar 2020 09:04:54 +0100
From: Wouter Verhelst <wouter@grep.be>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, eblake@redhat.com,
	w@uter.be, nsoffer@redhat.com, den@openvz.org
Subject: Re: [RFC v2] nbd/proto: introduce extended request and 64bit commands
Message-ID: <20200318080454.GH27056@grep.be>
References: <20200206151547.5812-1-vsementsov@virtuozzo.com>
 <2f56c11f-3380-9b83-6873-2ec8f4c3d07d@virtuozzo.com>
 <20200317161859.GD27056@grep.be>
 <fd6a5d69-36da-bb4f-b67d-44ef80577a88@virtuozzo.com>
 <20200318053337.GE27056@grep.be>
 <49e18291-7e7b-a363-c807-80d4cc589fd8@virtuozzo.com>
 <78efe37b-b54b-cc59-aec2-1ce39ec1676b@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78efe37b-b54b-cc59-aec2-1ce39ec1676b@virtuozzo.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <yDodwLHrOUK.A.K1F.2YdceB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/864
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200318080454.GH27056@grep.be
Resent-Date: Wed, 18 Mar 2020 08:05:10 +0000 (UTC)

On Wed, Mar 18, 2020 at 09:19:45AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > OK, understand. Reasonable thing, agreed. I'll resend.
> 
> Hmm. But we can't read in one go anyway, because we need to distinguish NBD_REQUEST_MAGIC
> from NBD_EXTENDED_REQUEST_MAGIC..

Yes, that needs to happen at any rate, indeed. So the difference will be
two reads rather than three, instead of one read rather than two.

That's still an advantage.

> I think, that modern client will use mostly NBD_EXTENDED_REQUEST_MAGIC interface, so it will
> be great to optimize it. But to read extended request in one go, we should make it
> shorter than simple request, and it doesn't seem possible.
> 
> May be we should not support simple and extended requests together? May be better to force
> using only extended requests if they are negotiated? Then we will read extended request in
> on go, and we may just define it like
> 
> C: 32 bits, 0x23876289, magic (`NBD_EXTENDED_REQUEST_MAGIC`)
> C: 16 bits, flags
> C: 16 bits, type
> C: 64 bits, handle
> C: 32 bits, length of payload (unsigned), MUST be greater or equal to 16
> C: *length* bytes of payload data (if *length* is nonzero)
> 
> - so, we'll just read 36 bytes in one go, and then additional payload, if length
> is more than 16.

That is, certainly, also an option, although I would define length of
payload to not include the offset and length bytes.

-- 
<Lo-lan-do> Home is where you have to wash the dishes.
  -- #debian-devel, Freenode, 2004-09-22

