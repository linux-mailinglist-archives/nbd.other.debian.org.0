Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F60CE4A2C
	for <lists+nbd@lfdr.de>; Sun, 28 Dec 2025 09:29:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 484FB20666; Sun, 28 Dec 2025 08:29:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Dec 28 08:29:35 2025
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FVGT_m_MULTI_ODD,LDOSUBSCRIBER,
	LDO_WHITELIST autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A06452065D
	for <lists-other-nbd@bendel.debian.org>; Sun, 28 Dec 2025 08:29:26 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FVGT_m_MULTI_ODD=0.02,
	LDO_WHITELIST=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id WFQai4E8-6Za for <lists-other-nbd@bendel.debian.org>;
	Sun, 28 Dec 2025 08:29:22 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 1445 seconds by postgrey-1.36 at bendel; Sun, 28 Dec 2025 08:29:22 UTC
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9D1652060A
	for <nbd@other.debian.org>; Sun, 28 Dec 2025 08:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7cOxS2+UQuAQrWGdAhurRHo4N5HYKq7Vp2+2E3wEiOk=; b=ApGgx5WAwS/m6GVAHrQ48DhDtX
	GgKVPlHFrymrVIZRtUDLG6yCpsmjCHnrHLGqCOslbJy4hhPefxvAqtpo2Lmi8VtYcvWWeySKWKquO
	npUt/IepKVB8yfJTWEA+ifaZo7kgydDgNXAMuqk/wEGpXkG70JqU4rBiRK+MjCX5Vak7zExXIYxLO
	u7mzylRgLtMYkq7KokD0xGSuscCMq06cfEb9n29egYJ6AyHxUL8I22DpEHJsNMzkRnVabT6/c/uTl
	RgA9i1gMTya4Q68PAWYCmKfcKq8WKpabkTptt0dKNui/HM1C5m3Y0+MP1BidT33zj5PtxIMMCJZhc
	gcn+y9GA==;
Received: from [102.39.233.88] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <w@uter.be>)
	id 1vZlm6-0000000HNbs-0uJg;
	Sun, 28 Dec 2025 09:05:14 +0100
Received: from wouter by pc220518 with local (Exim 4.98.2)
	(envelope-from <w@uter.be>)
	id 1vZllv-00000000RDP-1F3p;
	Sun, 28 Dec 2025 10:05:03 +0200
Date: Sun, 28 Dec 2025 10:05:03 +0200
From: Wouter Verhelst <w@uter.be>
To: Yunseong Kim <ysk@kzalloc.com>
Cc: Eric Blake <eblake@redhat.com>, Pavel Machek <pavel@kernel.org>,
	nbd@other.debian.org
Subject: Re: [PATCH] nbd: fix build failure after openunix/opennet refactor
Message-ID: <aVDkryhNK5xNcOGF@pc220518.home.grep.be>
References: <20250915002941.937139-2-ysk@kzalloc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250915002941.937139-2-ysk@kzalloc.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <VFyZiyvzsGJ.A.FM2J.vpOUpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3483
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/aVDkryhNK5xNcOGF@pc220518.home.grep.be
Resent-Date: Sun, 28 Dec 2025 08:29:35 +0000 (UTC)

Hi there,

Sorry for the late reply; applied.

On Mon, Sep 15, 2025 at 12:29:42AM +0000, Yunseong Kim wrote:
> Commit 17043b068f43 ("Refactor the negotiate() and connected functions")
> removed all parameters from openunix() and opennet(), but main()
> still called them with host/port arguments. This causes build errors:
> 
> nbd-client.c:1224:32: error: too many arguments to function ‘openunix’; expected 0, have 1
> nbd-client.c:1226:32: error: too many arguments to function ‘opennet’; expected 0, have 2
> 
> Update the calls in main() to match the new prototypes.
> 
> Fixes: 17043b068f43 ("Refactor the negotiate() and connected functions")
> Signed-off-by: Yunseong Kim <ysk@kzalloc.com>
> ---
>  nbd-client.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/nbd-client.c b/nbd-client.c
> index 158ec80..e809d9c 100644
> --- a/nbd-client.c
> +++ b/nbd-client.c
> @@ -1221,9 +1221,9 @@ int main(int argc, char *argv[]) {
>  
>  	for (i = 0; i < cur_client->nconn; i++) {
>  		if (cur_client->b_unix)
> -			sock = openunix(cur_client->hostn);
> +			sock = openunix();
>  		else
> -			sock = opennet(cur_client->hostn, cur_client->port);
> +			sock = opennet();
>  		if (sock < 0)
>  			exit(EXIT_FAILURE);
>  
> -- 
> 2.51.0
> 
> 

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

