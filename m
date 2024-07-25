Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 861AE93C07B
	for <lists+nbd@lfdr.de>; Thu, 25 Jul 2024 12:58:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6506920EFA; Thu, 25 Jul 2024 10:58:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jul 25 10:58:09 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,GMAIL,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 41E8B20ED9
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 Jul 2024 10:58:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, GMAIL=1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 5B4LXQnbv_qV for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 Jul 2024 10:57:56 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 2543 seconds by postgrey-1.36 at bendel; Thu, 25 Jul 2024 10:57:56 UTC
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5815D20ECD
	for <nbd@other.debian.org>; Thu, 25 Jul 2024 10:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=w+EPhbJqc3bGqBfvjL+u+dHqxUMCcpAl6N7fvR9iu7Y=; b=MLlG5jIo+KEhg9BhcC8QiI4ljM
	scvaCX9Mxptk+jiKZbYIIdPbpyReydV7ndTHZzR8B1DgqLICSXdLiN8UODBs7HXXqYTcD2F6Df2zf
	ZuHXpAADCD8JwcxJOdtyPFwxmdZrwzVYnu6pbiGQnIwmD3oZ8bmZZN8wLnZoEjlrJsQ12P4fe6zQ9
	slksxCgkN+toWRONxJ0DIY91w/rhRk98b2mmFOU/AWdshlxOzpm/gVPZQiRmHhAHX+gl96JP7uI63
	M9IsD4DG+kfNZgepz4LwD96r82zfyST7vacLGXfH3wZ3b2fQxiyqrK7etFdorZUWuplvGXmbdEij6
	acH5BdBQ==;
Received: from [102.39.153.168] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1sWvVS-000sLC-2t;
	Thu, 25 Jul 2024 12:15:30 +0200
Received: from wouter by pc220518 with local (Exim 4.98)
	(envelope-from <w@uter.be>)
	id 1sWvVL-00000002kqB-0u15;
	Thu, 25 Jul 2024 12:15:23 +0200
Date: Thu, 25 Jul 2024 12:15:23 +0200
From: Wouter Verhelst <w@uter.be>
To: Khem Raj <raj.khem@gmail.com>
Cc: nbd@other.debian.org
Subject: Re: [PATCH] nbd-client: Fix build on musl + gcc14
Message-ID: <ZqIlu9hW52wX92mJ@pc220518.home.grep.be>
References: <20240521005051.2333219-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521005051.2333219-1-raj.khem@gmail.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GL2pjKuITwD.A.dMqP.B_iomB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3101
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZqIlu9hW52wX92mJ@pc220518.home.grep.be
Resent-Date: Thu, 25 Jul 2024 10:58:09 +0000 (UTC)

Thanks, applied

On Mon, May 20, 2024 at 05:50:51PM -0700, Khem Raj wrote:
> GCC-14 has promoted incompatible-pointer-types warning into error which is
> now flagged especially with when building on musl
> 
> Fixes following error
> 
> | ../nbd-3.26.1/nbd-client.c: In function 'openunix':
> | ../nbd-3.26.1/nbd-client.c:345:27: error: passing argument 2 of 'connect' from incompatible pointer type [-Wincompatible-pointer-types]
> |   345 |         if (connect(sock, &un_addr, sizeof(un_addr)) == -1) {
> |       |                           ^~~~~~~~
> |       |                           |
> |       |                           struct sockaddr_un *
> | In file included from ../nbd-3.26.1/nbd-client.c:25:
> | /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/nbd/3.26.1/recipe-sysroot/usr/include/sys/socket.h:386:19: note: expected 'const struct sockaddr *' but argument is of type 'struct sockaddr_un *'
> |   386 | int connect (int, const struct sockaddr *, socklen_t);
> |       |                   ^~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  nbd-client.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/nbd-client.c b/nbd-client.c
> index 8d1101b..7b25c67 100644
> --- a/nbd-client.c
> +++ b/nbd-client.c
> @@ -342,7 +342,7 @@ int openunix(const char *path) {
>  		return -1;
>  	};
>  
> -	if (connect(sock, &un_addr, sizeof(un_addr)) == -1) {
> +	if (connect(sock, (struct sockaddr*)&un_addr, sizeof(un_addr)) == -1) {
>  		err_nonfatal("CONNECT failed");
>  		close(sock);
>  		return -1;
> -- 
> 2.45.1
> 
> 

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

