Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCA6408CEF
	for <lists+nbd@lfdr.de>; Mon, 13 Sep 2021 15:21:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 65C62203DF; Mon, 13 Sep 2021 13:21:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 13 13:21:21 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 65CCC203BB
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Sep 2021 13:04:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id RiPhD2blsiGL for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Sep 2021 13:04:28 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-ed1-x533.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 663AF2016F
	for <nbd@other.debian.org>; Mon, 13 Sep 2021 13:04:26 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id c22so12862097edn.12
        for <nbd@other.debian.org>; Mon, 13 Sep 2021 06:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RdZIbAXToH2hKnMoOgcNJetW3sB4TakM6/Gu+YymAek=;
        b=izZyz2feW7dGhCXYTMMF4aZ3jsrOSm9wZoPL4GYBVpH0iqzNDTBI6QonCQndXTo8B1
         G6nQMUCTup9+QxJDfo+X/ouparDGBcwr1VLaVWNd7+K7XDdDZZIeOlPzGhiy2h6q4nay
         /I2jEbXQI9NT6c+FEo/4LGSAo4eWPCsg4fsOGkysVqBC94KGXhC0gAY98vKhZK64WJj7
         knrN7UwBw6uAwRfnZZ/MpvhKy5R414BYs7DubqVHLTsHatfn/Cm2mWC2b6qR5loTAPnM
         G63mNfTzu9Wfj+fUzIDrV3IaiWKevCQ3NY/zC77sld87++CljjvKFoScqUwOgCOtszgm
         FWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RdZIbAXToH2hKnMoOgcNJetW3sB4TakM6/Gu+YymAek=;
        b=Lu+wdIg4wsDcNWLlF5IR5gUAYsH0mBB7UmBfcZPUeosjWKq9bZQx8jnuXYPqa/gcEH
         xJ+mtCD3+vnm2TZnz5prOykS5MrM0o8R+lQV6Mjk2n3998c8RhXrGp6SY+K7oaQxNBjC
         19a+rHIVbkRw+sPLppwphDiE93uzMBqKixjlleO/3uhQzQplljBAkQ/qIXfLoWmyI6dF
         Qeno+aYEzhkQ/ox4ptWCcLF8xL2BHtJUfqvA7KVyiVtN4ZfvxjBcKVDhLv4zroAietYS
         gQg4xJwoZlQ4bm1qOO5INu/ZDHK7RdTaEhFQK2ojbdm+caLcArtLV/H1mEgy7TFO/FgB
         iVDQ==
X-Gm-Message-State: AOAM532OBhRuOyzBt1tTG5mdOnAvU+q80Ns9QQ8bve0Od+9nyYITMTRy
	VMnzNPSkSzKJ5RuPUCtNewMMKsr5iS1usLNHxWwA
X-Google-Smtp-Source: ABdhPJxOPGkgUMqV406W6cTQRA3871Dh3U5yHZzeFHo/tYTiO+Qb4cIm7gKZb5H41heGhAFw+wvjdi8+TobrjHA2l2g=
X-Received: by 2002:a05:6402:2048:: with SMTP id bc8mr13154783edb.114.1631538264046;
 Mon, 13 Sep 2021 06:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210913112557.191-1-xieyongji@bytedance.com> <20210913112557.191-4-xieyongji@bytedance.com>
 <YT9HFOTnBFWMUE74@infradead.org>
In-Reply-To: <YT9HFOTnBFWMUE74@infradead.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Mon, 13 Sep 2021 21:04:12 +0800
Message-ID: <CACycT3uo6GqLx8i=rtn9P2kaSGHjnNnamX3KR0Xgq_5QEhWWUA@mail.gmail.com>
Subject: Re: [PATCH 3/3] nbd: Use invalidate_gendisk() helper on disconnect
To: Christoph Hellwig <hch@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org, 
	nbd@other.debian.org, yixingchen@bytedance.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ylRLY33aOrC.A.yLH.RB1PhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1441
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACycT3uo6GqLx8i=rtn9P2kaSGHjnNnamX3KR0Xgq_5QEhWWUA@mail.gmail.com
Resent-Date: Mon, 13 Sep 2021 13:21:21 +0000 (UTC)

On Mon, Sep 13, 2021 at 8:43 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Sep 13, 2021 at 07:25:57PM +0800, Xie Yongji wrote:
> > +             invalidate_gendisk(nbd->disk);
> > +             if (nbd->config->bytesize)
> > +                     kobject_uevent(&nbd_to_dev(nbd)->kobj, KOBJ_CHANGE);
>
> I wonder if the invalidate helper should just use
> set_capacity_and_notify to take care of the notification in the proper
> way.  This adds an uevent to loop, and adds the RESIZE=1 argument to
> nbd, but it feels like the right thing to do.

Looks like set_capacity_and_notify() would not do notification if we
set capacity to zero. How about calling kobject_uevent() directly in
the helper?

Thanks,
Yongji

