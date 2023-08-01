Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 867BA76BE8E
	for <lists+nbd@lfdr.de>; Tue,  1 Aug 2023 22:38:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6CA38203C1; Tue,  1 Aug 2023 20:38:44 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug  1 20:38:44 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=4.0 tests=ATTENDEES_DBSPAM_BODY6,
	ATTENDEES_DBSPAM_BODY7,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 84C73203A6
	for <lists-other-nbd@bendel.debian.org>; Tue,  1 Aug 2023 20:38:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.09 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY6=1, ATTENDEES_DBSPAM_BODY7=1,
	BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gvtSasZ_ypwx for <lists-other-nbd@bendel.debian.org>;
	Tue,  1 Aug 2023 20:38:29 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E7C3B202D8
	for <nbd@other.debian.org>; Tue,  1 Aug 2023 20:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VMhlscV8nshNlL/NZi2wIE6Qf3JE4Uptpn43h4nGzTk=; b=V74qj9cFqM6RbNUXXWHoM/Cp5/
	GbCjCr8KGQ0Ggdiya+ffUV3w5BjJ7Cb4A2mUVV0Hf2n/MKhUaKAUPB5WBJyZYIFVyp1PzfQxnytBp
	a9p+2TOn+qTHn2/kPY+x8SVQH32V5pDaw/7JK+hO0n1awgvhSkbUSlolzvk0cUlIWygJkn5iLi0n3
	HIm31uYBwSkLN6p/cFCucmU6MQmJgVxNWiJ6uI7834kN+ENUs8oi5jJQvNo97B24GTPYXlU84PmUi
	gvQ/8oHOwFkzcbe0OOt7Qn7bzLshUGZZeunt/5VGUbGtdkICOYdQ1C08/4+KaC0X4x5v35ywTLs4P
	ISSJzdcA==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1qQw8Q-009hWK-Qo; Tue, 01 Aug 2023 22:38:26 +0200
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1qQw8H-0005jP-2P;
	Tue, 01 Aug 2023 22:38:17 +0200
Date: Tue, 1 Aug 2023 22:38:17 +0200
From: Wouter Verhelst <w@uter.be>
To: Matt Panaro <matt.panaro@gmail.com>
Cc: nbd@other.debian.org
Subject: Re: [PATCH] fix missing -F short-option for certfile [version 2]
Message-ID: <ZMltOf3PhVyI4jhI@pc220518.home.grep.be>
References: <CAAki=DV0ZV1SLr7GcFZ3mv5XHn342Lw+1KQsrfcE7h-Mvbvfyg@mail.gmail.com>
 <ZMkHk3buC5qskubT@pc220518.home.grep.be>
 <CAAki=DVAvo3OxusJDkErPifHwnPOgW=SEj=5zja34Djr9ARajQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAki=DVAvo3OxusJDkErPifHwnPOgW=SEj=5zja34Djr9ARajQ@mail.gmail.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <E-IQyelzdKG.A.ZnG.U1WykB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2588
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZMltOf3PhVyI4jhI@pc220518.home.grep.be
Resent-Date: Tue,  1 Aug 2023 20:38:44 +0000 (UTC)

Hi Matt,

On Tue, Aug 01, 2023 at 12:16:55PM -0400, Matt Panaro wrote:
>    so when I did `git format-patch`, I omitted the bottom 2 lines from the
>    output in the email (it was a string of 3 hyphens, and the git-version,
>    IIRC): are those mandatory?

I don't think so, no.

So "git format-patch" is a good start, but if you use that (and not git
send-email), then you should make sure that your mail client doesn't
mangle the output.

In your case, we got:

- a text/plain and text/html MIME part, which results in "git am" trying
  to match the HTML version of the patch in the original source file
  (and that going horribly wrong, for obvious reasons)
- Your mail client having replaced at least one horizontal tab character
  by 8 spaces, which means the patch lines do not match anymore, even
  after I just extracted the text/plain part of your email to a file.

and possibly a few other things -- I didn't go over the patch with a
fine-toothed comb ;-)

The easiest way around this is to use "git send-email", which takes the
output of "git format-patch" and sends it to the recipient without any
mangling going on, either through /usr/bin/sendmail, or (if you haven't
configured that, which is very reasonable in today's world) through a
direct SMTP connection (with support for pretty much all types of SMTP
authentication that may be required in today's world).

Failing that, you can also add the output of "git format-patch" as an
attachment. This allows me to apply it cleanly again. But that's
actually more work than just using "git format-patch", honestly ;-)

>    I can either put a snippet on github and send the link; or I could try
>    opening up an actual PR on GitHub, if that's permissible;

These both work too, if you prefer.

>    or I can try replying again w/ the full/unadulterated
>    `format-patch` output in the body of hte email (I think I also
>    removed the subject-line from the output and put it directly in the
>    email subject-line? maybe I should've just left everything as-was;
>    too used to github's workflow)

This might go wrong again, if your mail client decides that "this tab
character is silly, let's change that" or some similar silliness. You
probably shouldn't do that.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

