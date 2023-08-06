Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE4A771578
	for <lists+nbd@lfdr.de>; Sun,  6 Aug 2023 15:54:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9A4662084C; Sun,  6 Aug 2023 13:54:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Aug  6 13:54:12 2023
Old-Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,GMAIL,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI,WORD_WITHOUT_VOWELS autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EC1C420848
	for <lists-other-nbd@bendel.debian.org>; Sun,  6 Aug 2023 13:36:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.091 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, GMAIL=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5, T_SCC_BODY_TEXT_LINE=-0.01,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id yUa3GNhniVtV for <lists-other-nbd@bendel.debian.org>;
	Sun,  6 Aug 2023 13:36:29 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .linuxfoundation. - helo: .dfw.source.kernel. - helo-domain: .kernel.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 44E8120843
	for <nbd@other.debian.org>; Sun,  6 Aug 2023 13:36:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BEC5461147;
	Sun,  6 Aug 2023 13:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E84C433C8;
	Sun,  6 Aug 2023 13:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691328982;
	bh=x0PpT5p+QbnzQ42XPIImjfH70NVnMPNFz0tYlMnwl5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wSGNzWyotOrdMn3jwBKbL4Ta4b/Ql9eX3Rzj6uj/uSbof6tWvunzBYVpDl48ifFbQ
	 qRdnnp4KOZO2eug5qQ0mkeBr/Te64zP7e2HwtH80rTqq9/OdCe5qmG2tjnjLocuyyw
	 SSeSUcxKrzsGvWHCo/H6WD6oFt+nhc1HgNBPlJQw=
Date: Sun, 6 Aug 2023 15:36:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Atul Kumar Pant <atulpant.linux@gmail.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org,
	shuah@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
	nbd@other.debian.org
Subject: Re: [PATCH v1] drivers: block: Updates return value check
Message-ID: <2023080600-pretext-corporal-61e3@gregkh>
References: <20230806122351.157168-1-atulpant.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230806122351.157168-1-atulpant.linux@gmail.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_EJnkz2SNaD.A.0LF.EY6zkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2593
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2023080600-pretext-corporal-61e3@gregkh
Resent-Date: Sun,  6 Aug 2023 13:54:12 +0000 (UTC)

On Sun, Aug 06, 2023 at 05:53:51PM +0530, Atul Kumar Pant wrote:
> Updating the check of return value from debugfs_create_dir
> to use IS_ERR.

Why?

> 
> Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> ---
>  drivers/block/nbd.c     | 4 ++--
>  drivers/block/pktcdvd.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 9c35c958f2c8..65ecde3e2a5b 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1666,7 +1666,7 @@ static int nbd_dev_dbg_init(struct nbd_device *nbd)
>  		return -EIO;
>  
>  	dir = debugfs_create_dir(nbd_name(nbd), nbd_dbg_dir);
> -	if (!dir) {
> +	if (IS_ERR(dir)) {
>  		dev_err(nbd_to_dev(nbd), "Failed to create debugfs dir for '%s'\n",
>  			nbd_name(nbd));
>  		return -EIO;

This isn't correct, sorry.  Please do not make this change.

> @@ -1692,7 +1692,7 @@ static int nbd_dbg_init(void)
>  	struct dentry *dbg_dir;
>  
>  	dbg_dir = debugfs_create_dir("nbd", NULL);
> -	if (!dbg_dir)
> +	if (IS_ERR(dbg_dir))
>  		return -EIO;

Again, not corrct.

>  	nbd_dbg_dir = dbg_dir;
> diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
> index d5d7884cedd4..69e5a100b3cf 100644
> --- a/drivers/block/pktcdvd.c
> +++ b/drivers/block/pktcdvd.c
> @@ -451,7 +451,7 @@ static void pkt_debugfs_dev_new(struct pktcdvd_device *pd)
>  	if (!pkt_debugfs_root)
>  		return;
>  	pd->dfs_d_root = debugfs_create_dir(pd->name, pkt_debugfs_root);
> -	if (!pd->dfs_d_root)
> +	if (IS_ERR(pd->dfs_d_root))
>  		return;

Also not correct.

Why check the return value at all?  As this check has always been wrong,
why are you wanting to keep it?

Also, you never responded to our previous review comments, why not?  To
ignore people is not generally considered a good idea :(

greg k-h

