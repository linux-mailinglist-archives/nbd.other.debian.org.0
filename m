Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C2D8BA7F7
	for <lists+nbd@lfdr.de>; Fri,  3 May 2024 09:40:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0C58D2052B; Fri,  3 May 2024 07:40:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May  3 07:40:31 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_SCAM1 autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C18A320508
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 May 2024 07:40:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_SCAM1=0.1] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id p4WCCU7cXIsg for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 May 2024 07:40:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C882020507
	for <nbd@other.debian.org>; Fri,  3 May 2024 07:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1SF6mMyDbifQphSZsHMYHeVHmXmU8P95CQlx4a0cQX0=; b=Sber/UQXzPRQeBQ5YlvDzMAVCj
	nA72flYEb6eYXeoK8tWEkSFDVyCogNZXi/QuxJo4IknA+WzUDv5gvH54UYhxuotoUSmvYJzucwu8f
	aLyVdQHJIO+hMgtvdTml3BxnTvva26a5bF9iq/1j4vGEOteetKgZ05WynR9lMw/mH+NvsK00S+3EL
	1xaRgUp0Zln0UnUU1E9mJu19AyUouPm36fssswhHlbG36d11PMy2qIDLGGA1qmQc+TVjM930ca9+K
	ubwFzsaP6b5v5p3dIvL4cHz6PmHpPXdgWqSXdUeJ8cu9sk74HE6bgXfHcIAEOSm0TgZ2T5MOLQGV9
	xPnznnJg==;
Received: from [102.39.198.120] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1s2nWe-00BX99-14
	for nbd@other.debian.org;
	Fri, 03 May 2024 09:40:12 +0200
Received: from wouter by pc220518 with local (Exim 4.97)
	(envelope-from <w@uter.be>)
	id 1s2nWV-000000036QL-2vBM
	for nbd@other.debian.org;
	Fri, 03 May 2024 09:40:03 +0200
Date: Fri, 3 May 2024 09:40:03 +0200
From: Wouter Verhelst <w@uter.be>
To: nbd@other.debian.org
Subject: Re: Updating the NBD assignment at IANA
Message-ID: <ZjSU04diUwDofJ-4@pc220518.home.grep.be>
References: <Zij-Wnsu2F7_HwMZ@pc220518.home.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zij-Wnsu2F7_HwMZ@pc220518.home.grep.be>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Y9Fzq_tA5IG.A.BNB.vTJNmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2801
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZjSU04diUwDofJ-4@pc220518.home.grep.be
Resent-Date: Fri,  3 May 2024 07:40:32 +0000 (UTC)

I have contacted IANA to request that they perform this:

On Wed, Apr 24, 2024 at 02:43:06PM +0200, Wouter Verhelst wrote:
> Hi all,
> 
> Way back in 2010, I requested a port number with IANA for NBD. They
> assigned port 10809 to it[1]. The procedure to request a port number, at
> the time, also included the requirement to provide a "description", for
> which I gave "Linux Network Block Device", and contact information of an
> "Assignee" and "Contact"; for both of these I passed myself.
> 
> Things have moved on since then, however, and I don't think all of that
> is appropriate anymore. So I would like to contact IANA to ask them to
> update the assignment:
> 
> - For the "Assignee", I would like to ask them to mention this
>   mailinglist. I am not sure whether IANA allows mailinglists with
>   public archives to be used in this manner; but according to RFC6335,
>   "The Assignee is the organization, company or individual person
>   responsible for the initial assignment," which to me means that the
>   mailinglist is most appropriate.

For this part, they replied that they felt doing that is not
appropriate:

    I do NOT recommend change to assignee as given; we can change to a
    “role based” address, but we do NOT recommend that this be a public
    list. The purpose of the assignee is not a point of contact for the
    general public; although provided in the IANA tables, it is point of
    contact for IANA.

So I left the assignee as is.

> - I'll leave the contact as is for now. RFC6335 mentions "The Contact
>   person is the responsible person for the Internet community to send
>   questions to.  This person is also authorized to submit changes on
>   behalf of the Assignee; in cases of conflict between the Assignee and
>   the Contact, the Assignee decisions take precedence," which to me
>   reads like a person is required (and I'm happy to continue filling
>   this role).
> - For the description, I would like to drop the "Linux" part in the
>   description. There are implementations of NBD that are wholly
>   unrelated to Linux, and so I don't think it's entirely accurate
>   anymore to refer to NBD as a "Linux" protocol.
> - At the time, there was no public reference for the NBD protocol yet; I
>   plan to add the link to proto.md on github as the official reference.

These two have now happened:

https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml?search=10809

Thanks,

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

