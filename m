Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E381F1F8AE8
	for <lists+nbd@lfdr.de>; Sun, 14 Jun 2020 23:39:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A81FB2033C; Sun, 14 Jun 2020 21:39:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jun 14 21:39:08 2020
Old-Return-Path: <mrkiko.rs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8284A2037A
	for <lists-other-nbd@bendel.debian.org>; Sun, 14 Jun 2020 21:22:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	MALFORMED_FREEMAIL=1.299, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mlKvXfi_AsJh for <lists-other-nbd@bendel.debian.org>;
	Sun, 14 Jun 2020 21:22:13 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 60FD720373
	for <nbd@other.debian.org>; Sun, 14 Jun 2020 21:22:10 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id l11so15094337wru.0
        for <nbd@other.debian.org>; Sun, 14 Jun 2020 14:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version;
        bh=vkKaGrZd8/FWch8LM+2Yi5Cp+VSHjNvxCe4v1yqHnQY=;
        b=Y66PACa0xEeXR0p0k+Sj1QGaaFQLBVtEYthGu0Y5lda8kfq7ElNI6rjrIIERYFu4sI
         AW157A/Nh0x0doDXjCxMDyUyxeAqMjaW0WclD53NJSRdtnLLKlu9zklXtJntPX2AGGU6
         3DoXRJekJSLkzw9gsfvICPgiQV01yVxGE/Xiclifqa6kSW3yeXJgImeMvJR7IKR18Tht
         tW0m0Txu0mehV/yBE+NoAChRsHWnhzty3ZXGyFukMtLzdmr0Baj7il6pSFmGiV5wYidg
         +4WTYq4zCBLB+5zq+fw4L3n35LYOYXmo1MzFHUFWN89a+SUW1KjMoliim0NTsERB5NVW
         yjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version;
        bh=vkKaGrZd8/FWch8LM+2Yi5Cp+VSHjNvxCe4v1yqHnQY=;
        b=R02RuOph2nxDXPRkmfjPzNFOI+Zejps71wdSNTKheRkWlRrrfH0kvtt4dZIwOMbdC5
         wzn0zLp4qC9GVGzGXpAlN7zTP3DVaIP+syv6iUemTl9Yhcq6BgQFuvG2N++vRydt7BNp
         d93mZ9e6jJTkf4+2Pw5fMC4pQA8xDndVCNbiQNY4xn4GaG/dx9dqRl4Pt8SF5R07VQpa
         3VYfYVURgJzqxHhgmcKMflssOurpsCBWP6yqm7eYNBO4kDDhN9ppxuqSucuTbtCwvppp
         t8XOKqWASyuDyF4LSheI0tOK5J2Lu2M012lCftG7Z4EwOSgOEeKcgwFeq9Tzn2VqWyAP
         3TUQ==
X-Gm-Message-State: AOAM530PnVVEhEI3Dkun23GViEWaSNgymv3oXT1S+fGYyZilCdGCgZ3S
	3lHRqDVX4nXynpyt14f3f0NHqVmm
X-Google-Smtp-Source: ABdhPJyQaolGotz9SXOSrwPJuuV6YLtgC6hDN7YYMZZXZ0TlkewiobyFI4AKTz8EmXRuLWtrG0UN/g==
X-Received: by 2002:adf:ecc2:: with SMTP id s2mr28049023wro.60.1592169727858;
        Sun, 14 Jun 2020 14:22:07 -0700 (PDT)
Received: from mStation (host-79-51-202-241.retail.telecomitalia.it. [79.51.202.241])
        by smtp.gmail.com with ESMTPSA id o82sm20290844wmo.40.2020.06.14.14.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 14:22:07 -0700 (PDT)
Date: Sun, 14 Jun 2020 23:22:03 +0200 (CEST)
From: Enrico Mioso <mrkiko.rs@gmail.com>
X-X-Sender: mrkiko@mStation.localdomain
To: nbd@other.debian.org
cc: linux-block@vger.kernel.org, axboe@kernel.dk, josef@toxicpanda.com
Subject: nbd leeaves threads around even when unloaded (5.4.46)
Message-ID: <alpine.LNX.2.22.419.2006142249410.14412@mStation.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nftnFCZ0ngH.A.rR.8jp5eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/900
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/alpine.LNX.2.22.419.2006142249410.14412@mStation.localdomain
Resent-Date: Sun, 14 Jun 2020 21:39:08 +0000 (UTC)

Hello!
I don't know if this is an issue - still... I used nbd via qemu-nbd, and all worked fine.
Now, I unloaded the driver after finishing. But still I can see around a kernel thread:

$ ps ax
     988 ?        I<     0:02 [kworker/u17:0-knbd0-recv]

$ lsmod |grep -i nbd

Is this an issue?

Thanks for the great work!

Enrico

