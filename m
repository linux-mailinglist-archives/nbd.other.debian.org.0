Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE3F6AAEA5
	for <lists+nbd@lfdr.de>; Sun,  5 Mar 2023 09:54:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C078F2082C; Sun,  5 Mar 2023 08:54:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Mar  5 08:54:06 2023
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
	by bendel.debian.org (Postfix) with ESMTP id D1E1D20824
	for <lists-other-nbd@bendel.debian.org>; Sun,  5 Mar 2023 08:53:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id G5tAWEO35Ldq for <lists-other-nbd@bendel.debian.org>;
	Sun,  5 Mar 2023 08:53:49 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E03CB20818
	for <nbd@other.debian.org>; Sun,  5 Mar 2023 08:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=71c3KvmJIEHZ80evY5FA64AIpVJibr19GwJYtq7uPdk=; b=NFL9Chmjn2u4PMFO+cqHe85fNn
	mpvTVPnL/uEJGrKYLfMeB1T2k3mtwRnUcnzPYSmh+kgeGc638GGcpwBlm6B503BijabJRCv0O0lE/
	N9MTPH9ORTtauLzA48KHoFGkuwU1f63YL2qQaF9ySry/lGPiNNxlgQ0xFKS9GF1sIRPPaFDO/2PrO
	sQTH8EJ9b3IrsUXi9dAjkOZxfrqHlIoG1vmBmyC08POi121MBVm341/AFHQEFv72olKM+wzSrtYdx
	tPQd7WlGCuZINJJzgQvhU1tbrzPQ/6fYtoki9yj0JuKkzJWlw3Xs99+VyIFQQ5rGF8MKnoclRLPir
	Fy9I+qAA==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1pYk7l-00095A-6p; Sun, 05 Mar 2023 09:53:45 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1pYk7e-000T7l-1A;
	Sun, 05 Mar 2023 10:53:38 +0200
Date: Sun, 5 Mar 2023 10:53:38 +0200
From: Wouter Verhelst <w@uter.be>
To: Nir Soffer <nsoffer@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, nbd@other.debian.org,
	libguestfs@redhat.com, qemu-block@nongnu.org
Subject: Re: [Libguestfs] [PATCH] docs: Prefer 'cookie' over 'handle'
Message-ID: <ZARYkkOB/sarm6vO@pc220518.home.grep.be>
References: <20230303221503.1769410-1-eblake@redhat.com>
 <CAMRbyyuN6xFNkqyCacU=PxBqwTKdPNdO6dW1FQgTpAyWHLs7uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRbyyuN6xFNkqyCacU=PxBqwTKdPNdO6dW1FQgTpAyWHLs7uw@mail.gmail.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0ELLjuj6ZWD.A.nWG.uiFBkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2352
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZARYkkOB/sarm6vO@pc220518.home.grep.be
Resent-Date: Sun,  5 Mar 2023 08:54:06 +0000 (UTC)

On Sat, Mar 04, 2023 at 10:03:46PM +0200, Nir Soffer wrote:
> On Sat, Mar 4, 2023 at 12:15 AM Eric Blake <eblake@redhat.com> wrote:
> > Makes no difference to implementations (other than older code
> > still using 'handle' may be slightly harder to tie back to the spec).
> 
> To avoid confusion with older code that carefully used "handle" to match
> the spec, maybe add a note that "cookie" was named "handle" before?

Yes, this. I'm happy with renaming it cookie (it makes sense), but there
is a *lot* of stuff out there that calls it "handle" (including a
wireshark plugin) and it would be confusing if that link isn't available
anywhere.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

