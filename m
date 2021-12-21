Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1559D47B91A
	for <lists+nbd@lfdr.de>; Tue, 21 Dec 2021 04:57:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A0E2A2033E; Tue, 21 Dec 2021 03:57:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Dec 21 03:57:10 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E08962033C
	for <lists-other-nbd@bendel.debian.org>; Tue, 21 Dec 2021 03:39:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id B523Z27ikXRt for <lists-other-nbd@bendel.debian.org>;
	Tue, 21 Dec 2021 03:39:37 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-ed1-x52b.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BA6052033A
	for <nbd@other.debian.org>; Tue, 21 Dec 2021 03:39:36 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id w16so18089700edc.11
        for <nbd@other.debian.org>; Mon, 20 Dec 2021 19:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HhnT9iNZb45m+Yl6mmQXF6P5epcMOvtSvPcLxLPj1Hk=;
        b=OTtRQUfhK6ogaf3OkEckf0AdFVHviCmA+iuNxTtJWMhIu2fWrZTI9qwtfjDf28mLHY
         gcYrWGWoXgnOhvwnvbtxuoInQmGgEIwOp45lwB8uiSGMIbrVExVtwfxeT0VYuv3C1Szf
         q8QKzfD9ewNC6xax+cp6ToRES9Se77yLt/m9Jmanl4ulaYqhnjDyNhGKlPcAv5WE41sR
         8bF0soaUCI0CoLbQBSYbzLe8reUJtmRc+pEKcdztC44tc7hmAanE0yO7hcqKVhjSH8aI
         79PhW1m4DK+9jvmEPA3mIUZ5QF/yTGpni2YHVkDM9F/X3G/rNWjgQTavKJtoa1hygxvP
         USPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HhnT9iNZb45m+Yl6mmQXF6P5epcMOvtSvPcLxLPj1Hk=;
        b=IM/f08xf2NmkweqYCij/PK6lhhFinw77ByZAOf+8K0XJbOs6nfecz+kfIe45JVTInX
         NGhfNy7wCl3vO7O2F9dYLtN0yHMkoGHbK/JlvWg2ewifEyybUOxy0ReHeg2kcEU55Bg1
         fmf10HPtpW4w3cw8TpYRi4zc3cXjt0F5zjn/6GMkbjVms7bmVRdgHywbxxyyzWktsrJl
         HplDYq/OkGnqscyWprKBg2DMSAzFfBAdhRP4iEbb2q0DXtu96ny03EXE1Tk9Q7Uki73F
         b9A653xFxH4FMIY9YV3KDneIJr/xW88humy/q4uoeliKnm0W6HWAxYBFklubkmt9i8VY
         MpMg==
X-Gm-Message-State: AOAM530KzztczZGXT74wz6NeSZYICyxJtR+tWDlreIDnC+Auh8yImglT
	0SIwtz3NDSYdAR41hZ1dizYGvAEPur94gQeJqU6t
X-Google-Smtp-Source: ABdhPJwAGTC0km/cbwkFPRUxwBn/XhPvg5GSgJxcHMqmSVAPC3iT1QyAHbSC+PLi61u4PtVo0FVoBVQzBNBelmY5xNA=
X-Received: by 2002:a17:907:2da6:: with SMTP id gt38mr1076078ejc.536.1640057973687;
 Mon, 20 Dec 2021 19:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20211220122241.150-1-xieyongji@bytedance.com> <a4ba2441-83eb-dde2-09ae-7c5f42ff6ad3@acm.org>
In-Reply-To: <a4ba2441-83eb-dde2-09ae-7c5f42ff6ad3@acm.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 21 Dec 2021 11:39:22 +0800
Message-ID: <CACycT3t-UzaLOFSTmYyKniHYPK8jH9SevgB+1xrnCTc_4JKXQw@mail.gmail.com>
Subject: Re: [PATCH] nbd: Don't use workqueue to handle recv work
To: Bart Van Assche <bvanassche@acm.org>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	nbd@other.debian.org, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7RFmxhlznYD.A.bwB.WCVwhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1662
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACycT3t-UzaLOFSTmYyKniHYPK8jH9SevgB+1xrnCTc_4JKXQw@mail.gmail.com
Resent-Date: Tue, 21 Dec 2021 03:57:10 +0000 (UTC)

On Tue, Dec 21, 2021 at 1:10 AM Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 12/20/21 04:22, Xie Yongji wrote:
> > The rescuer thread might take over the works queued on
> > the workqueue when the worker thread creation timed out.
> > If this happens, we have no chance to create multiple
> > recv threads which causes I/O hung on this nbd device.
> >
> > To fix it, this tries to create kthreads directly to
> > handle the recv work instead of using workqueue.
>
> Why a kthread instead of only removing the WQ_MEM_RECLAIM flag from the

I think we can not simply remove the WQ_MEM_RECLAIM flag because the
recv work is in the memory reclaim path.

> alloc_workqueue() call? This should have been explained in the patch
> description. Additionally, a Fixes: tag is missing.
>

OK, will do it in v2.

Thanks,
Yongji

