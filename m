Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6244B860CDF
	for <lists+nbd@lfdr.de>; Fri, 23 Feb 2024 09:34:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3206D21DAA; Fri, 23 Feb 2024 08:34:07 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb 23 08:34:07 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9BEF221D67
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Feb 2024 08:33:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.11 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id FsZp1qrMeUFG for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Feb 2024 08:33:47 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5E87321D54
	for <nbd@other.debian.org>; Fri, 23 Feb 2024 08:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0Q4g5A6vB8m1iMAHcty3RCIcdLM2Je0UUeJCc9smpG8=; b=hEUXBz3KcjQiTKduO0mMiTqeVy
	w7TRnUAXY2tCVvkMESk72CEpK1+vm3cWoJy9LeLIFn9ms01oxzJq18FQ5PtPzfwJvBNn4fFqbvnaL
	Z+TDSruHl5oF2uidfS4sWwL3TX0OcZxdUEFEASXfdO7jk5LKadw/ebgjA0An2aJjra8fsaM0rbObB
	bOY9iAw0SeW5uTGHXyWbilVX1G8XeYt6BZ48ed/66xc90RBMzQCsfkoM06G0fADwBx+nWljRymlDN
	xRTEr/vtgs0x5uAD03FKVfMiz2BvY9RjikhjAn3v2rggqK9WzvFl+14EK+AmnagayoAza2pIqNeNc
	Gy9Pvl7g==;
Received: from [102.39.148.255] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1rdR04-008tiu-07;
	Fri, 23 Feb 2024 09:33:44 +0100
Received: from wouter by pc220518 with local (Exim 4.97)
	(envelope-from <w@uter.be>)
	id 1rdQzw-000000003DQ-35bX;
	Fri, 23 Feb 2024 10:33:36 +0200
Date: Fri, 23 Feb 2024 10:33:36 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org
Subject: Re: [PATCH] server: Avoid sync bug when NBD_OPT_GO fails with
 ERR_POLICY
Message-ID: <ZdhYYCbs4_7kMfub@pc220518.home.grep.be>
References: <20240221200649.1770849-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221200649.1770849-1-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <whL43KcchME.A.ivE._hF2lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2765
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZdhYYCbs4_7kMfub@pc220518.home.grep.be
Resent-Date: Fri, 23 Feb 2024 08:34:07 +0000 (UTC)

On Wed, Feb 21, 2024 at 02:05:28PM -0600, Eric Blake wrote:
> It is imperative that all client data is consumed when replying with
> error to NBD_OPT_GO, so that the server will still be in sync if the
> client attempts another NBD_OPT_* command.  We got this right a couple
> lines earlier when server is NULL, but leave unread client data when
> commit_client() fails.

Thanks, merged.

> Fixes: e6b56c12 ("Merge branch 'extension-info'", 3.16)
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  nbd-server.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/nbd-server.c b/nbd-server.c
> index 216eb00..875c16f 100644
> --- a/nbd-server.c
> +++ b/nbd-server.c
> @@ -2607,6 +2607,8 @@ static bool handle_info(CLIENT* client, uint32_t opt, GArray* servers, uint32_t
>  	if (opt == NBD_OPT_GO) {
>  		client->clientfeats = cflags;
>  		if(!commit_client(client, server)) {
> +			consume(client, n_requests * sizeof(request), buf,
> +				sizeof(buf));
>  			send_reply(client, opt, NBD_REP_ERR_POLICY, -1, "Access denied by server configuration");
>  			return false;
>  		}
> -- 
> 2.43.2
> 
> 

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

