Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF803891F5
	for <lists+nbd@lfdr.de>; Wed, 19 May 2021 16:51:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7E3AE20BD7; Wed, 19 May 2021 14:51:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 19 14:51:09 2021
Old-Return-Path: <mcroce@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 03A8F20BBB
	for <lists-other-nbd@bendel.debian.org>; Wed, 19 May 2021 14:34:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, USER_IN_DEF_DKIM_WL=-7.5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aj2NvnJyfsVF for <lists-other-nbd@bendel.debian.org>;
	Wed, 19 May 2021 14:34:03 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by bendel.debian.org (Postfix) with ESMTP id 18E7620B68
	for <nbd@other.debian.org>; Wed, 19 May 2021 14:33:59 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	by linux.microsoft.com (Postfix) with ESMTPSA id CB87420B7178
	for <nbd@other.debian.org>; Wed, 19 May 2021 07:33:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CB87420B7178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1621434836;
	bh=2l115mN3zp/dArufLuzm7XoNobdsZKeT527UpaHVKJg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fHKdSAd+bIMDIFjv1VQkygdXDbeaC76BtcOvxnUrwzT9tEtt8qayiqhuCexkqQGOK
	 vSAeVfPQl2TAKTE5yuSQ6xYUIwPThjO8oTXU/LXOxBqCjTfPdYvqTKkbW6eqrsmzVV
	 UOQ/VStej2fWyctME1BSAc/c+X5oiKJC/CTgFDTs=
Received: by mail-pf1-f174.google.com with SMTP id b13so6283550pfv.4
        for <nbd@other.debian.org>; Wed, 19 May 2021 07:33:56 -0700 (PDT)
X-Gm-Message-State: AOAM530E4z/Lvl5AROJ80d9T4X7nLmhwXtVHGIIdKXLMw5niCvjvQPA9
	C/h3bgkowE6CW7jvRXObez5p9M+YBeMgK8BBcGI=
X-Google-Smtp-Source: ABdhPJwENqC/Vi2InCMUSwZFz7uN+2ZeNWRSv6GNRL1ERm50moa1CDtwEjLOFYa7WuWjPgCs0eOGDc8adawq3hV/S50=
X-Received: by 2002:aa7:9f5c:0:b029:2de:a5f0:d73b with SMTP id
 h28-20020aa79f5c0000b02902dea5f0d73bmr7960822pfr.41.1621434836421; Wed, 19
 May 2021 07:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210429102828.31248-1-prasanna.kalever@redhat.com>
 <YKMKdHPFCNhR1SXx@T590> <CANwsLLH0HyZ-VGPMc+VmuLivG1fiZHnSqUyLx3UWb76ZMCgYSg@mail.gmail.com>
In-Reply-To: <CANwsLLH0HyZ-VGPMc+VmuLivG1fiZHnSqUyLx3UWb76ZMCgYSg@mail.gmail.com>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Wed, 19 May 2021 16:33:19 +0200
X-Gmail-Original-Message-ID: <CAFnufp3ZzrKHiV1Vy9_bAymy0oEr288dL4yWo4EjqUzhJV6J-A@mail.gmail.com>
Message-ID: <CAFnufp3ZzrKHiV1Vy9_bAymy0oEr288dL4yWo4EjqUzhJV6J-A@mail.gmail.com>
Subject: Re: [PATCH] nbd: provide a way for userspace processes to identify
 device backends
To: Prasanna Kalever <pkalever@redhat.com>
Cc: Ming Lei <ming.lei@redhat.com>, 
	Prasanna Kumar Kalever <prasanna.kalever@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, nbd@other.debian.org, 
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	Ilya Dryomov <idryomov@redhat.com>, Xiubo Li <xiubli@redhat.com>, 
	Lennart Poettering <lennart@poettering.net>, Luca Boccassi <bluca@debian.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <IO7a9J0tOC.A._GE.dXSpgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1166
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAFnufp3ZzrKHiV1Vy9_bAymy0oEr288dL4yWo4EjqUzhJV6J-A@mail.gmail.com
Resent-Date: Wed, 19 May 2021 14:51:09 +0000 (UTC)

On Tue, May 18, 2021 at 9:52 AM Prasanna Kalever <pkalever@redhat.com> wrote:
> > BTW, loop has similar issue, and patch of 'block: add a sequence number to disks'
> > is added for addressing this issue, what do you think of that generic
> > approach wrt. this nbd's issue? such as used the exposed sysfs sequence number
> > for addressing this issue?
> >
> > https://lore.kernel.org/linux-block/YH81n34d2G3C4Re+@gardel-login/#r
>
> If I understand the changes and the background of the fix correctly, I
> think with that fix author is trying to monotonically increase the seq
> number and add it to the disk on every single device map/attach and
> expose it through the sysfs, which will help the userspace processes
> further to correlate events for particular and specific devices that
> reuse the same loop device.
>

Yes, but nothing prevents to use diskseq in nbd, and increase it on reconfigure.
That would allow to detect if the device has been reconfigured.

Regards,
-- 
per aspera ad upstream

