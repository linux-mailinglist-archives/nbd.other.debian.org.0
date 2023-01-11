Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5807A666153
	for <lists+nbd@lfdr.de>; Wed, 11 Jan 2023 18:03:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2421120544; Wed, 11 Jan 2023 17:03:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan 11 17:03:12 2023
Old-Return-Path: <linux@weissschuh.net>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,
	WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B534D204C6
	for <lists-other-nbd@bendel.debian.org>; Wed, 11 Jan 2023 16:46:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QjzCJUuD7ASb for <lists-other-nbd@bendel.debian.org>;
	Wed, 11 Jan 2023 16:46:20 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 322 seconds by postgrey-1.36 at bendel; Wed, 11 Jan 2023 16:46:20 UTC
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3AB96204F3
	for <nbd@other.debian.org>; Wed, 11 Jan 2023 16:46:19 +0000 (UTC)
Date: Wed, 11 Jan 2023 16:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1673455230;
	bh=1CxCJtXN8jkj7d+XLUeTWv6kMDXKx4rzhz2v14YhVsY=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=RCEp35517cFDBBOE5Zgf53o0SXJ0BZvRVtjWgqTUaQLRipyhPS6dxBQppB26A/vBI
	 77CgE5iEZf4TwJUAEsqeuISJpH/8kvU58kVeF3IMfZrBn8PiBPCBY4ODi7nPOIC8+0
	 jx+ZFbtuRNSwW54W3fuWFKVyWzH/MRBmtRvBc5gw=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nbd: automatically load module on genl access
Message-ID: <20230111164027.7oqg6zmkcpfitb3l@t-8ch.de>
References: <20221110052438.2188-1-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221110052438.2188-1-linux@weissschuh.net>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <clAgNO8YMvM.A.nfC.QvuvjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2318
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230111164027.7oqg6zmkcpfitb3l@t-8ch.de
Resent-Date: Wed, 11 Jan 2023 17:03:12 +0000 (UTC)

Hi,

On Thu, Nov 10, 2022 at 06:24:38AM +0100, Thomas Weiﬂschuh wrote:
> Instead of forcing the user to manually load the module do it
> automatically.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
>  drivers/block/nbd.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 5cffd96ef2d7..1c38a7ea9531 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -2328,6 +2328,7 @@ static struct genl_family nbd_genl_family __ro_after_init = {
>  	.mcgrps		= nbd_mcast_grps,
>  	.n_mcgrps	= ARRAY_SIZE(nbd_mcast_grps),
>  };
> +MODULE_ALIAS_GENL_FAMILY(NBD_GENL_FAMILY_NAME);
>  
>  static int populate_nbd_status(struct nbd_device *nbd, struct sk_buff *reply)
>  {
> 
> base-commit: f67dd6ce0723ad013395f20a3f79d8a437d3f455
> -- 
> 2.38.1
> 

Any feedback on the patch?

Thanks,
Thomas

