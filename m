Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 405EF8B201C
	for <lists+nbd@lfdr.de>; Thu, 25 Apr 2024 13:21:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E56192058B; Thu, 25 Apr 2024 11:21:57 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr 25 11:21:57 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3AC6A20589
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 Apr 2024 11:21:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id UZqRBM5So_bG for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 Apr 2024 11:21:38 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E656D20588
	for <nbd@other.debian.org>; Thu, 25 Apr 2024 11:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Hp4D1QCf93sLjOzS5kYu6YYaOKWP3sm8DO2MeX7ZujY=; b=N778tAIdcYtC4D0439uifb1+2R
	Y87yjQ/nOOc0/8cfn1S2mcHzqlUpQeGhtj0ga/95cxLiRDhiOP2JcJ8YPIc5yl3+7ZGRKTYy2pWG5
	RyQbWkiTPcNt9g25AU45kLHMGYCMINohRe+maWD3fD/2qjw0UBjHOzudyPQSXcEoXrdLgtpi3lo2t
	1DYP2lddqssjLOnO7I8Ne3kcB8H2SFHRQdzjckgShi4doGoei98mZV+9MKpHo2sleycYjDb6/3M3g
	GAOXfxsfoPYQrLZ3Krkop6Yf4xXDp9mZCIEpRgXTDkYTJDDXgnRe3p0dQHWYY/bp1bNgVDcDuuyFo
	LItyqJ6g==;
Received: from [102.39.198.120] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1rzxAW-005Iro-0R;
	Thu, 25 Apr 2024 13:21:36 +0200
Received: from wouter by pc220518 with local (Exim 4.97)
	(envelope-from <w@uter.be>)
	id 1rzx8A-00000000qhd-0pKJ;
	Thu, 25 Apr 2024 13:19:10 +0200
Date: Thu, 25 Apr 2024 13:19:08 +0200
From: Wouter Verhelst <w@uter.be>
To: Lars Rohwedder <roker@pep-project.org>
Cc: nbd@other.debian.org
Subject: Re: Updating the NBD assignment at IANA
Message-ID: <Zio8LKKoQypOzMQl@pc220518.home.grep.be>
References: <Zij-Wnsu2F7_HwMZ@pc220518.home.grep.be>
 <0c695746-eca2-459f-88b9-0238449578c8@pep-project.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c695746-eca2-459f-88b9-0238449578c8@pep-project.org>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LO85JLKMKTE.A.RYD.VzjKmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2799
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Zio8LKKoQypOzMQl@pc220518.home.grep.be
Resent-Date: Thu, 25 Apr 2024 11:21:57 +0000 (UTC)

On Wed, Apr 24, 2024 at 03:37:22PM +0200, Lars Rohwedder wrote:
> 
> > - For the "Assignee", I would like to ask them to mention this
> >    mailinglist.
> >    […]
> > - I'll leave the contact as is for now. RFC6335 mentions "The Contact
> >    person is the responsible person for the Internet community to send
> >    questions to.  This person is also authorized to submit changes on
> >    behalf of the Assignee; in cases of conflict between the Assignee and
> >    the Contact, the Assignee decisions take precedence," which to me
> >    reads like a person is required (and I'm happy to continue filling
> >    this role).
> That means: The "Assignee" (the ML) has precedence over decisions made by
> the "Contact" (you).
> 
> 🤔

Which, given that the community is larger than just me, seems
appropriate?

> > - For the description, I would like to drop the "Linux" part in the
> >    description. There are implementations of NBD that are wholly
> >    unrelated to Linux, and so I don't think it's entirely accurate
> >    anymore to refer to NBD as a "Linux" protocol.
> 
> ACK.
> 
> I am curious: Are there other OS (BSD flavours?) that uses NBD at the client
> side? If yes, they should be mentioned in the NBD's readme, I'd suggest.

There are, indeed, and they are already mentioned there (under the
section "Alternate implementations").

Up-to-date client implementations exist for Windows, FreeBSD, qemu, and
bare metal, as well as in library form through libnbd.

There also used to be implementations for The Hurd and Plan 9, but they
appear to have disappeared off the Internet.

Finally, there is also an implementation of nbd in "bitrig", an openbsd
fork for arm machines. I can't find any reference to it anymore though.

> > - At the time, there was no public reference for the NBD protocol yet; I
> >    plan to add the link to proto.md on github as the official reference.
> > 
> > Thoughts?
> 
> Go for it! :-)

Since I only got positive replies here, doing so.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

