Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F071059C2
	for <lists+nbd@lfdr.de>; Thu, 21 Nov 2019 19:42:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7CE5220488; Thu, 21 Nov 2019 18:42:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Nov 21 18:42:08 2019
Old-Return-Path: <navid.emamdoost@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FREEMAIL_FROM,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5A15620053
	for <lists-other-nbd@bendel.debian.org>; Thu, 21 Nov 2019 18:24:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Nccm-Co7JvAK for <lists-other-nbd@bendel.debian.org>;
	Thu, 21 Nov 2019 18:24:51 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 6F2E220468
	for <nbd@other.debian.org>; Thu, 21 Nov 2019 18:24:48 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id d22so4089539oic.7
        for <nbd@other.debian.org>; Thu, 21 Nov 2019 10:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6zhjCoXgb9L0IfgOzfxkxb6svBzYxjsHedjQIL5V7AY=;
        b=vRVFXkwJj2wwrePfM//SIRa3vMl9/Svx4A8nToAPGFIOEQqS8kSLAeYBZ/jWYg3h0R
         uqBgSuMfgk3qkOXzf2eCok8/gEivfrh7SYs36a7D08Oe1lOAdjrBXlLX5iOPbl24E/OD
         P12T3tZ4eum2QF5HLfPvhXqa6d9zdK09hmTj1uEhpcCGgwP9MO60HFEgW7FyJF+pvr75
         xevi0HaxcCccm4L87QqGSQdew0wI32K/kFU3nKPOVTJdMWhEENClQ/jeGBFED/8jb56M
         Y5XvnsmQQEp0kFcHKBD19YeoxMnKBxnN2N3gHEX2UNqdQZlaSoj40zGkt7FEslCwLUVn
         60dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6zhjCoXgb9L0IfgOzfxkxb6svBzYxjsHedjQIL5V7AY=;
        b=RDPqmbuKpir5ogxuecOaAhdZf96/MBh2ExAxkrkhaXP/gd7H2qKn79yZ7Pqhxn5KNP
         ejDzuuMn585QOomEm0nQ3YGEfIS2AQ5MAD4L49PvdklhsAErGGyfQd/wuo8v1vNgC9yI
         C5zLNZQIu7U0hy4ybMEKqRDNs6cJZd1FTLcz7DZ0kFSvBXMn06F93duJ7JdRBz/5dr8U
         mff1s2/aNtQR517wHpptSdbIX6JMzq3tEgQMFIamsUsGORYyuw8rlWtL7VhxhvtRX0Sj
         hfuAr9NZFuxhzDuCnzK3xK/0wBITLReB7+d6NRBsZNebF+f6yoYRQeWBA//jbuyf4F6t
         OpGw==
X-Gm-Message-State: APjAAAXDk3C2oDlfoHPGrzVnTDtCTSqufNNnSmYOHIDbs6M2xu0Jpz8b
	1LxgKYxcBvGkcDEG5N7+bcbKb6gt/y8DunWoF0o=
X-Google-Smtp-Source: APXvYqxa/ZxQuochzrKgMGSY6JqWP630ru10OjqlUUiFm+DEODIVeReXmbNUrOXc/d/hSXK1FQhJwu1sTMV28oPTEKw=
X-Received: by 2002:aca:c50f:: with SMTP id v15mr9239163oif.5.1574360685022;
 Thu, 21 Nov 2019 10:24:45 -0800 (PST)
MIME-Version: 1.0
References: <20190923200959.29643-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190923200959.29643-1-navid.emamdoost@gmail.com>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Thu, 21 Nov 2019 12:24:34 -0600
Message-ID: <CAEkB2ERDAtBqWP12VrPb285ypMnQ8svExg2MZ3sBP6Q8B_006g@mail.gmail.com>
Subject: Re: [PATCH] nbd: prevent memory leak
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	nbd@other.debian.org
Cc: Navid Emamdoost <emamd001@umn.edu>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <PT8LuV97tJF.A.TWE.Aqt1dB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/745
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAEkB2ERDAtBqWP12VrPb285ypMnQ8svExg2MZ3sBP6Q8B_006g@mail.gmail.com
Resent-Date: Thu, 21 Nov 2019 18:42:08 +0000 (UTC)

On Mon, Sep 23, 2019 at 3:10 PM Navid Emamdoost
<navid.emamdoost@gmail.com> wrote:
>
> In nbd_add_socket when krealloc succeeds, if nsock's allocation fail the
> reallocted memory is leak. The correct behaviour should be assigning the
> reallocted memory to config->socks right after success.
>
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---

Would you please review this patch?

Thanks,

>  drivers/block/nbd.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index a8e3815295fe..8ae3bd2e7b30 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -987,14 +987,15 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
>                 sockfd_put(sock);
>                 return -ENOMEM;
>         }
> +
> +       config->socks = socks;
> +
>         nsock = kzalloc(sizeof(struct nbd_sock), GFP_KERNEL);
>         if (!nsock) {
>                 sockfd_put(sock);
>                 return -ENOMEM;
>         }
>
> -       config->socks = socks;
> -
>         nsock->fallback_index = -1;
>         nsock->dead = false;
>         mutex_init(&nsock->tx_lock);
> --
> 2.17.1
>


-- 
Navid.

