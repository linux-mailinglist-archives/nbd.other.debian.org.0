Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4277F76B5B8
	for <lists+nbd@lfdr.de>; Tue,  1 Aug 2023 15:25:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 279BE20432; Tue,  1 Aug 2023 13:25:07 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug  1 13:25:07 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=4.0 tests=ATTENDEES_DBSPAM_BODY3,
	ATTENDEES_DBSPAM_BODY6,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	DKIM_VALID_EF,FVGT_m_MULTI_ODD,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 72F452042D
	for <lists-other-nbd@bendel.debian.org>; Tue,  1 Aug 2023 13:24:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.17 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY3=1, ATTENDEES_DBSPAM_BODY6=1,
	BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FVGT_m_MULTI_ODD=0.02, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zO55KKJwfokM for <lists-other-nbd@bendel.debian.org>;
	Tue,  1 Aug 2023 13:24:48 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9C72820426
	for <nbd@other.debian.org>; Tue,  1 Aug 2023 13:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=sKjJGj/vL4/k6vwGbrJendGnJrojvy8M2mQve///4Rk=; b=F3H1WLrqOK7EtndD8ZwXR0A93q
	chdC2sQNSoszdCZ80GSBN8h2tRNKwgdSLZ8aBDwGHd1/cFAozYApYGLO8ijcYg3zLn9puL61G41JU
	d2a/wlgpNevl+E0WePPzvGP7NukQ6sXGX1jDYTEU7EAq+6tTZSGQ0TFYAabwMI9WAAbSQYXOYZBn1
	WQHWGwL71kMVJKJ1URAzgl54MhLQAI02/vsD0HzvWmaK6TJ3B6DS2r1D3f25fEdpbLDbaewyUB5We
	nS1eEgUDrtTGVbyh79BfsybJym1YPz2UxdOJrviTYx8JRZRkEVSGsi3WmLiwPxas0RO7JtKwpykw4
	SH3N5VNQ==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1qQpMj-00FHDs-QE; Tue, 01 Aug 2023 15:24:45 +0200
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1qQpMZ-000vKV-1L;
	Tue, 01 Aug 2023 15:24:35 +0200
Date: Tue, 1 Aug 2023 15:24:35 +0200
From: Wouter Verhelst <w@uter.be>
To: Matt Panaro <matt.panaro@gmail.com>
Cc: nbd@other.debian.org
Subject: Re: [PATCH] fix missing -F short-option for certfile [version 2]
Message-ID: <ZMkHk3buC5qskubT@pc220518.home.grep.be>
References: <CAAki=DV0ZV1SLr7GcFZ3mv5XHn342Lw+1KQsrfcE7h-Mvbvfyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAki=DV0ZV1SLr7GcFZ3mv5XHn342Lw+1KQsrfcE7h-Mvbvfyg@mail.gmail.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5APCTwXviIO.A.qIF.zeQykB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2586
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZMkHk3buC5qskubT@pc220518.home.grep.be
Resent-Date: Tue,  1 Aug 2023 13:25:07 +0000 (UTC)

Hi Matt,

This patch doesn't apply, possibly because your mail client mangled whitespace
or some such (but I'm not 100% sure).

Two ways out of this:

- Use "git send-email", which will automate sending the message for you;
- If you have the patch public somewhere, let me know where and I'll
  just pull.

Thanks.

On Mon, Jul 31, 2023 at 05:01:09PM -0400, Matt Panaro wrote:
> see previous thread: https://lists.debian.org/nbd/2023/07/msg00021.html
> for the motivation behind this refactor
> 
> in commit 1b8615, the `-F` short-option was accidentally refactored out of
> the codebase, so that only the long-option for `-certfile` would work.
> This commit restores the `-F` short-option, as well as conditionally
> populating the `short_opts` string based on compilation-options for
> `NETLINK` and `GNUTLS`
> ---
>  nbd-client.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/nbd-client.c b/nbd-client.c
> index dae4636..ac0419d 100644
> --- a/nbd-client.c
> +++ b/nbd-client.c
> @@ -896,11 +896,14 @@ void disconnect(char* device) {
>         close(nbd);
>  }
> 
> +static const char *short_opts = "-B:b:c:d:gH:hlnN:PpRSst:uVx"
>  #if HAVE_NETLINK
> -static const char *short_opts = "-A:B:b:c:C:d:gH:hK:LlnN:PpRSst:uVx";
> -#else
> -static const char *short_opts = "-A:B:b:c:C:d:gH:hK:lnN:PpRSst:uVx";
> +       "L"
> +#endif
> +#if HAVE_GNUTLS
> +       "A:C:F:K:"
>  #endif
> +       ;
> 
>  int main(int argc, char *argv[]) {
>         char* port=NBD_DEFAULT_PORT;

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

