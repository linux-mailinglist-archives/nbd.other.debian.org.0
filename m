Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6306B3B49
	for <lists+nbd@lfdr.de>; Fri, 10 Mar 2023 10:49:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 56391206D8; Fri, 10 Mar 2023 09:49:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 10 09:49:19 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BBE0F206D6
	for <lists-other-nbd@bendel.debian.org>; Fri, 10 Mar 2023 09:49:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id GZPvoYY1XQhG for <lists-other-nbd@bendel.debian.org>;
	Fri, 10 Mar 2023 09:49:01 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7D5A7205F6
	for <nbd@other.debian.org>; Fri, 10 Mar 2023 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=OwkgnItecgTSszSzxDjR7C1oT5lBDng12nvv03fobJE=; b=YzkZ8rtVtTgLIP4pRBh7a50A0A
	sS7NCYNMPU8c5Er6hmU34Fffumhp1HfI4LAPfR0hmlUAn9dCl5PvE0aQbcRl1iy/6ASRQKhNU/ot8
	+qcUT1Vtcx56xmqkC1FGd6Mg9V2pUju4TNgiOufqCwXjuCgqxFaQmU5Muws+VF1mXlCNiuFJ0vZj7
	G1LpRgv2RzBUBKnKNjQ9aQ9+S51BpKbnXAFLwc9MxMemJHL0ww3PAIxuneqEi/GuQaugooQaWZD5x
	HxCsC8RRcL7yrQoyw7JgT+tqEpf3zwxZT0wFjPxSkzySJ0aBoN7mdG+MB4vSTTOmRJNXtrTphwPEP
	vZtruRmw==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1paZMv-00CaHp-M5; Fri, 10 Mar 2023 10:48:57 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1paZMk-0008MH-2L;
	Fri, 10 Mar 2023 11:48:46 +0200
Date: Fri, 10 Mar 2023 11:48:46 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, "Richard W . M . Jones" <rjones@redhat.com>
Subject: Re: [PATCH v2 1/3] docs: Prefer 'cookie' over 'handle'
Message-ID: <ZAr8/hV1M8sS8hWt@pc220518.home.grep.be>
References: <20230309210623.2238671-1-eblake@redhat.com>
 <20230309210623.2238671-2-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309210623.2238671-2-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bcZ1BF_rcNM.A.KoC.f0vCkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2366
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZAr8/hV1M8sS8hWt@pc220518.home.grep.be
Resent-Date: Fri, 10 Mar 2023 09:49:19 +0000 (UTC)

So.

On Thu, Mar 09, 2023 at 03:06:21PM -0600, Eric Blake wrote:
> In libnbd, we quickly learned that distinguishing between 'handle'
> (verb for acting on an object) and 'handle' (noun describing which
> object to act on) could get confusing; we solved it by renaming the
> latter to 'cookie'.  Copy that approach into the NBD spec, and make it
> obvious that a cookie is opaque data from the point of view of the
> server.  Makes no difference to implementations (other than older code
> still using 'handle' may be slightly harder to tie back to the spec).

One thing I didn't think about:

The kernel has a uapi include file that mentions "handle". That's where
the name comes from, in fact: the nbd.h in the nbd project was
originally not even there, we just required you either compile on Linux
or copy the file somehow. It was so much of a bother that I eventually
gave up on that and copied a (by now somewhat outdated and independently
evolved) version of nbd.h into the nbd repository.

I'm still happy to make these changes, but we should consider what to do
with the kernel and the uapi include file. Renaming it there is probably
not going to happen; we might do some union or macro trickery to create
an alias to "cookie" for the "handle" name, but I don't know what the
kernel community is going to think about that.

Alternatively, perhaps we may have to tweak the wording a bit more to
clarify that it's not just older code.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

