Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEB81889B4
	for <lists+nbd@lfdr.de>; Tue, 17 Mar 2020 17:03:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E964620644; Tue, 17 Mar 2020 16:03:40 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 17 16:03:40 2020
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,GMAIL,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,WORD_WITHOUT_VOWELS
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A9A8F20326
	for <lists-other-nbd@bendel.debian.org>; Tue, 17 Mar 2020 16:03:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	GMAIL=1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id FWZSt3K7sByb for <lists-other-nbd@bendel.debian.org>;
	Tue, 17 Mar 2020 16:03:29 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 682BE202C6
	for <nbd@other.debian.org>; Tue, 17 Mar 2020 16:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jyspaEDUsy5AZjTeQptnSiQkvLBfBVvZqrCxZFpk5mM=; b=IBv9Jf8Ty+JinlFJ9RJKbDa0/N
	O7VMjW/t1o+vTx2BOXhQwctATbtZsDoLFSqQJK4UTWVuLdhFjRyFBZbLLfY2HpoOeeFilXTuqzii9
	5uHNJZLkwVSdYw+fSeuoSy6ar/p4HcaemFiUIfHMEAPSF1gzZNv5poqpc2qXft5o3kYYKY3RuH91Y
	blV+hluTDl6rf1z6NNchTfa/CZXRIPhldhDqJ09arfC47DHFGYv/LtCIktduDaI4N6+CnAQ5yWLzF
	CpRugfotkJVS15JshwHVD4v4djPDq/FkndU1zPlzD3+2LyJ5KYB/N3ZG26WetCd4orG5nfibgVyVZ
	GbeyYNww==;
Received: from wouter by latin.grep.be with local (Exim 4.92)
	(envelope-from <wouter@grep.be>)
	id 1jEEgg-0000Nl-ML; Tue, 17 Mar 2020 17:03:26 +0100
Date: Tue, 17 Mar 2020 17:03:26 +0100
From: Wouter Verhelst <wouter@grep.be>
To: Jonathan Liu <net147@gmail.com>
Cc: nbd@other.debian.org
Subject: Re: [PATCH] server: trim whitespace from lines in authorization file
Message-ID: <20200317160326.GC27056@grep.be>
References: <20200315071051.9403-1-net147@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200315071051.9403-1-net147@gmail.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <x4A21yNn-bH.A.MfF.cTPceB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/858
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200317160326.GC27056@grep.be
Resent-Date: Tue, 17 Mar 2020 16:03:40 +0000 (UTC)

Thanks, applied.

On Sun, Mar 15, 2020 at 06:10:51PM +1100, Jonathan Liu wrote:
> The netmask line can fail to parse when passed to getaddrinfo if it
> contains whitespace such as newline when using glibc 2.29 and later.
> This results in clients being denied access even though their IP
> address is listed in the authorization file.
> 
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  nbdsrv.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/nbdsrv.c b/nbdsrv.c
> index b4fa800..168d425 100644
> --- a/nbdsrv.c
> +++ b/nbdsrv.c
> @@ -127,6 +127,7 @@ int authorized_client(CLIENT *opts) {
>    
>  	while (fgets(line,LINELEN,f)!=NULL) {
>  		char* pos;
> +		char* endpos;
>  		/* Drop comments */
>  		if((pos = strchr(line, '#'))) {
>  			*pos = '\0';
> @@ -140,7 +141,12 @@ int authorized_client(CLIENT *opts) {
>  		if(!(*pos)) {
>  			continue;
>  		}
> -		if(address_matches(line, (struct sockaddr*)&opts->clientaddr, NULL)) {
> +		/* Trim trailing whitespace */
> +		endpos = pos;
> +		while ((*endpos) && !isspace(*endpos))
> +			endpos++;
> +		*endpos = '\0';
> +		if(address_matches(pos, (struct sockaddr*)&opts->clientaddr, NULL)) {
>  			fclose(f);
>  			return 1;
>  		}
> -- 
> 2.25.1
> 
> 

-- 
<Lo-lan-do> Home is where you have to wash the dishes.
  -- #debian-devel, Freenode, 2004-09-22

