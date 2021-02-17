Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F79831D7F5
	for <lists+nbd@lfdr.de>; Wed, 17 Feb 2021 12:10:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 20A90204CB; Wed, 17 Feb 2021 11:10:50 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb 17 11:10:50 2021
Old-Return-Path: <g.nbd@cobb.uk.net>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,WORD_WITHOUT_VOWELS
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2B52120470
	for <lists-other-nbd@bendel.debian.org>; Wed, 17 Feb 2021 11:10:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.585 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.105,
	RCVD_IN_DNSWL_MED=-2.3, WORD_WITHOUT_VOWELS=1]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id D8srnzvMpZRU for <lists-other-nbd@bendel.debian.org>;
	Wed, 17 Feb 2021 11:10:37 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 383 seconds by postgrey-1.36 at bendel; Wed, 17 Feb 2021 11:10:37 UTC
Received: from zaphod.cobb.me.uk (zaphod.cobb.me.uk [213.138.97.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A04F220342
	for <nbd@other.debian.org>; Wed, 17 Feb 2021 11:10:37 +0000 (UTC)
Received: by zaphod.cobb.me.uk (Postfix, from userid 107)
	id E4CCE9C0AB; Wed, 17 Feb 2021 11:03:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cobb.uk.net;
	s=201703; t=1613559828;
	bh=d/ceyQI7plbbydMQkycR57el0QdFGEWXyDN4fqVCSCk=;
	h=From:To:References:Subject:Date:In-Reply-To:From;
	b=ZACv3aiuBJ4UgBU1sTzi127lP2YAUwUpl/7g62u1cOymegaccENxSiBVO3Y1nZEsx
	 hza2mRegHVnE/NRquj1a1FlWxe6WtnU4x/EUjmQVrXmvqFUapzX9AZWFos/pbsYnUf
	 ZkJjs1tD7WdXDewIqWwK39dv7yfIBgaq6B4a7wdjOljZJohvBMuFaK7X8SK5WRmO+i
	 sdGOXTPNSdTTAef2fBI0WsHKlcOzT/2xrbTJQtPiIDlojd9W4oM/fdeFp2pKa7jGdO
	 OVoJyePdjLtfLPAwi6JjZ+5aDPi6uK5i0TVag3NLQxPS7yXaButkWfPsMbQ+q0PVhk
	 T8ZYKGDV2wrcQ==
Received: from black.home.cobb.me.uk (unknown [192.168.0.205])
	by zaphod.cobb.me.uk (Postfix) with ESMTP id E1D249BDD6
	for <nbd@other.debian.org>; Wed, 17 Feb 2021 11:03:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cobb.uk.net;
	s=201703; t=1613559823;
	bh=d/ceyQI7plbbydMQkycR57el0QdFGEWXyDN4fqVCSCk=;
	h=From:To:References:Subject:Date:In-Reply-To:From;
	b=TohCY1t+utSmp9vKstjoTjyoCmFgh1c83Pm4s7BcNk4r5yDy7vduoQ+Q6nKEHFccx
	 Y2no7WPCCL38GA8aXDHt7VpSBrE8M2YQY+g4YNJAoQT5lR/AWts79msiMEk9wmUNHX
	 JmUaGxZzhXA+PT60ZxOItK4flb9+OT05G54BNDVG0mXLg2ddEqGZnigo6Ioml3wMQe
	 GhMonCFlIWo9qOEElUBVgN4Kk00hSmu4vrMERcXy16rrX1nwkecCYR9BKBklFH6PHL
	 4MSQfJC0X2m4zHNIl0IeX5BpE0DcFJyW1YR309cJ2GVFPSalNfi/3YFqstyzoGxipX
	 qH0x8m5qxpVhQ==
Received: from [192.168.0.202] (ryzen.home.cobb.me.uk [192.168.0.202])
	by black.home.cobb.me.uk (Postfix) with ESMTPS id A47E01F1BE6
	for <nbd@other.debian.org>; Wed, 17 Feb 2021 11:03:43 +0000 (GMT)
From: Graham Cobb <g.nbd@cobb.uk.net>
To: nbd@other.debian.org
References: <20210209000545.E95381ED558@black.home.cobb.me.uk>
Subject: Re: [PATCH] nbd-server: handle auth for v6-mapped IPv4 addresses
Message-ID: <f6c5a911-b4d1-d47c-7731-1b4dc00246e8@cobb.uk.net>
Date: Wed, 17 Feb 2021 11:03:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210209000545.E95381ED558@black.home.cobb.me.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0OO6X4ILHcK.A.e3C.6mPLgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1131
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f6c5a911-b4d1-d47c-7731-1b4dc00246e8@cobb.uk.net
Resent-Date: Wed, 17 Feb 2021 11:10:50 +0000 (UTC)

On 08/02/2021 23:42, Graham R. Cobb wrote:
> This patch adds support for using IPv4 addresses in the nbd-server auth file
> even if the socket provides v6-mapped addresses. It extends the comparison
> code in address_matches to handle the two cases where the auth file and the
> socket use different address families.
> 
> This fixes issue #35 in the github repository.
> 
> Signed-off-by: Graham R. Cobb <g.nbd@cobb.uk.net>

No comments or reviewed-by so far. I am not sure of the protocol for
this mailing list, but this is a gentle ping :-)

> ---
>  nbdsrv.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/nbdsrv.c b/nbdsrv.c
> index 168d425..01ba1b2 100644
> --- a/nbdsrv.c
> +++ b/nbdsrv.c
> @@ -35,6 +35,9 @@ bool address_matches(const char* mask, const struct sockaddr* addr, GError** err
>  	char privmask[strlen(mask)+1];
>  	int masklen;
>  	int addrlen = addr->sa_family == AF_INET ? 4 : 16;
> +#define IPV4_MAP_PREFIX 12
> +	uint8_t ipv4_mapped[IPV4_MAP_PREFIX+4] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> +		255, 255, 0, 0, 0, 0};
>  
>  	strcpy(privmask, mask);
>  
> @@ -61,12 +64,9 @@ bool address_matches(const char* mask, const struct sockaddr* addr, GError** err
>  		uint8_t* byte_t;
>  		uint8_t mask = 0;
>  		int len_left = masklen;
> -		if(res->ai_family != addr->sa_family) {
> -			msg(LOG_DEBUG, "client address does not match %d/%d: address family mismatch (IPv4 vs IPv6?)",
> -			    (int)res->ai_family, (int)addr->sa_family);
> -			goto next;
> -		}
> -		switch(addr->sa_family) {
> +		if(res->ai_family == addr->sa_family) {
> +			/* Both addresses are the same address family so do a simple comparison */
> +			switch(addr->sa_family) {
>  			case AF_INET:
>  				byte_s = (const uint8_t*)(&(((struct sockaddr_in*)addr)->sin_addr));
>  				byte_t = (uint8_t*)(&(((struct sockaddr_in*)(res->ai_addr))->sin_addr));
> @@ -75,6 +75,24 @@ bool address_matches(const char* mask, const struct sockaddr* addr, GError** err
>  				byte_s = (const uint8_t*)(&(((struct sockaddr_in6*)addr)->sin6_addr));
>  				byte_t = (uint8_t*)(&(((struct sockaddr_in6*)(res->ai_addr))->sin6_addr));
>  				break;
> +			}
> +		} else {
> +			/* Addresses are different families, compare IPv4-mapped IPv6 address */
> +			switch(addr->sa_family) {
> +			case AF_INET:
> +				/* Map client address to IPv6 for comparison */
> +				memcpy(&ipv4_mapped[IPV4_MAP_PREFIX], &(((struct sockaddr_in*)addr)->sin_addr), 4);
> +				byte_s = (const uint8_t*)&ipv4_mapped;
> +				byte_t = (uint8_t*)(&(((struct sockaddr_in6*)(res->ai_addr))->sin6_addr));
> +				len_left += IPV4_MAP_PREFIX * 8;
> +				break;
> +			case AF_INET6:
> +				byte_s = (const uint8_t*)(&(((struct sockaddr_in6*)addr)->sin6_addr));
> +				/* Map res to IPv6 for comparison */
> +				memcpy(&ipv4_mapped[IPV4_MAP_PREFIX], &(((struct sockaddr_in*)(res->ai_addr))->sin_addr), 4);
> +				byte_t = &ipv4_mapped[0];
> +				break;
> +			}
>  		}
>  		while(len_left >= 8) {
>  			if(*byte_s != *byte_t) {
> 

