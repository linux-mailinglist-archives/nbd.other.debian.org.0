Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 21632435996
	for <lists+nbd@lfdr.de>; Thu, 21 Oct 2021 05:57:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E254420326; Thu, 21 Oct 2021 03:57:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Oct 21 03:57:13 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 53A30202E9
	for <lists-other-nbd@bendel.debian.org>; Thu, 21 Oct 2021 03:41:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id NLbh6KWkFvvo for <lists-other-nbd@bendel.debian.org>;
	Thu, 21 Oct 2021 03:41:34 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-ed1-x52e.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 017EC20305
	for <nbd@other.debian.org>; Thu, 21 Oct 2021 03:41:33 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id y12so2236618eda.4
        for <nbd@other.debian.org>; Wed, 20 Oct 2021 20:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=McvdtKIiqbJKho9tX4x87O/fd2EXpjSgFzXvW6u0Imc=;
        b=DMtGEjuhV5m6n2YMBOXwrOkGqgqFrOZCW9dqXDwK9rwlr8fxcR//1xWg1sanyHoU0n
         rXgszI8g49Br9or2aGYe/BdvLdL/7bUNkIDBYSQ3vSAl3Rtf9X87npwugqj45YX3PKrB
         W6sRs5MSeFGvPY2SqcPveMSVWSTYmv3AS/Axx9M7fuS1YYbRAj7WbO2CJ/P0Ce4OSGMe
         x98vWiux0ToM7D+bq+fDOoc3qgfmIC/GJG+nr/I/SXGmId/MdX5MnGhYGmMbQLvNVbGF
         /iCKFVs+83YZB3+XH2Dj3Q3t93ld+Xhi9+VknhTEBMwwq426TBbj0ZZr8Wu7+U3tLaAg
         qoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=McvdtKIiqbJKho9tX4x87O/fd2EXpjSgFzXvW6u0Imc=;
        b=1MCtAlrI6gAOGHtp889nHbR0rNkN45t4Ey+VLEdFUwTdkKfn92eh1KVpnMlOa9DVZL
         wsGib12iDAt4sZdnCUoS3DpULObo8p3fmD60D/h6b+BQDwgIQ7d4Ht1Xg6uecQhn5QmQ
         Krv1lTh9GI5nJCPvF8H1dF6LrCpgXUg2Yeeg6FlZLYHx6RNm+/T/hadYNRGWfrLmANcr
         ZttgOxAGgjRpDrKypbmDDN0IeXxLoTbJjMzfN3WAZ2PdcVfR9ajgaMe+FaXdQAv0kL2r
         lWs++B7tYNEakBGHID5kxcLOEsOMhDiAqdKyHuqdO3eRaP4DCKKMnVGJgjvZUOTvO6V8
         gzxA==
X-Gm-Message-State: AOAM531d5iJFXvHdigaf7FOtM6a95vFdQskBJfY+AS5U0jdb6+ZJadjC
	sz42+aa28fWPK2m4IxIAGxl2ooshaOI8Q3t8NIwZ
X-Google-Smtp-Source: ABdhPJwwycD3BOlgLRwtbfdeQIFF8lCnZ3zK2U2WgdBwXKurxRrTdhXlcGLLGO9LX//giL1PYizPX0wbHcMe8ukay9s=
X-Received: by 2002:a05:6402:5113:: with SMTP id m19mr4241359edd.231.1634787689973;
 Wed, 20 Oct 2021 20:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210922123711.187-1-xieyongji@bytedance.com>
In-Reply-To: <20210922123711.187-1-xieyongji@bytedance.com>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Thu, 21 Oct 2021 11:41:19 +0800
Message-ID: <CACycT3u3gr2+4AZGbuTEmH1hDkQArCFLgJ38XzJR-dWXy3ddUw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Add invalidate_disk() helper for drivers to
 invalidate the gendisk
To: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@infradead.org>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
	yixingchen@bytedance.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EpXkRBjGhpF.A.UWH.ZUOchB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1549
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACycT3u3gr2+4AZGbuTEmH1hDkQArCFLgJ38XzJR-dWXy3ddUw@mail.gmail.com
Resent-Date: Thu, 21 Oct 2021 03:57:13 +0000 (UTC)

Ping

On Wed, Sep 22, 2021 at 8:37 PM Xie Yongji <xieyongji@bytedance.com> wrote:
>
> This series comes from Christoph Hellwig's suggestion [1]. Some block
> device drivers such as loop driver and nbd driver need to invalidate
> the gendisk when the backend is detached so that the gendisk can be
> reused by the new backend. Now the invalidation is done in device
> driver with their own ways. To avoid code duplication and hide
> some internals of the implementation, this series adds a block layer
> helper and makes both loop driver and nbd driver use it.
>
> [1] https://lore.kernel.org/all/YTmqJHd7YWAQ2lZ7@infradead.org/
>
> V1 to V2:
> - Rename invalidate_gendisk() to invalidate_disk()
> - Add a cleanup patch to remove bdev checks and bdev variable in __loop_clr_fd()
>
> Xie Yongji (4):
>   block: Add invalidate_disk() helper to invalidate the gendisk
>   loop: Use invalidate_disk() helper to invalidate gendisk
>   loop: Remove the unnecessary bdev checks and unused bdev variable
>   nbd: Use invalidate_disk() helper on disconnect
>
>  block/genhd.c         | 20 ++++++++++++++++++++
>  drivers/block/loop.c  | 15 ++++-----------
>  drivers/block/nbd.c   | 12 +++---------
>  include/linux/genhd.h |  2 ++
>  4 files changed, 29 insertions(+), 20 deletions(-)
>
> --
> 2.11.0
>

