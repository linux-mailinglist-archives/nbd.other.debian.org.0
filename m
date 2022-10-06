Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8DC5F672A
	for <lists+nbd@lfdr.de>; Thu,  6 Oct 2022 15:02:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B56A7206E6; Thu,  6 Oct 2022 13:02:25 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Oct  6 13:02:25 2022
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9025E206DD
	for <lists-other-nbd@bendel.debian.org>; Thu,  6 Oct 2022 13:02:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.58 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4b2prihHjW18 for <lists-other-nbd@bendel.debian.org>;
	Thu,  6 Oct 2022 13:02:10 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D460D206DA
	for <nbd@other.debian.org>; Thu,  6 Oct 2022 13:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8EQe9dzfNyRQNLL9xWp13OMHWyFImFo3OV9hBiZkzig=; b=o75ZhAs6VMJJStUAFfQrvsGw3e
	V6FsDi/+xdEuP1QZXmBo0SIbOM8OSBGR0o9rkvECUONZl9sK5+BdY/vPZbJKkz1kWhxIZPLRByXNW
	xHw+TBGpPKXnDLEwtWyVFBNaO019Rj6s+lm4kiavIC8bUueJRt6BYKv7+EsxNTxhftSL7MmRXzDBZ
	3HvTbiCshA7xbQEwYArpkqZPgnTHwSREjCe1iUS4B1T0rfYd5t6Hphc1N98e7Re0KkPRZilk5Kfx8
	/RJ8yoTAX1LYewWOyZuL5LQFoRSanc2PeLIhkeARgxS7c8iHjtkZhzRAqE2kIwALHlpAe+aet7AoS
	gmR7SAeQ==;
Received: from [102.39.120.199] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1ogQVo-009g3X-Lb; Thu, 06 Oct 2022 15:02:04 +0200
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1ogQVf-001MTN-2K;
	Thu, 06 Oct 2022 15:01:55 +0200
Date: Thu, 6 Oct 2022 15:01:54 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org,
	=?utf-8?B?5ZCV5qKm5pitMTAyODY0NDI=?= <lv.mengzhao@zte.com.cn>
Subject: Re: [PATCH] tests: Fix typo in recent test change
Message-ID: <Yz7RwkkZlSzyeFw2@pc220518.home.grep.be>
References: <20221005192635.2879334-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221005192635.2879334-1-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xHFre_gfqVD.A.JUH.hHtPjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2234
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Yz7RwkkZlSzyeFw2@pc220518.home.grep.be
Resent-Date: Thu,  6 Oct 2022 13:02:25 +0000 (UTC)

On Wed, Oct 05, 2022 at 02:26:35PM -0500, Eric Blake wrote:
> A missing } caused 'make check' to fail.  While at it, use TAB
> consistently.

Whoops, didn't check that properly.

Yes, thanks; please push.

> Fixes: af309d8a ("nbd-server: fix bug in auth for v6-mapped IPv4 addresses")
> CC: 吕梦昭10286442 <lv.mengzhao@zte.com.cn>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> Pushed as obvious.
> 
>  tests/code/clientacl.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/code/clientacl.c b/tests/code/clientacl.c
> index 3bceb2f..da614fd 100644
> --- a/tests/code/clientacl.c
> +++ b/tests/code/clientacl.c
> @@ -29,8 +29,9 @@ bool do_test(char* address, char* netmask) {
>  	while(res) {
>  		if((err = getnameinfo((struct sockaddr*)res->ai_addr, res->ai_addrlen, buf,
>                                         sizeof (buf), NULL, 0, NI_NUMERICHOST))) {
> -                        fprintf(stderr, "E: %s\n", gai_strerror(err));
> -                        exit(EXIT_FAILURE);
> +			fprintf(stderr, "E: %s\n", gai_strerror(err));
> +			exit(EXIT_FAILURE);
> +		}
> 
>  		printf("Found %s\n", buf);
> 
> -- 
> 2.37.3
> 
> 

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

