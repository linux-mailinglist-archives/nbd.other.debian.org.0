Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F510323F69
	for <lists+nbd@lfdr.de>; Wed, 24 Feb 2021 16:14:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2EDAA2033E; Wed, 24 Feb 2021 15:14:44 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb 24 15:14:44 2021
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=4.0 tests=DIGITS_LETTERS,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,MURPHY_SCAM1,WORD_WITHOUT_VOWELS
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 432BA202DB
	for <lists-other-nbd@bendel.debian.org>; Wed, 24 Feb 2021 15:14:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, MURPHY_SCAM1=0.1, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1TjRCqS8uHFS for <lists-other-nbd@bendel.debian.org>;
	Wed, 24 Feb 2021 15:14:34 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0C2932027E
	for <nbd@other.debian.org>; Wed, 24 Feb 2021 15:14:33 +0000 (UTC)
Received: from [102.39.44.20] (helo=pc181009)
	by lounge.grep.be with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1lEvry-0007J6-JJ; Wed, 24 Feb 2021 16:14:30 +0100
Received: from wouter by pc181009 with local (Exim 4.94)
	(envelope-from <w@uter.be>)
	id 1lEvrn-000XZX-6Z; Wed, 24 Feb 2021 17:14:19 +0200
Date: Wed, 24 Feb 2021 17:14:18 +0200
From: Wouter Verhelst <w@uter.be>
To: Graham Cobb <g.nbd@cobb.uk.net>
Cc: nbd@other.debian.org
Subject: Re: [PATCH] nbd-server: handle auth for v6-mapped IPv4 addresses
Message-ID: <YDZtShHMjHw1itK/@pc181009.grep.be>
References: <20210209000545.E95381ED558@black.home.cobb.me.uk>
 <f6c5a911-b4d1-d47c-7731-1b4dc00246e8@cobb.uk.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6c5a911-b4d1-d47c-7731-1b4dc00246e8@cobb.uk.net>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gQ5U6O0nvfJ.A.amD.k1mNgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1147
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YDZtShHMjHw1itK/@pc181009.grep.be
Resent-Date: Wed, 24 Feb 2021 15:14:44 +0000 (UTC)

Hi Graham,

Sorry, I didn't have time to review this earlier due to other
commitments (I'm a member of the FOSDEM orga team).

On Wed, Feb 17, 2021 at 11:03:43AM +0000, Graham Cobb wrote:
> On 08/02/2021 23:42, Graham R. Cobb wrote:
> > This patch adds support for using IPv4 addresses in the nbd-server auth file
> > even if the socket provides v6-mapped addresses. It extends the comparison
> > code in address_matches to handle the two cases where the auth file and the
> > socket use different address families.
> > 
> > This fixes issue #35 in the github repository.
> > 
> > Signed-off-by: Graham R. Cobb <g.nbd@cobb.uk.net>
> 
> No comments or reviewed-by so far. I am not sure of the protocol for
> this mailing list, but this is a gentle ping :-)
> 
> > ---
> >  nbdsrv.c | 30 ++++++++++++++++++++++++------
> >  1 file changed, 24 insertions(+), 6 deletions(-)
> > 
> > diff --git a/nbdsrv.c b/nbdsrv.c
> > index 168d425..01ba1b2 100644
> > --- a/nbdsrv.c
> > +++ b/nbdsrv.c
> > @@ -35,6 +35,9 @@ bool address_matches(const char* mask, const struct sockaddr* addr, GError** err
> >  	char privmask[strlen(mask)+1];
> >  	int masklen;
> >  	int addrlen = addr->sa_family == AF_INET ? 4 : 16;
> > +#define IPV4_MAP_PREFIX 12
> > +	uint8_t ipv4_mapped[IPV4_MAP_PREFIX+4] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> > +		255, 255, 0, 0, 0, 0};
> >  
> >  	strcpy(privmask, mask);
> >  
> > @@ -61,12 +64,9 @@ bool address_matches(const char* mask, const struct sockaddr* addr, GError** err
> >  		uint8_t* byte_t;
> >  		uint8_t mask = 0;
> >  		int len_left = masklen;
> > -		if(res->ai_family != addr->sa_family) {
> > -			msg(LOG_DEBUG, "client address does not match %d/%d: address family mismatch (IPv4 vs IPv6?)",
> > -			    (int)res->ai_family, (int)addr->sa_family);
> > -			goto next;
> > -		}
> > -		switch(addr->sa_family) {
> > +		if(res->ai_family == addr->sa_family) {
> > +			/* Both addresses are the same address family so do a simple comparison */
> > +			switch(addr->sa_family) {
> >  			case AF_INET:
> >  				byte_s = (const uint8_t*)(&(((struct sockaddr_in*)addr)->sin_addr));
> >  				byte_t = (uint8_t*)(&(((struct sockaddr_in*)(res->ai_addr))->sin_addr));
> > @@ -75,6 +75,24 @@ bool address_matches(const char* mask, const struct sockaddr* addr, GError** err
> >  				byte_s = (const uint8_t*)(&(((struct sockaddr_in6*)addr)->sin6_addr));
> >  				byte_t = (uint8_t*)(&(((struct sockaddr_in6*)(res->ai_addr))->sin6_addr));
> >  				break;
> > +			}

You confused me a bit here because you drop the "switch" line above, but
then change indentation rules ;-)

But okay, it makes sense, now that I look at it closer.

Applied, thanks.

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

