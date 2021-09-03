Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7282D3FFDE7
	for <lists+nbd@lfdr.de>; Fri,  3 Sep 2021 12:06:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 281EE20ADB; Fri,  3 Sep 2021 10:06:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Sep  3 10:06:35 2021
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E665A20AD5
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Sep 2021 10:06:26 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JwyQVF86F0zB for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Sep 2021 10:06:24 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6CE2120AD4
	for <nbd@other.debian.org>; Fri,  3 Sep 2021 10:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=TL67ycVj+0xGUP+gTv4vksINH9WeA90xeUM5ye7i7/4=; b=Uafsz4YWPcK+B+zqdbBpY3bcVh
	bJ06pc9zMJLl1U3e+VWnbuR3R/x0Oy6EIbauzU68Ey/jtUfYX/ORpR1Zn3HYkO0mCEJrNk/jAGncG
	ijJhGyhTG31dcNTJ6Xj3Ce04rpP6nBqNcRGQUCWalLsMtfbF1gLtGkJphMd2dyUErlY6pXFFoyFOD
	UGg1b1+dEUE+ut/5J2YXc6BTonW58YovgbbRkesjv/gFKG4Az8wsWOiZM8Fk0decm67efPn0hd1m+
	x7c5K2C7hvuXR+/e7rqlBVqXUoUrCkCIm/q98lZJ7YQ4faRdEu8z8fDt45vcMcOD0sybh9nqXAFBG
	jkqSsm9Q==;
Received: from [102.39.40.13] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mM65W-007UxD-30; Fri, 03 Sep 2021 12:06:22 +0200
Received: from wouter by pc181009 with local (Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mM65O-0001vi-On; Fri, 03 Sep 2021 12:06:14 +0200
Date: Fri, 3 Sep 2021 12:06:14 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, libguestfs@redhat.com
Subject: Re: [PATCH] client: Don't confuse Unix socket with TLS hostname
Message-ID: <YTHzliBvU2+0/R5V@pc181009.grep.be>
References: <20210902220729.974965-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902220729.974965-1-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <BcTKT72e21E.A.S9G.rOfMhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1369
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YTHzliBvU2+0/R5V@pc181009.grep.be
Resent-Date: Fri,  3 Sep 2021 10:06:35 +0000 (UTC)

Ack, thanks -- please commit.

On Thu, Sep 02, 2021 at 05:07:29PM -0500, Eric Blake wrote:
> When using -u but not -H, we were ending up calling
> gnutls_session_set_verify_cert() with the Unix socket's path name,
> which is bound to fail (hostnames don't start with /).  Saner is to
> only default tlshostname when using TCP sockets.
> 
> See also https://gitlab.com/nbdkit/nbdkit/-/issues/1, as this was
> detected during an attempt to prove TLS interoperability between
> nbd-client and nbdkit.  Pre-patch, I have to add '-H localhost' to the
> nbd-client command line when using nbdkit with a Unix socket, but not
> when using a TCP socket; post-patch, I can omit -H and still connect
> /dev/nbd0 over TLS using either TCP or Unix.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  nbd-client.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/nbd-client.c b/nbd-client.c
> index e9079a9..463ff86 100644
> --- a/nbd-client.c
> +++ b/nbd-client.c
> @@ -1186,7 +1186,7 @@ int main(int argc, char *argv[]) {
>  		}
>  	}
> 
> -        if (!tlshostname && hostname)
> +        if (!tlshostname && hostname && !b_unix)
>                  tlshostname = strdup(hostname);
> 
>  	if (netlink)
> -- 
> 2.31.1
> 
> 

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

