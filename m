Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B154E5166
	for <lists+nbd@lfdr.de>; Wed, 23 Mar 2022 12:39:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D63A6204F2; Wed, 23 Mar 2022 11:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 23 11:39:09 2022
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C0B63204C7
	for <lists-other-nbd@bendel.debian.org>; Wed, 23 Mar 2022 11:21:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.89 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zLixYn_ny4Fs for <lists-other-nbd@bendel.debian.org>;
	Wed, 23 Mar 2022 11:21:28 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-ej1-x632.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 6DCCE204DA
	for <nbd@other.debian.org>; Wed, 23 Mar 2022 11:21:27 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id o10so2188724ejd.1
        for <nbd@other.debian.org>; Wed, 23 Mar 2022 04:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q428jPB3LI7YHZ1TPk4eUv6mjfb7Ccik6IuwbzunlN8=;
        b=qk78RGmu57m+WoTO9wCDpvaz8ymit5RglIS5kWuFOL3VPbzAb56W2jFcujjmoJ/UGs
         3EMPCUm15+UV7uYDmswOYIvQIRmiOmXioXyrRkhAZgoLMXbJ+zsL9cKQLdgUtLWFtVkT
         Z3S+uVKDof7qiuUWrur20pLRxaVjPJzXAaT9Emz+jj9qoCBPt4uM9eUeb0J27HVnDGdm
         aPrDDx/gd+JHrEaI5SEKc48yhCncdM2nrlC5X/9w4AU/s8nHQ0fGcvwlLyX0/6ayhbNl
         T6vs+W+6SaJZP90z0JVLIAefcdVL2wcfO6TlH6LbtjOol8X4VugVItB/ReHWiQtK6JrY
         hVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q428jPB3LI7YHZ1TPk4eUv6mjfb7Ccik6IuwbzunlN8=;
        b=h2Pk1zAACFjjg6GgGcy5oJaXGb3wCeqXf67EF+kRZ7OiMWOrkU0jGruubTojri+7qe
         Z98hsGA6OpnVkIKhV83PihfpQKldZ/9nMDMxixfhUqk7puzw4ykReZM7pJQVfq33JctZ
         XYeZDq95WFb/jEKXfxDqYzh3u+29PfJb9N68DdpClFfFO74K36xKKMw5mjyTXMfc9jAy
         +JrolM9NbwDH6OHa/XF/pE9Jynnj55pJuoWZsi/YeoWSWZT0gmDpzq0bjG3j1uk0VOiz
         ivLL0ptgdgLV2IZYWTQx3SzNoZfr/Ys8H4k7ufofky6SDQhHyuu18euaYxOKFGBA0m6Z
         GQsw==
X-Gm-Message-State: AOAM530+G25GU8cSmLZbq5D0FmDZh2GRvq1yJP+WCJqATPIHfr/NnAmj
	YtoJPZN/dh/UE4iPWyGUPSxJdczaRfjNwTDP+gHa
X-Google-Smtp-Source: ABdhPJyeZxP1pcZPz6bj3JhcI1N6gvpSUjdNdladDO5oGiHAiqqYZoRaKWuZ9Ngs5Pq/FT2Q6BrtFvuDlEhpUxtD9Gs=
X-Received: by 2002:a17:907:6e09:b0:6e0:6bd1:ab5a with SMTP id
 sd9-20020a1709076e0900b006e06bd1ab5amr1173845ejc.622.1648034484978; Wed, 23
 Mar 2022 04:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211227091241.103-1-xieyongji@bytedance.com> <YjotekJZcSvwoZhp@localhost.localdomain>
In-Reply-To: <YjotekJZcSvwoZhp@localhost.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 23 Mar 2022 19:21:25 +0800
Message-ID: <CACycT3vz4hYTFpHo0Jphs-xE-k--y63+vedTFAaDRWhpi4_5rg@mail.gmail.com>
Subject: Re: [PATCH v2] nbd: Don't use workqueue to handle recv work
To: Josef Bacik <josef@toxicpanda.com>
Cc: Jens Axboe <axboe@kernel.dk>, Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org, 
	nbd@other.debian.org, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mJLm0ki0BjF.A.woG.dbwOiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1746
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACycT3vz4hYTFpHo0Jphs-xE-k--y63+vedTFAaDRWhpi4_5rg@mail.gmail.com
Resent-Date: Wed, 23 Mar 2022 11:39:09 +0000 (UTC)

On Wed, Mar 23, 2022 at 4:11 AM Josef Bacik <josef@toxicpanda.com> wrote:
>
> On Mon, Dec 27, 2021 at 05:12:41PM +0800, Xie Yongji wrote:
> > The rescuer thread might take over the works queued on
> > the workqueue when the worker thread creation timed out.
> > If this happens, we have no chance to create multiple
> > recv threads which causes I/O hung on this nbd device.
> >
> > To fix it, we can not simply remove the WQ_MEM_RECLAIM
> > flag since the recv work is in the memory reclaim path.
> > So this patch tries to create kthreads directly to
> > handle the recv work instead of using workqueue.
> >
>
> I still don't understand why we can't drop WQ_MEM_RECLAIM.  IIRC your argument
> is that we need it because a reconnect could happen under memory pressure and we
> need to be able to queue work for that.  However your code makes it so we're
> just doing a kthread_create(), which isn't coming out of some emergency pool, so
> it's just as likely to fail as a !WQ_MEM_RECLAIM workqueue.  Thanks,
>

I think the key point is the context in which the work thread is
created. It's the context of the nbd process if using kthread_create()
to create a workthread (might do some allocation). Then we can benefit
from the PR_SET_IO_FLUSHER flag, so memory reclaim would never hit the
page cache on the nbd device. But using queue_work() to create a
workthread, the actual thread creation happens in the context of the
work thread rather than the nbd process, so we can't rely on the
PR_SET_IO_FLUSHER flag to avoid deadlock.

Thanks,
Yongji

