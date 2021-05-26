Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 038E6391A35
	for <lists+nbd@lfdr.de>; Wed, 26 May 2021 16:30:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BAAD4204EF; Wed, 26 May 2021 14:30:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 26 14:30:13 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 7D175201EB
	for <lists-other-nbd@bendel.debian.org>; Wed, 26 May 2021 14:14:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, USER_IN_DEF_DKIM_WL=-7.5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id u_r--P9jo0Uy for <lists-other-nbd@bendel.debian.org>;
	Wed, 26 May 2021 14:14:03 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by bendel.debian.org (Postfix) with ESMTP id 81C27204EF
	for <nbd@other.debian.org>; Wed, 26 May 2021 14:14:03 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	by linux.microsoft.com (Postfix) with ESMTPSA id 52D2120B8010
	for <nbd@other.debian.org>; Wed, 26 May 2021 07:14:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 52D2120B8010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1622038440;
	bh=Hlv5sVjAjS61KZitQI4F9HNXJAk2eb1GHkwnsjqNczM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XijCPxjbXsVWuQd5w2/NKKrCDn1KFc1qqftWyVwwLldTOLNwQ1VAdsdqSsWs1yuhl
	 +WpTSEF55jXChbTVJiPdsBZ56vXgEKHtLqfGflnoH5SyRHaqRn9mKejgb55jG04WEa
	 aT29+eAbifRmlgC3ORqSqAMc0/MoxlatKxJ+NMFE=
Received: by mail-pj1-f45.google.com with SMTP id b15-20020a17090a550fb029015dad75163dso437966pji.0
        for <nbd@other.debian.org>; Wed, 26 May 2021 07:14:00 -0700 (PDT)
X-Gm-Message-State: AOAM533CnQ7a46g5cCrJZ9itTBOoDOk52ORJV5MlpoJzCBN46Ekr+wyr
	TieLSdKgqcGSBKwvSp4MciDKSL1VrdswcjLoLFM=
X-Google-Smtp-Source: ABdhPJy7mWPbmKxQg3/RQzr4uqXII36pbymjkkiQuMGs+L2mrLJuRksCyOGyyVNyAYM/bMeHO4FGyF30cYDf5+Y2+UU=
X-Received: by 2002:a17:90a:7892:: with SMTP id x18mr3472341pjk.39.1622038439875;
 Wed, 26 May 2021 07:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210429102828.31248-1-prasanna.kalever@redhat.com>
 <YKMKdHPFCNhR1SXx@T590> <CANwsLLH0HyZ-VGPMc+VmuLivG1fiZHnSqUyLx3UWb76ZMCgYSg@mail.gmail.com>
 <CAFnufp3ZzrKHiV1Vy9_bAymy0oEr288dL4yWo4EjqUzhJV6J-A@mail.gmail.com>
In-Reply-To: <CAFnufp3ZzrKHiV1Vy9_bAymy0oEr288dL4yWo4EjqUzhJV6J-A@mail.gmail.com>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Wed, 26 May 2021 16:13:23 +0200
X-Gmail-Original-Message-ID: <CAFnufp0V7X_nvN3RGK-C0AXappQ+qjMS_rb7iQhcjT8E0OVpzA@mail.gmail.com>
Message-ID: <CAFnufp0V7X_nvN3RGK-C0AXappQ+qjMS_rb7iQhcjT8E0OVpzA@mail.gmail.com>
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
Resent-Message-ID: <BEIPKzzg-ZN.A.4XD.1tlrgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1168
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAFnufp0V7X_nvN3RGK-C0AXappQ+qjMS_rb7iQhcjT8E0OVpzA@mail.gmail.com
Resent-Date: Wed, 26 May 2021 14:30:13 +0000 (UTC)

On Wed, May 19, 2021 at 4:33 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
>
> On Tue, May 18, 2021 at 9:52 AM Prasanna Kalever <pkalever@redhat.com> wrote:
> > > BTW, loop has similar issue, and patch of 'block: add a sequence number to disks'
> > > is added for addressing this issue, what do you think of that generic
> > > approach wrt. this nbd's issue? such as used the exposed sysfs sequence number
> > > for addressing this issue?
> > >
> > > https://lore.kernel.org/linux-block/YH81n34d2G3C4Re+@gardel-login/#r
> >
> > If I understand the changes and the background of the fix correctly, I
> > think with that fix author is trying to monotonically increase the seq
> > number and add it to the disk on every single device map/attach and
> > expose it through the sysfs, which will help the userspace processes
> > further to correlate events for particular and specific devices that
> > reuse the same loop device.
> >
>
> Yes, but nothing prevents to use diskseq in nbd, and increase it on reconfigure.
> That would allow to detect if the device has been reconfigured.
>
> Regards,
> --
> per aspera ad upstream

FYI: I just sent a v2 of the diskseq change

https://lore.kernel.org/linux-block/20210520135622.44625-1-mcroce@linux.microsoft.com/

-- 
per aspera ad upstream

