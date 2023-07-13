Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE91752BDF
	for <lists+nbd@lfdr.de>; Thu, 13 Jul 2023 22:51:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2331C20B20; Thu, 13 Jul 2023 20:51:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jul 13 20:51:12 2023
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6887520ABE
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jul 2023 20:33:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zb5ts95Q4pqG for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jul 2023 20:33:32 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-oo1-xc2c.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 848F220A36
	for <nbd@other.debian.org>; Thu, 13 Jul 2023 20:33:29 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-56347da4a50so848474eaf.2
        for <nbd@other.debian.org>; Thu, 13 Jul 2023 13:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20221208.gappssmtp.com; s=20221208; t=1689280406; x=1691872406;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q4LBnvQYMGaYAXdu1AoVu2cAixaHPevENTPqDGX8zmE=;
        b=3qkvShK5M5ZZTm1rRRNP7fxG4P21ZOQ44gVVdW+FARcOqArr9OYc8E9QjvKIg7ad+b
         wnljlOhMhHjdwTmXnXV6cwI14JwQG6O+goxOETiH4Lslcr2CiuH/uwwjYmeu3/XE2Bjs
         uZQZR79Sf7nXNLgXcLXMh2KrdEjguSI2hY7N+Z58pMoMWLV2qVwkLkzy1oV1arx3C2m6
         1C/HlwoxiZrPCDUO3VKqts5vGocGOVKMFxFmfDP4DrhwgUDL0s5HKd+aI3g7uh3VKBCS
         RCNXv+cAXcBR5AuTaQOd7VOkjhYMLRzl6URr7RBaDOFk+bRo//BBJgDoP8FNqddt59mJ
         3Ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689280406; x=1691872406;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4LBnvQYMGaYAXdu1AoVu2cAixaHPevENTPqDGX8zmE=;
        b=Ayiz4Ol0qllAYwpOPNZ2EEFZgzPeMGett26EZxhHOEb0w99ItbeAAetE/uOb1isbJA
         BpbRdPxvNN9K2cnQ4K2iUc0WaJ4WjZlApOYTE1qDPb5I9xDY32d5X4IpSzfiJQD+Al3H
         Coe37AfyuWwhiFtNL/YiaQ5sA0T6d7CY7JBADILUfqPYkyPsagZXc1eAyiEXcCiy4R8x
         XixugpdKOWnzkxudiMq6yl66nBNG6fCLX8LKYgsFky/KLWGHrLeOUEGclBzhNFaJSpGR
         PHWvO0DeFc7CII33nf0yiAfhaxoH9FC5v5wvKPs8qhEm9Z1rq6Rge1Ovte5y27PHLvmF
         HOFw==
X-Gm-Message-State: ABy/qLat3My4t4z2O/BcSsEuWuV0xPkxVVMdPaA5XDlsdvEpGmpmbmCX
	3QqOnvr1SIdTiMuhOsj/mUSFrQ==
X-Google-Smtp-Source: APBJJlGG4VuVwM+4L4wB4MX/WwSs+GeQBUdteNFfVVbOzd4v6pIevqoKMkhL/4Q92QB03MJq/O9PRA==
X-Received: by 2002:a05:6358:7e43:b0:134:e59a:2ffe with SMTP id p3-20020a0563587e4300b00134e59a2ffemr2922810rwm.11.1689280405544;
        Thu, 13 Jul 2023 13:33:25 -0700 (PDT)
Received: from localhost (cpe-76-182-20-124.nc.res.rr.com. [76.182.20.124])
        by smtp.gmail.com with ESMTPSA id s126-20020a0dd084000000b0057a918d6644sm1923706ywd.128.2023.07.13.13.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 13:33:24 -0700 (PDT)
Date: Thu, 13 Jul 2023 16:33:24 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v3] nbd: automatically load module on genl access
Message-ID: <20230713203324.GA338010@perftesting>
References: <20230713-b4-nbd-genl-v3-1-226cbddba04b@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230713-b4-nbd-genl-v3-1-226cbddba04b@weissschuh.net>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jksgu0mBbWK.A.ZH.APGskB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2570
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230713203324.GA338010@perftesting
Resent-Date: Thu, 13 Jul 2023 20:51:12 +0000 (UTC)

On Thu, Jul 13, 2023 at 09:29:35PM +0200, Thomas Weiﬂschuh wrote:
> Add a module alias to nbd.ko that allows the generic netlink core to
> automatically load the module when netlink messages for nbd are
> received.
> 
> This frees the user from manually having to load the module before using
> nbd functionality via netlink.
> If the system policy allows it this can even be used to load the nbd
> module from containers which would otherwise not have access to the
> necessary module files to do a normal "modprobe nbd".
> 
> For example this avoids the following error when using nbd-client:
> 
> $ nbd-client localhost 10809 /dev/nbd0
> ...
> Error: Couldn't resolve the nbd netlink family, make sure the nbd module is loaded and your nbd driver supports the netlink interface.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Reviewed-by: Josef Bacik <josef@toxicpadna.com>

Thanks,

Josef

