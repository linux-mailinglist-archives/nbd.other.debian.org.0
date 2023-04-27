Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 343C76F00C0
	for <lists+nbd@lfdr.de>; Thu, 27 Apr 2023 08:27:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DD393207C9; Thu, 27 Apr 2023 06:27:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr 27 06:27:14 2023
Old-Return-Path: <linux@weissschuh.net>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,
	T_SCC_BODY_TEXT_LINE,WORD_WITHOUT_VOWELS autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9D32020741
	for <lists-other-nbd@bendel.debian.org>; Thu, 27 Apr 2023 06:12:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id paf1yn7I7BCc for <lists-other-nbd@bendel.debian.org>;
	Thu, 27 Apr 2023 06:11:53 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 435 seconds by postgrey-1.36 at bendel; Thu, 27 Apr 2023 06:11:53 UTC
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E3990206C4
	for <nbd@other.debian.org>; Thu, 27 Apr 2023 06:11:53 +0000 (UTC)
Date: Thu, 27 Apr 2023 08:04:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1682575474;
	bh=cyecpHnIeBWNjwg8xQ+JBS0N+v6dd3dFUm88xA+Uels=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=txX6NVbXb1wjkUb6eKuiG5cTqi+P8kEbA+NQRE/yk+lsmkCTBKMEjaq0PdLiFd8d1
	 YHz8dWYeKyT6jiarWAwjsymdjI/UoCvie5kG7+Yu+YwnTp4pbgHowqGPx60T4NIhrk
	 pXAnbqRrp+wIue2easFng2qDBnwVzWRoUXbgmnos=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	linux-block@vger.kernel.org, nbd@other.debian.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nbd: automatically load module on genl access
Message-ID: <a71f01e8-8724-4c21-95b4-3a6be9f9dceb@t-8ch.de>
References: <20221110052438.2188-1-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221110052438.2188-1-linux@weissschuh.net>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <z4UmAO_4eYJ.A.8bE.CXhSkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2455
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/a71f01e8-8724-4c21-95b4-3a6be9f9dceb@t-8ch.de
Resent-Date: Thu, 27 Apr 2023 06:27:14 +0000 (UTC)

Hi Josef,

could you take a look at this?

... ping

Thanks,
Thomas

On 2022-11-10 06:24:38+0100, Thomas Weißschuh wrote:
> Instead of forcing the user to manually load the module do it
> automatically.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
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

