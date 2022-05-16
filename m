Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D44527D9B
	for <lists+nbd@lfdr.de>; Mon, 16 May 2022 08:30:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A50E72031B; Mon, 16 May 2022 06:30:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 16 06:30:09 2022
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E658B202C0
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 May 2022 06:13:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.89 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zAvRlQ-qxvqX for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 May 2022 06:13:09 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-ej1-x636.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B21D0202BA
	for <nbd@other.debian.org>; Mon, 16 May 2022 06:13:09 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id i19so26527142eja.11
        for <nbd@other.debian.org>; Sun, 15 May 2022 23:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UMivNP1yATOqWiy4xAV1dIXzJMIjL6HYMoQwwXh9g8U=;
        b=U9k6OUws21OayeSqTQt3GmsNurJtExmOYfgxajIaoyI7I2td2Yq9miYkQhG8IEwl5/
         uPFve13ZyNG/Nej7aDhOlaTCbpoPm2NysOSkOXHB3C/y1d90TwZFSGsfNsvoQ1/T6SHa
         VCl7AFEAVUNFiXJcJxF2AzwSORetVgCErxNN9jbVM/z8Zy15uLTO0l2gFcTPfbpAPD1j
         ftj3u8hnX7+Z73WN3VhdroO/P/EJO0w4FPwbH8wTM4QoVQzu2C2xML4qcBuTn9cHAweD
         Lf2zS/7jBL06rclsoc+G+JBIx0SdEiS/0d+iZ+bFSx6EEbdryBxn7OaTrKnRoD2obMlv
         DIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UMivNP1yATOqWiy4xAV1dIXzJMIjL6HYMoQwwXh9g8U=;
        b=qDdKDg6xFCuN75OScJlMPFTmNCX9wzwOkuOYDiGdJmdX+/x4rLtTMUGSoIU26EbQBs
         y1vh1WTnCJl8rhsmTAG0iHqpnYBjxVQh5AS/PBEHpHWhK23L5rQqR8J0D5u2uoVRjNnc
         6vYIS4pUQXGIfXfr/8fx1sSGlrD8KiHU0A44beVWZZoF2Cn5Lt5OHKiTWMq+zehLlYN9
         uFc/IgFxLs5BBNhXPP5udD5otBhkNnlNvuG305xv2ZdyO/Hn6XPmXCTowGO7YzFvPnC8
         Ta/cRrfNa/P1LEm+LfEB9+R/0WOuoUFEhAIUGXpLF578GizJ1eAc0knYEvATm5drCTyS
         sPiQ==
X-Gm-Message-State: AOAM530L1eOe7lVnq5F5JOzz0ENdOXHrGmmzyq4lwaatYPU9fKWRXD2Z
	jl/kiWkvMeEC6rt4qVDenDv5ZPrpy9nvYgf3N2Js
X-Google-Smtp-Source: ABdhPJxwQU9n4T2vbv6zUUJLoz7qvcHSvdfpZ0OoVoSPI1Lmi3TIaOffSlIgVbg0SF0TtcFdY6c/pr0IlFrm5oX11lo=
X-Received: by 2002:a17:906:dc8f:b0:6f4:e6df:a48d with SMTP id
 cs15-20020a170906dc8f00b006f4e6dfa48dmr14195693ejc.206.1652681587130; Sun, 15
 May 2022 23:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211227091241.103-1-xieyongji@bytedance.com> <YjotekJZcSvwoZhp@localhost.localdomain>
 <CACycT3vz4hYTFpHo0Jphs-xE-k--y63+vedTFAaDRWhpi4_5rg@mail.gmail.com>
In-Reply-To: <CACycT3vz4hYTFpHo0Jphs-xE-k--y63+vedTFAaDRWhpi4_5rg@mail.gmail.com>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Mon, 16 May 2022 14:13:48 +0800
Message-ID: <CACycT3vExVBrmE3JN=Bay7sqX=C+wXo5imswLJv_pODbyFFSMA@mail.gmail.com>
Subject: Re: [PATCH v2] nbd: Don't use workqueue to handle recv work
To: Josef Bacik <josef@toxicpanda.com>
Cc: Jens Axboe <axboe@kernel.dk>, Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org, 
	nbd@other.debian.org, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LhI5lRHxi1H.A.PdD.x9egiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2072
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACycT3vExVBrmE3JN=Bay7sqX=C+wXo5imswLJv_pODbyFFSMA@mail.gmail.com
Resent-Date: Mon, 16 May 2022 06:30:09 +0000 (UTC)

Ping.

On Wed, Mar 23, 2022 at 7:21 PM Yongji Xie <xieyongji@bytedance.com> wrote:
>
> On Wed, Mar 23, 2022 at 4:11 AM Josef Bacik <josef@toxicpanda.com> wrote:
> >
> > On Mon, Dec 27, 2021 at 05:12:41PM +0800, Xie Yongji wrote:
> > > The rescuer thread might take over the works queued on
> > > the workqueue when the worker thread creation timed out.
> > > If this happens, we have no chance to create multiple
> > > recv threads which causes I/O hung on this nbd device.
> > >
> > > To fix it, we can not simply remove the WQ_MEM_RECLAIM
> > > flag since the recv work is in the memory reclaim path.
> > > So this patch tries to create kthreads directly to
> > > handle the recv work instead of using workqueue.
> > >
> >
> > I still don't understand why we can't drop WQ_MEM_RECLAIM.  IIRC your argument
> > is that we need it because a reconnect could happen under memory pressure and we
> > need to be able to queue work for that.  However your code makes it so we're
> > just doing a kthread_create(), which isn't coming out of some emergency pool, so
> > it's just as likely to fail as a !WQ_MEM_RECLAIM workqueue.  Thanks,
> >
>
> I think the key point is the context in which the work thread is
> created. It's the context of the nbd process if using kthread_create()
> to create a workthread (might do some allocation). Then we can benefit
> from the PR_SET_IO_FLUSHER flag, so memory reclaim would never hit the
> page cache on the nbd device. But using queue_work() to create a
> workthread, the actual thread creation happens in the context of the
> work thread rather than the nbd process, so we can't rely on the
> PR_SET_IO_FLUSHER flag to avoid deadlock.
>
> Thanks,
> Yongji

